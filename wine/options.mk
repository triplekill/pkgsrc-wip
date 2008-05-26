# $NetBSD: options.mk,v 1.7 2007/04/13 21:25:48 adam Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.wine
PKG_SUPPORTED_OPTIONS=	cups opengl sane ssl dbus x11 esound
PKG_SUGGESTED_OPTIONS=	opengl ssl x11 esound

.include "../../mk/bsd.options.mk"

PLIST_VARS+=	x11 opengl

.if !empty(PKG_OPTIONS:Mesound)
.include "../../audio/esound/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mldap)
.include "../../databases/openldap-client/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-ldap
.endif

.if !empty(PKG_OPTIONS:Mdbus)
.include "../../sysutils/dbus/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-dbus
.endif

.if !empty(PKG_OPTIONS:Mcups)
.include "../../print/cups/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-cups
.endif

.if !empty(PKG_OPTIONS:Mx11)
.include "../../x11/libICE/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXcursor/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/libXxf86vm/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/jpeg/buildlink3.mk"
.include "../../graphics/lcms/buildlink3.mk"
.include "../../graphics/libungif/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
PLIST.x11=	yes
.else
CONFIGURE_ARGS+=	--without-dbus
.endif

.if !empty(PKG_OPTIONS:Mssl)
.include "../../security/openssl/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-openssl
.endif

.if !empty(PKG_OPTIONS:Mopengl) && !empty(PKG_OPTIONS:Mx11)
.include "../../graphics/glu/buildlink3.mk"
.include "../../graphics/glut/buildlink3.mk"
PLIST.opengl=	yes
.else
CONFIGURE_ARGS+=	--without-opengl
.endif

.if !empty(PKG_OPTIONS:Msane)
.include "../../graphics/sane-backends/buildlink3.mk"
.endif
