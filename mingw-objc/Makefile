# $NetBSD$
# $Id: Makefile,v 1.2 2003/11/30 23:56:27 mpasternak Exp $

DISTNAME=		gcc-objc-3.3.1-20030804-1-src
PKGNAME=		mingw-${DISTNAME:S/-20030804-1-src//:S/gcc-//}
WRKSRC=			${WRKDIR}/${DISTNAME:S/-objc//:S/-src//}
CATEGORIES=		devel
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} \
			${MINGWCCOREDISTFILE}${EXTRACT_SUFX}

PATCHDIR=		${.CURDIR}/../mingw-g++/patches

.include "../../wip/mingw/Makefile.common"
.include "../../mk/bsd.pkg.mk"
