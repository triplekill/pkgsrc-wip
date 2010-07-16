# $NetBSD$
#

PKG_OPTIONS_VAR=	PKG_OPTIONS.ibus-pinyin
PKG_SUPPORTED_OPTIONS=	lua
#PKG_SUGGESTED_OPTIONS=	lua

.include "../../mk/bsd.options.mk"

PLIST_VARS+=	lua

#
# Lua extension
#
.if !empty(PKG_OPTIONS:Mlua)
.include "../../lang/lua/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-lua
PLIST.lua=		yes
.else
CONFIGURE_ARGS+=	--disable-lua
.endif
