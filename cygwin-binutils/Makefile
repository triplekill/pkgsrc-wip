# $NetBSD$
# $Id: Makefile,v 1.20 2008/07/26 13:58:55 obache Exp $

DISTNAME=	binutils-2.18
PKGNAME=	cygwin-${DISTNAME:S/-src//}
CATEGORIES=	cross
MASTER_SITES=	${MASTER_SITE_GNU:=binutils/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	makoto@ki.nu
HOMEPAGE=	http://www.cygwin.com/
COMMENT=	GNU binutils ported to Win32/Cygwin environment

PKG_DESTDIR_SUPPORT=	user-destdir

USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes
USE_CROSSBASE=		yes
USE_TOOLS+=		pax
INFO_FILES=		yes

post-install:
.for f in windres dllwrap
	${LN} -fs ${PREFIX}/bin/${CYGWIN_TARGET}-${f} \
                ${DESTDIR}${PREFIX}/${CYGWIN_TARGET}/bin/${f}
.endfor

.include "../../wip/cygwin/Makefile.common"
.include "../../mk/bsd.pkg.mk"
