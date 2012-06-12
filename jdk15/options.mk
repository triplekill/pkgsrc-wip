# $NetBSD$

PKG_OPTIONS_VAR=		PKG_OPTIONS.jdk15
PKG_SUPPORTED_OPTIONS=		inet6
PKG_SUGGESTED_OPTIONS=		inet6

#.include "../../www/seamonkey/gecko-options.mk"
.include "../../mk/bsd.options.mk"

.if empty(PKG_OPTIONS:Minet6)
MAKE_ENV+=		DONT_ENABLE_IPV6=YES
.endif
