# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.callweaver
PKG_SUPPORTED_OPTIONS=	jabber mysql pgsql sipsecurity

.include "../../mk/bsd.options.mk"

PLIST_VARS+=		jabber mysql pgsql sipsecurity

.if !empty(PKG_OPTIONS:Mjabber)
.include "../../chat/loudmouth/buildlink3.mk"
PLIST.jabber=           yes
CONFIGURE_ARGS+=        --enable-jabber --with-res_jabber
.endif

.if !empty(PKG_OPTIONS:Mmysql)
.include "../../databases/mysql5-client/buildlink3.mk"
PLIST.mysql=		yes
CONFIGURE_ARGS+=	--enable-mysql --with-app_sql_mysql --with-cdr_mysql --with-res_config_mysql
.endif

.if !empty(PKG_OPTIONS:Mpgsql)
.include "../../databases/postgresql83-client/buildlink3.mk"
PLIST.pgsql=		yes
CONFIGURE_ARGS+=	--enable-postgresql --with-app_sql_postgres --with-cdr_pgsql --with-res_config_pgsql
.endif

.if !empty(PKG_OPTIONS:Msipsecurity)
PLIST.sipsecurity=	yes
CONFIGURE_ARGS+=	--enable-sip-tcp-support --enable-srtp
.endif
