# $NetBSD$
# $Id$

DISTNAME=		w32api-2.4
PKGNAME=		mingw-${DISTNAME}
WRKSRC=			${WRKDIR}
CATEGORIES=		cross

NO_BUILD=		yes
NO_CONFIGURE=		yes

do-install:
	cd ${WRKSRC} && ${PAX} -rw -pe include lib ${PREFIX}/${MINGWTARGET}

.include "../../wip/mingw/Makefile.common"
