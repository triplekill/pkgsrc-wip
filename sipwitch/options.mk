# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.sipwitch
PKG_SUPPORTED_OPTIONS=	qt
PKG_SUGGESTED_OPTIONS=	# blank
PLIST_VARS=		qt

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mqt)
.include "../../x11/qt4-tools/buildlink3.mk"
PLIST.qt=		yes
.endif
