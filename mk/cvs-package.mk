# $Id: cvs-package.mk,v 1.38 2011/10/06 03:57:03 makoto Exp $
#
# Please update svn-package.mk as well. It is brother Makefile frags.
#
# This file provides simple access to CVS repositories, so that packages
# can be created from CVS instead of from released tarballs. Whenever a
# package is fetched from CVS, an archive is created from it and saved
# in ${DISTDIR}/cvs-packages, to save bandwidth.
#
# === User-settable variables ===
#
# CHECKOUT_DATE
#	Date to check out in ISO format (YYYY-MM-DD).
#
# === Package-settable variables ===
#
# A package using this file shall define the following variables:
#
# CVS_REPOSITORIES
#	A list of unique identifiers. For each of those identifiers, the
#	following variables define the details of how to access the
#	CVS repository.
#
#	CVS_ROOT must be defined.
#
# CVS_ROOT.${id}
#	The CVSROOT for the CVS repository, including anoncvs password,
#	if applicable.
#
#	Examples:
#		${CVS_ROOT_GNU}/emacs
#		:pserver:anoncvs:@anoncvs.example.com:/cvsroot/project
#
# CVS_MODULE.${id}
#	The CVS module to check out.
#
#	Default value: ${id}
#
# CVS_DISTBASE.${id}
#	The prefix for cached archive file name.
#
#	Default value: ${PKGBASE}-${CVS_MODULE.${repo}}
#
# It may define the following variables:
#
# CVS_TAG.${id}
#	Overridable CVS tag for a repository.
#
#	Default: ${CVS_TAG} (today at midnight)
#
# CVS_TAG
#	The default CVS tag that is checked out. May be overridden by
#	CVS_TAG.${id}.
#
#	Default value: today at midnight.
#
# CVS_PROJECT
#	The project name to be used in CVS_ROOT_SOURCEFORGE.
#
#	Default: ${PKGBASE}
#
# === Variables defined here ===
#
# This file defines the following variables:
#
# CVS_ROOT_GNU
# CVS_ROOT_NONGNU
# CVS_ROOT_SOURCEFORGE
#	Common CVS repository locations for use in the CVS_ROOT
#	variables.
#
# It also provides default values for the following variables, differing
# from the system-wide defaults:
#
# DISTFILES
#	Is set to an empty list, since that is the right choice for most
#	of the CVS packages.
#
# PKGNAME
#	Is set to consist of the package name from DISTNAME, combined
#	with the current date. This is useful when no CVS_TAG variables
#	are defined. When they are defined (and there may be multiple
#	ones), the package author should define PKGNAME explicitly.
#
# PKGREVISION
#	If PKGREVISION is not set, set it to today's date.  This is
#	useful for packages that automatically grab the latest code
#	from CVS every time they are built.
#
# Keywords: cvs
#

.if !defined(_PKG_MK_CVS_PACKAGE_MK)
_PKG_MK_CVS_PACKAGE_MK=	# defined

#
# defaults for user-visible input variables
#

