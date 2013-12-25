# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.pyglet
PKG_SUPPORTED_OPTIONS=	alsa openal
PKG_SUGGESTED_OPTIONS+=	openal

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Malsa)
.include "../../audio/alsa-lib/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mopenal)
.include "../../audio/openal/buildlink3.mk"
.endif
