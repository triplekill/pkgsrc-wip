# $NetBSD$
# $Id$

DISTNAME=		mingw-runtime-3.2
PKGNAME=		mingw-runtime-bin-3.2
WRKSRC=			${WRKDIR}
CATEGORIES=		cross

NO_BUILD=		yes
NO_CONFIGURE=		yes

do-install:
	cd ${WRKSRC} && ${PAX} -rw -pe bin include lib ${PREFIX}/${MINGWTARGET}

.include "../../wip/mingw/Makefile.common"
