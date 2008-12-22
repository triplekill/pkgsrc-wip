# $Id: svn-package.mk,v 1.7 2008/12/22 16:46:08 asau Exp $

# This file provides simple access to Subversion repositories, so that packages
# can be created from Subversion instead of from released tarballs.
#
# === Package-settable variables ===
#
# A package using this file shall define the following variables:
#
# SVN_REPOSITORIES
#	A list of unique identifiers. For each of those identifiers, the
#	following variables define the details of how to access the
#	Subversion repository.
#
#	SVN_ROOT must be defined.
#
# SVN_ROOT.${id}
#	The SVNROOT for the SVN repository, including anonsvn password,
#	if applicable.
#
# SVN_MODULE.${id}
#	The SVN module to check out.
#
#	Default value: ${id}
#
# It may define the following variables:
#
# SVN_CERTS
#	Files holding SSL certificates of the svn servers.
#
# SVN_TAG.${id}
#	Overridable SVN tag for a repository.
#
#	Default: ${SVN_TAG} (today at midnight)
#
# SVN_TAG
#	The default SVN tag that is checked out. May be overridden by
#	SVN_TAG.${id}.
#
#	Default value: today at midnight.
#
# === Variables defined here ===
#
# This file defines the following variables:
#
# SVN_ROOT_SOURCEFORGE
#	Common SVN repository locations for use in the SVN_ROOT
#	variables.
#
# It also provides default values for the following variables, differing
# from the system-wide defaults:
#
# DISTFILES
#	Is set to an empty list, since that is the right choice for most
#	of the Subversion packages.
#
# Keywords: subversion
#

.if !defined(_PKG_MK_SVN_PACKAGE_MK)
_PKG_MK_SVN_PACKAGE_MK=	# defined

BUILD_DEPENDS+=		subversion-base>=1.0:../../devel/subversion-base

#
# defaults for user-visible input variables
#

DISTFILES?=		# empty

#
# definition of user-visible output variables
#

# commonly used repositories
SVN_ROOT_SOURCEFORGE=	https://svn.sourceforge.net/svnroot

#
# End of the interface part. Start of the implementation part.
#

#
# Input validation
#

.if !defined(SVN_REPOSITORIES)
PKG_FAIL_REASON+=	"[svn-package.mk] SVN_REPOSITORIES must be set."
SVN_REPOSITORIES?=	# none
.endif

.for repo in ${SVN_REPOSITORIES}
.  if !defined(SVN_ROOT.${repo})
PKG_FAIL_REASON+=	"[svn-package.mk] SVN_ROOT."${repo:Q}" must be set."
.  endif
.endfor

#
# Internal variables
#

USE_TOOLS+=		date pax

_SVN_RSH=		ssh
_SVN_CMD=		svn
_SVN_ENV=		# empty
_SVN_ENV+=		SVN_RSH=${_SVN_RSH:Q}
_SVN_FLAGS=		-q
_SVN_CHECKOUT_FLAGS=	--config-dir=${_SVN_CONFIG_DIR} --non-interactive
_SVN_CONFIG_DIR=	${WRKDIR}/.subversion
_SVN_TODAY_CMD=		${DATE} -u +'%Y-%m-%d'
_SVN_TODAY=		${_SVN_TODAY_CMD:sh}
_SVN_PKGVERSION_CMD=	${DATE} -u +'%Y.%m.%d'
_SVN_PKGVERSION=	${_SVN_PKGVERSION_CMD:sh}
_SVN_DISTDIR=		${DISTDIR}/svn-packages

#
# Generation of repository-specific variables
#

.for repo in ${SVN_REPOSITORIES}
SVN_MODULE.${repo}?=	${repo}
.  if defined(SVN_TAG.${repo})
_SVN_TAG_FLAG.${repo}=	-r${SVN_TAG.${repo}}
_SVN_TAG.${repo}=	${SVN_TAG.${repo}}
.  elif defined(SVN_TAG)
_SVN_TAG_FLAG.${repo}=	-r${SVN_TAG}
_SVN_TAG.${repo}=	${SVN_TAG}
.  else
_SVN_TAG_FLAG.${repo}=	-r{${_SVN_TODAY} 00:00 +0000}
_SVN_TAG.${repo}=	${_SVN_TODAY}
.  endif
_SVN_DISTFILE.${repo}=	${PKGBASE}-${SVN_MODULE.${repo}}-${_SVN_TAG.${repo}}.tar.gz
.endfor

pre-extract: do-svn-extract

do-svn-extract: .PHONY
.if defined(SVN_CERTS) && !empty(SVN_CERTS)
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} -p ${_SVN_CONFIG_DIR}/auth/svn.ssl.server
	${_PKG_SILENT}${_PKG_DEBUG}${CP} ${SVN_CERTS:Q} ${_SVN_CONFIG_DIR}/auth/svn.ssl.server
.endif
.for repo in ${SVN_REPOSITORIES}
	${RUN} cd ${WRKDIR};						\
	if [ ! -d ${_SVN_DISTDIR} ]; then mkdir -p ${_SVN_DISTDIR:Q}; fi;	\
	if [ -f ${_SVN_DISTDIR}/${_SVN_DISTFILE.${repo}:Q} ]; then		\
	  ${STEP_MSG} "Extracting cached Subversion archive "${_SVN_DISTFILE.${repo}:Q}"."; \
	  pax -r -z -f ${_SVN_DISTDIR}/${_SVN_DISTFILE.${repo}:Q};	\
	  exit 0;							\
	fi;								\
	${STEP_MSG} "Downloading "${SVN_MODULE.${repo}:Q}" from "${SVN_ROOT.${repo}:Q}"."; \
	${SETENV} ${_SVN_ENV}						\
		${_SVN_CMD} checkout ${_SVN_CHECKOUT_FLAGS}		\
			${_SVN_TAG_FLAG.${repo}:Q}			\
			${_SVN_FLAGS}		 			\
			${SVN_ROOT.${repo}:Q}				\
			${SVN_MODULE.${repo}:Q};			\
	${STEP_MSG} "Creating cached Subversion archive "${_SVN_DISTFILE.${repo}:Q}"."; \
	${MKDIR} ${_SVN_DISTDIR:Q};					\
	pax -w -z -f ${_SVN_DISTDIR}/${_SVN_DISTFILE.${repo}:Q} ${repo}
.endfor

.endif
