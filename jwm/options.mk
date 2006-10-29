# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.jwm
PKG_SUPPORTED_OPTIONS=	debug nopng

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mdebug)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if !empty(PKG_OPTIONS:Mnopng)
CONFIGURE_ARGS+=	--disable-png
.else
CC+=			-lpng -lz
.endif
