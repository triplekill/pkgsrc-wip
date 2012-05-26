# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.swftools
PKG_SUPPORTED_OPTIONS=	lame

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mlame)
CONFIGURE_ARGS+=	--enable-lame
BUILDLINK_INCDIRS.lame=	include/lame
.include "../../audio/lame/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-lame
.endif
