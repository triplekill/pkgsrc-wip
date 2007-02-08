# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.MyServer
PKG_SUPPORTED_OPTIONS=	control

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mcontrol)
CONFIGURE_ARGS+=	--enable-control
PLIST_SRC+=		${PKGDIR}/PLIST.control
.include "../../x11/fltk/buildlink3.mk"
.endif
