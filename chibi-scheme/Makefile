# $NetBSD$

DISTNAME=	chibi-scheme-0.7.3
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=ashinn/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://synthcode.com/wiki/chibi-scheme
COMMENT=	Minimal Scheme Implementation for use as an Extension Language
LICENSE=	modified-bsd

USE_TOOLS+=	gmake pkg-config

PKGCONFIG_OVERRIDE+=	chibi-scheme.pc.in

REPLACE_INTERPRETER+=		chibi-scheme
REPLACE.chibi-scheme.old=	chibi-scheme
REPLACE.chibi-scheme.new=	${PREFIX}/bin/chibi-scheme
REPLACE_FILES.chibi-scheme=	tools/chibi-doc tools/chibi-ffi tools/snow-chibi

CFLAGS.NetBSD+=	-D_KMEMUSER	# Needed for kinfo_proc in <sys/sysctl.h>

# XXX: Avoid `gmake: write error: stdout' error during the install phase
INSTALL_MAKE_FLAGS+=	-s
MAKE_ENV+=		MANDIR=${PREFIX}/${PKGMANDIR}/man1
MAKE_ENV+=		PREFIX=${PREFIX}

TEST_TARGET=	test

.include "../../mk/bsd.pkg.mk"
