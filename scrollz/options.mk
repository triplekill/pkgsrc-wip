# $NetBSD$

PKG_OPTIONS_VAR=		PKG_OPTIONS.scrollz
PKG_SUPPORTED_OPTIONS=		efence inet6 regexp utf8
PKG_SUGGESTED_OPTIONS+=		efence inet6
PKG_OPTIONS_OPTIONAL_GROUPS=	socks ssl
PKG_OPTIONS_GROUP.socks=	socks4 socks5
PKG_OPTIONS_GROUP.ssl=		gnutls openssl

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mefence)
.include "../../devel/electric-fence/buildlink3.mk"
CONFIGURE_ARGS+=	--with-efence
.else
CONFIGURE_ARGS+=	--disable-efence
.endif

.if !empty(PKG_OPTIONS:Mgnutls)
.include "../../security/gnutls/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-fish --with-ssl
.else
CONFIGURE_ARGS+=	--disable-fish --without-ssl
.endif

.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if !empty(PKG_OPTIONS:Mopenssl)
.include "../../security/openssl/buildlink3.mk"
CONFIGURE_ARGS+=	--disable-fish --with-openssl
.else
CONFIGURE_ARGS+=	--without-openssl
.endif

.if !empty(PKG_OPTIONS:Mregexp)
CONFIGURE_ARGS+=	--enable-regexp
.else
CONFIGURE_ARGS+=	--disable-regexp
.endif

.if !empty(PKG_OPTIONS:Msocks4)
.include "../../net/socks4/buildlink3.mk"
CONFIGURE_ARGS+=	--with-socks4=${BUILDLINK_PREFIX.socks4}
.else
CONFIGURE_ARGS+=	--disable-socks4
.endif

.if !empty(PKG_OPTIONS:Msocks5)
.include "../../net/socks5/buildlink3.mk"
CONFIGURE_ARGS+=	--with-socks5=${BUILDLINK_PREFIX.socks5}
.else
CONFIGURE_ARGS+=	--disable-socks5
.endif

.if !empty(PKG_OPTIONS:Mutf8)
.include "../../converters/libiconv/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-utf8
LIBS+=			-liconv
.else
CONFIGURE_ARGS+=	--disable-utf8
.endif
