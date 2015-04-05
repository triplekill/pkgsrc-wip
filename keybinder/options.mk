# $NetBSD: $

PKG_OPTIONS_VAR=		PKG_OPTIONS.keybinder
PKG_SUPPORTED_OPTIONS=		doc lua python
PKG_SUGGESTED_OPTIONS=		python

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mdoc)
.include "../../textproc/gtk-doc/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-gtk-doc
PLIST_SRC+=		PLIST.gtkdoc
.else
CONFIGURE_ARGS+=	--disable-gtk-doc
.endif

.if !empty(PKG_OPTIONS:Mlua)
.include "../../lang/lua51/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-lua
PLIST_SRC+=		PLIST.lua
.else
CONFIGURE_ARGS+=	--disable-lua
.endif

.if !empty(PKG_OPTIONS:Mpython)
PY_PATCHPLIST=		yes
PYTHON_VERSIONS_INCOMPATIBLE=	33 34
.include "../../lang/python/extension.mk"
.include "../../x11/py-gtk2/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-python
PLIST_SRC+=		PLIST.python
.else
CONFIGURE_ARGS+=	--disable-python
.endif