DISTFILES?=		# empty
PKGNAME?=		${DISTNAME:C,-[0-9].*,,}-cvs-${_CVS_PKGVERSION}
# Enforce PKGREVISION unless CVS_TAG is set
.if empty(CVS_TAG)
. if defined(CHECKOUT_DATE)
PKGREVISION?=		$(CHECKOUT_DATE:S/-//g)
. else
PKGREVISION?=		$(_CVS_PKGVERSION:S/.//g)
. endif
.endif

#
# definition of user-visible output variables
#

# commonly used repositories
CVS_ROOT_GNU=		:pserver:anonymous:@cvs.savannah.gnu.org:/sources
CVS_ROOT_NONGNU=	${CVS_ROOT_GNU}
CVS_ROOT_SOURCEFORGE=	:pserver:anonymous:@${CVS_PROJECT}.cvs.sourceforge.net:/cvsroot/${CVS_PROJECT}
CVS_PROJECT?=		${PKGBASE}

#
# End of the interface part. Start of the implementation part.
#

#
# Input validation
#

.if !defined(CVS_REPOSITORIES)
PKG_FAIL_REASON+=	"[cvs-package.mk] CVS_REPOSITORIES must be set."
CVS_REPOSITORIES?=	# none
.endif

.for repo in ${CVS_REPOSITORIES}
.  if !defined(CVS_ROOT.${repo})
PKG_FAIL_REASON+=	"[cvs-package.mk] CVS_ROOT."${repo:Q}" must be set."
.  endif
.endfor

#
# Internal variables
#

USE_TOOLS+=		date pax

_CVS_RSH=		ssh
_CVS_CMD=		cvs
_CVS_ENV=		# empty
_CVS_ENV+=		CVS_PASSFILE=${_CVS_PASSFILE}
_CVS_ENV+=		CVS_RSH=${_CVS_RSH:Q}
_CVS_FLAGS=		-q -z3
_CVS_CHECKOUT_FLAGS=	-P
_CVS_PASSFILE=		${WRKDIR}/.cvs_passwords
_CVS_TODAY_CMD=		${DATE} -u +'%Y-%m-%d'
_CVS_TODAY=		${_CVS_TODAY_CMD:sh}
_CVS_PKGVERSION_CMD=	${DATE} -u +'%Y.%m.%d'
_CVS_PKGVERSION=	${_CVS_PKGVERSION_CMD:sh}
_CVS_DISTDIR=		${DISTDIR}/cvs-packages

#
# Generation of repository-specific variables
#

# determine appropriate checkout date or tag
.for repo in ${CVS_REPOSITORIES}
CVS_MODULE.${repo}?=	${repo}

# determine appropriate checkout date or tag
.  if defined(CVS_TAG.${repo})
_CVS_TAG_FLAG.${repo}=	-r${CVS_TAG.${repo}}
_CVS_TAG.${repo}=	${CVS_TAG.${repo}}
.  elif defined(CVS_TAG)
_CVS_TAG_FLAG.${repo}=	-r${CVS_TAG}
_CVS_TAG.${repo}=	${CVS_TAG}
.  elif defined(CHECKOUT_DATE)
_CVS_TAG_FLAG.${repo}=	-D${CHECKOUT_DATE:Q}
_CVS_TAG.${repo}=	${CHECKOUT_DATE:Q}
.  else
_CVS_TAG_FLAG.${repo}=	'-D${_CVS_TODAY} 00:00 +0000'
_CVS_TAG.${repo}=	${_CVS_TODAY:Q}
.  endif

_CVS_TMP_RESULT.${repo}=	'/tmp/cvs-${CVS_MODULE.${repo}}-update'

# Cache support:
.  if !defined(NO_CVS_CACHE.${repo}) \
   || defined(NO_CVS_CACHE.${repo}) && empty(NO_CVS_CACHE.${repo}:M[Yy][Ee][Ss])
#   cache file name
.  if !defined(CVS_DISTBASE.${repo})
CVS_DISTBASE.${repo}=	${CVS_MODULE.${repo}}
.  endif
_CVS_DISTFILE.${repo}=	${CVS_DISTBASE.${repo}}-${_CVS_TAG.${repo}}.tar.gz

#   command to extract cache file
_CVS_EXTRACT_CACHED.${repo}=	\
	p="$$(ls -td ${_CVS_DISTDIR}/${CVS_DISTBASE.${repo}}-*.tar.gz | head -n 1)";	\
	if [ -n "$$p" ]; then						\
	  ${STEP_MSG} "(1) Extracting cached CVS archive \"""$$p\".";	\
	  pax -r -z -f "$$p";				\
	else								\
	  ${STEP_MSG} "(1a) No cache file found.";			\
	fi

_CVS_CHECK_UPDATE.${repo}=     \
	"$$(grep ^[ADMU] ${_CVS_TMP_RESULT.${repo}} | head -n 1)"

#   create cache archive
_CVS_CREATE_CACHE.${repo}=	\
	${STEP_MSG} "(5) Creating cached CVS archive "${_CVS_DISTFILE.${repo}:Q}"."; \
	${MKDIR} ${_CVS_DISTDIR:Q};							\
	pax -w -z -f ${_CVS_DISTDIR}/${_CVS_DISTFILE.${repo}:Q} ${CVS_MODULE.${repo}:Q}
.  endif
.endfor

pre-extract: do-cvs-extract

do-cvs-extract: .PHONY
.for repo in ${CVS_REPOSITORIES}
	${RUN} cd ${WRKDIR};						\
	if [ ! -d ${_CVS_DISTDIR} ]; then mkdir -p ${_CVS_DISTDIR:Q}; fi;	\
	${_CVS_EXTRACT_CACHED.${repo}};					\
	case ${CVS_ROOT.${repo}:Q} in					\
	  :pserver:*)							\
	    [ -f ${_CVS_PASSFILE} ] || ${TOUCH} ${_CVS_PASSFILE};	\
	    ${STEP_MSG} "Logging in to "${CVS_ROOT.${repo}:Q}".";	\
	    ${SETENV} ${_CVS_ENV} ${_CVS_CMD} ${_CVS_FLAGS}		\
		-d ${CVS_ROOT.${repo}:Q} login				\
	  ;;								\
	  *) ;;								\
	esac;								\
	${STEP_MSG} "(2) Downloading "${CVS_MODULE.${repo}:Q}" from "${CVS_ROOT.${repo}:Q}"."; \
	${SETENV} ${_CVS_ENV}						\
		${_CVS_CMD}						\
			${_CVS_FLAGS}					\
			-d						\
			${CVS_ROOT.${repo}:Q}				\
			checkout ${_CVS_CHECKOUT_FLAGS}			\
			${_CVS_TAG_FLAG.${repo}}			\
			-d ${repo} 					\
			${CVS_MODULE.${repo}:Q} > ${_CVS_TMP_RESULT.${repo}};	\
	if [	!  "$$p" = 0	];then					\
	  if [	  ! -z ${_CVS_TMP_RESULT.${repo}} ];then		\
	    if [    -n ${_CVS_CHECK_UPDATE.${repo}} ]; then		\
	${_CVS_CREATE_CACHE.${repo}};					\
	    else							\
	${STEP_MSG} "(6a) Skip creating cache file for no update.";	\
	    fi;								\
	  else								\
	${STEP_MSG} "(6b) Skip creating cache file.";			\
	  fi;								\
	else								\
	${STEP_MSG} "(6c) Skip creating cache file for no update.";	\
	fi;
.endfor

.endif
