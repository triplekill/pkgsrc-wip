# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.sync-server-dependencies
PKG_SUPPORTED_OPTIONS=	apache
PKG_SUGGESTED_OPTIONS=	apache

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mapache)
DEPENDS+=	${PYPKGPREFIX}-mod_wsgi-[0-9]*:../../www/py-mod_wsgi
.include "../../mk/apache.mk"
.endif
