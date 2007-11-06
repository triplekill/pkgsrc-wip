# $Id: cvs-package.mk,v 1.22 2007/09/11 21:26:08 rillig Exp $

# This file provides simple access to CVS repositories, so that packages
# can be created from CVS instead of from released tarballs. Whenever a
# package is fetched from CVS, an archive is created from it and saved
# in ${DISTDIR}/cvs-packages, to save bandwidth.
#
# === Package-settable variables ===
#
# CVS_REPOSITORIES
#	A list of unique identifiers. For each of those identifiers, the
#	following variables define the details of how to access the
#	CVS repository.
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
# Keywords: cvs
#

.if !defined(_PKG_MK_CVS_PACKAGE_MK)
_PKG_MK_CVS_PACKAGE_MK=	# defined

#
# defaults for user-visible input variables
#

DISTFILES?=		# empty
PKGNAME?=		${DISTNAME:C,-[0-9].*,,}-cvs-${_CVS_PKGVERSION}

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

.for r in ${CVS_REPOSITORIES}
.  if !defined(CVS_ROOT.${r})
PKG_FAIL_REASON+=	"[cvs-package.mk] CVS_ROOT.${r} must be set."
.  endif
.endfor

#
# Internal variables
#

USE_TOOLS+=		date

_CVS_RSH=		ssh
_CVS_CMD=		cvs
_CVS_ENV=		# empty
_CVS_ENV+=		CVS_PASSFILE=${_CVS_PASSFILE}
_CVS_ENV+=		CVS_RSH=${_CVS_RSH:Q}
_CVS_FLAGS=		-Q
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

.for r in ${CVS_REPOSITORIES}
CVS_MODULE.${r}?=		${r}
.  if defined(CVS_TAG.${r})
_CVS_TAG_FLAG.${r}=	-r${CVS_TAG.${r}}
_CVS_TAG.${r}=		${CVS_TAG.${r}}
.  elif defined(CVS_TAG)
_CVS_TAG_FLAG.${r}=	-r${CVS_TAG}
_CVS_TAG.${r}=		${CVS_TAG}
.  else
_CVS_TAG_FLAG.${r}=	-D${_CVS_TODAY}T00:00+0
_CVS_TAG.${r}=		${_CVS_TODAY:Q}
.  endif
_CVS_DISTFILE.${r}=	${PKGBASE}-${CVS_MODULE.${r}}-${_CVS_TAG.${r}}.tar.gz
.endfor

pre-extract: do-cvs-extract

.PHONY: do-cvs-extract
do-cvs-extract:
.for r in ${CVS_REPOSITORIES}
	${RUN} cd ${WRKDIR};						\
	if [ -f ${_CVS_DISTDIR}/${_CVS_DISTFILE.${r}:Q} ]; then		\
	  ${STEP_MSG} "Extracting cached CVS archive "${_CVS_DISTFILE.${r}:Q}"."; \
	  ${PAX} -r -z -f ${_CVS_DISTDIR}/${_CVS_DISTFILE.${r}:Q};	\
	  exit 0;							\
	fi;								\
	case ${CVS_ROOT.${r}:Q} in					\
	  :pserver:*)							\
	    [ -f ${_CVS_PASSFILE} ] || ${TOUCH} ${_CVS_PASSFILE};	\
	    ${STEP_MSG} "Logging in to "${CVS_ROOT.${r}:Q}".";		\
	    ${SETENV} ${_CVS_ENV} ${_CVS_CMD} ${_CVS_FLAGS} 		\
		-d ${CVS_ROOT.${r}:Q} login				\
	  ;;								\
	  *) ;;								\
	esac;								\
	${STEP_MSG} "Downloading "${CVS_MODULE.${r}:Q}" from "${CVS_ROOT.${r}:Q}"."; \
	${SETENV} ${_CVS_ENV}						\
	  ${_CVS_CMD} ${_CVS_FLAGS} -d ${CVS_ROOT.${r}:Q}		\
	    checkout ${_CVS_CHECKOUT_FLAGS} ${_CVS_TAG_FLAG.${r}:Q}	\
	      -d ${r} ${CVS_MODULE.${r}:Q};				\
	${STEP_MSG} "Creating cached CVS archive "${_CVS_DISTFILE.${r}:Q}"."; \
	${MKDIR} ${_CVS_DISTDIR:Q};					\
	${PAX} -w -z -f ${_CVS_DISTDIR}/${_CVS_DISTFILE.${r}:Q} ${r}
.endfor

.endif
