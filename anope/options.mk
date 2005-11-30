# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.anope
PKG_SUPPORTED_OPTIONS=	mysql db-encryption

.include "../../mk/bsd.options.mk"

###
### Use MySQL for storing data
###
.if !empty(PKG_OPTIONS:Mmysql)
.	include "../../mk/mysql.buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-mysql
.endif

###
### Encrypt sensitive data in the database (only with mysql)
###
.if !empty(PKG_OPTIONS:Mmysql) && !empty(PKG_OPTIONS:Mdb-encryption)
CONFIGURE_ARGS+=	--with-encryption
.endif
