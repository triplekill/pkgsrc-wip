# $NetBSD$

PKG_OPTIONS_VAR=       PKG_OPTIONS.node
PKG_SUPPORTED_OPTIONS= openssl dtrace
PKG_SUGGESTED_OPTIONS= openssl

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mdtrace)
CONFIGURE_ARGS+=       --with-dtrace
PLIST.dtrace=          yes
.endif

.if !empty(PKG_OPTIONS:Mopenssl)
.include "../../security/openssl/buildlink3.mk"
.else
CONFIGURE_ARGS+=       --without-openssl
.endif
