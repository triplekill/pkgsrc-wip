# $NetBSD$
#

#
# Helper file to access the bazaar repository, download translations and font
# files, and generate the configure script with autogen.sh.
#

USE_TOOLS+=		ftp
BUILD_DEPENDS+=		bzr>=1.0:../../devel/bzr
BUILD_DEPENDS+=		rsync>=3.0:../../net/rsync
BUILD_DEPENDS+=		autogen>=5.9:../../devel/autogen

DISTFILES?=		# empty
BZR_REPOSITORY=		http://bzr.savannah.gnu.org/r/grub/trunk/grub
BZR_REVISION=		3273
UNIFONT_URL=		http://unifoundry.com/unifont-5.1.20080820.pcf.gz
UNIFONT_EXT=		pcf.gz

pre-extract: do-bzr-extract

.PHONY: do-bzr-extract
do-bzr-extract:
	${RUN} set -e;								\
	cd ${WRKDIR};								\
	${STEP_MSG} "Exporting from bazaar repository "${BZR_REPOSITORY};	\
	bzr export -r ${BZR_REVISION} ${DISTNAME} ${BZR_REPOSITORY}

post-extract: do-extra-downloads

.PHONY: do-extra-downloads
do-extra-downloads:
	cd ${WRKSRC} && rsync -Lrtvz translationproject.org::tp/latest/grub/ po
	cd ${WRKSRC}/po && (ls *.po | sed -e 's,\.po$$,,') > LINGUAS
.if !empty(PKG_OPTIONS:Mfreetype)
	cd ${WRKSRC} && ftp -o unifont.${UNIFONT_EXT} ${UNIFONT_URL}
.endif

pre-configure: do-autogen

.PHONY: do-autogen
do-autogen:
	cd ${WRKSRC} && ./autogen.sh

# Python is used to generate the autogen makefile template.
PYTHON_FOR_BUILD_ONLY=	yes
REPLACE_PYTHON=		gentpl.py
SUBST_CLASSES+=		fix-py
SUBST_STAGE.fix-py=	post-patch
SUBST_MESSAGE.fix-py=	Replacing python executable in autogen.sh.
SUBST_FILES.fix-py=	autogen.sh conf/Makefile.common
SUBST_SED.fix-py=	-e 's,^\([	]*\)python ,\1${PYTHONBIN} ,g'

.include "../../lang/python/application.mk"
