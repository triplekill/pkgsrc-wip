# $NetBSD$

DISTNAME=	jemalloc-3.6.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=jemalloc/}
GITHUB_PROJECT=	jemalloc

HOMEPAGE=	http://www.canonware.com/jemalloc/
COMMENT=	Library jemalloc is a general purpose malloc(3) implementation
LICENSE=	2-clause-bsd

BUILD_DEPENDS+=		libxslt-[0-9]*:../../textproc/libxslt
BUILD_DEPENDS+=		docbook-xsl-[0-9]*:../../textproc/docbook-xsl

USE_TOOLS+=		autoconf automake aclocal gmake
USE_LANGUAGES=		c
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-cc-silence
CONFIGURE_ARGS+=	--enable-xmalloc
CONFIGURE_ARGS+=	--disable-shared
CONFIGURE_ARGS+=        --with-xslroot=${LOCALBASE}/share/xsl/docbook/

USE_TOOLS+=		perl:run
REPLACE_PERL=		bin/jepprof

BUILD_TARGET=		all dist

pre-configure:
	cd ${WRKSRC} && ./autogen.sh
	cd ${WRKSRC} && mv bin/pprof bin/jepprof

.include "../../mk/bsd.pkg.mk"
