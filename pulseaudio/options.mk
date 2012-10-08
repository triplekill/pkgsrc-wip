# $NetBSD: options.mk,v 1.3 2011/04/01 15:46:04 ahoka Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.pulseaudio
PKG_SUPPORTED_OPTIONS=	avahi x11
PKG_SUGGESTED_OPTIONS=	avahi x11
PLIST_VARS+=		${PKG_SUPPORTED_OPTIONS}
.include "../../mk/bsd.options.mk"

###
### avahi
###
.if !empty(PKG_OPTIONS:Mavahi)
.include "../../net/avahi/buildlink3.mk"
PLIST.avahi=		yes
.else
CONFIGURE_ARGS+=	--disable-avahi
.endif

###
### X11
###
.if !empty(PKG_OPTIONS:Mx11)
.include "../../x11/libICE/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
PLIST.x11=		yes
.else
CONFIGURE_ARGS+=	--disable-x11
.endif

