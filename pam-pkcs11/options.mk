# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.pam-pkcs11
PKG_SUPPORTED_OPTIONS=	pcsc-lite ldap

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mpcsc-lite)
.include "../../security/pcsc-lite/buildlink3.mk"
CONFIGURE_ARGS+=	--with-pcsclite
PLIST_SRC+=		PLIST.pcsc-lite
.endif

.if !empty(PKG_OPTIONS:Mldap)
.include "../../databases/openldap-client/buildlink3.mk"
CONFIGURE_ARGS+=	--with-ldap
PLIST_SRC+=		PLIST.ldap
.else
CONFIGURE_ARGS+=	--without-ldap
.endif
