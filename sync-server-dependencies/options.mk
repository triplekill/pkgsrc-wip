# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.sync-server-dependencies
PKG_SUPPORTED_OPTIONS=	apache
PKG_SUGGESTED_OPTIONS=	apache

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mapache)
DEPENDS+=	${APACHE_PKG_PREFIX}-${PYPKGPREFIX}-wsgi-[0-9]*:../../www/ap2-wsgi
.include "../../mk/apache.mk"
.endif
