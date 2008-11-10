# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.tacacs-shrubbery
PKG_SUPPORTED_OPTIONS=	acls-support drop-root-privileges tcpwrappers skey
PKG_SUGGESTED_OPTIONS=	acls-support drop-root-privileges tcpwrappers skey

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Macls-support)
CONFIGURE_ARGS+=	--enable-acls
.else
CONFIGURE_ARGS+=	--disable-acls
.endif

.if !empty(PKG_OPTIONS:Mdrop-root-privileges)
# tac_plus code requires numeric UID, GID
_TACACS_USER!=		${ID} -u nobody
_TACACS_GROUP!=		${ID} -g nobody
TACACS_USER?=		${_TACACS_USER}
TACACS_GROUP?=		${_TACACS_GROUP}
PKG_USERS=		${TACACS_USER}:${TACACS_GROUP}
PKG_GROUPS=		${TACACS_GROUP}
CONFIGURE_ARGS+=	--with-userid=${TACACS_USER:Q}
CONFIGURE_ARGS+=	--with-groupid=${TACACS_GROUP:Q}
.endif

.if !empty(PKG_OPTIONS:Mtcpwrappers)
CONFIGURE_ARGS+=	--with-libwrap=${BUILDLINK_PREFIX.tcp_wrappers}
. include "../../security/tcp_wrappers/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-libwrap
.endif

.if !empty(PKG_OPTIONS:Mskey)
CONFIGURE_ARGS+=	--with-skey=${BUILDLINK_PREFIX.skey}
. include "../../security/skey/builtin.mk"
. include "../../security/skey/buildlink3.mk"
. if (defined(IS_BUILTIN.skey) && ${IS_BUILTIN.skey} == no ) || ${OPSYS} == "OpenBSD"
# pkgsrc's version uses three arguments only, as does OpenBSD's
CPPFLAGS+=		-DOLDSKEY
. endif
.else
CONFIGURE_ARGS+=	--without-skey
.endif
