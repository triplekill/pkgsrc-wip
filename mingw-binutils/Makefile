# $NetBSD$
# $Id: Makefile,v 1.2 2003/11/30 23:56:27 mpasternak Exp $

DISTNAME=		binutils-2.14.90-20030807-1-src
PKGNAME=		mingw-${DISTNAME:S/-20030807-1-src//}
CATEGORIES=		devel

post-install:
	${LN} -s ${PREFIX}/bin/${MINGWTARGET}-windres ${PREFIX}/${MINGWTARGET}/bin/windres

.include "../../wip/mingw/Makefile.common"
.include "../../mk/bsd.pkg.mk"
