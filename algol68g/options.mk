# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.a68g
PKG_SUPPORTED_OPTIONS=	plotutils pgsql
PKG_SUGGESTED_OPTIONS=	plotutils pgsql

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mplotutils)
.  include "../../graphics/plotutils/buildlink3.mk"
CONFIGURE_ARGS+=	--with-plotutils
.else
CONFIGURE_ARGS+=	--without-plotutils
.endif

# It seems that when including PostgreSQL support it doesn't actually
# need to have it installed at build time, just at run time.
# So maybe this DEPENDS is undesirable.
.if !empty(PKG_OPTIONS:Mpgsql)
CONFIGURE_ARGS+=	--with-pgsql
.else
CONFIGURE_ARGS+=	--without-pgsql
.endif
