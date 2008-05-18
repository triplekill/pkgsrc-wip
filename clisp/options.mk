# $NetBSD: options.mk,v 1.2 2008/04/12 22:43:02 jlam Exp $

PKG_OPTIONS_VAR=		PKG_OPTIONS.clisp

# this option is essential for some others to work:
PKG_SUPPORTED_OPTIONS+=		ffcall

PKG_SUPPORTED_OPTIONS+=		pgsql gdbm bdb pcre rawsock pari fastcgi wildcard gtk2 zlib
PKG_SUPPORTED_OPTIONS+=		readline

PKG_OPTIONS_OPTIONAL_GROUPS=	x11-bindings
PKG_OPTIONS_GROUP.x11-bindings=	mit-clx new-clx

PKG_SUPPORTED_OPTIONS+=		gmalloc

PKG_SUGGESTED_OPTIONS+=		ffcall pcre rawsock readline zlib

# CLISP doesn't work with jemalloc:
.if ${OPSYS} == "NetBSD"
PKG_SUGGESTED_OPTIONS+=		gmalloc
.elif ${OPSYS} == "FreeBSD" && !empty(OS_VERSION:N[0-6].*)
PKG_SUGGESTED_OPTIONS+=		gmalloc
.endif

.include "../../mk/bsd.prefs.mk"
.include "../../mk/bsd.options.mk"

PLIST_VARS+=		${PKG_SUPPORTED_OPTIONS}

.for option in ${PKG_SUPPORTED_OPTIONS}
.  if !empty(PKG_OPTIONS:M${option})
PLIST.${option}=	yes
.  endif
.endfor

.if !empty(PKG_OPTIONS:Mgmalloc)
CONFIGURE_ARGS+=	--with-gmalloc
.endif

# ffcall is required for other options to work
.if !empty(PKG_OPTIONS:Mpgsql) && empty(PKG_OPTIONS:Mffcall)
PKG_OPTIONS+=	ffcall
.endif

.if !empty(PKG_OPTIONS:Mffcall)
CONFIGURE_ARGS+=	--with-dynamic-ffi
.  include "../../devel/ffcall/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mpgsql)
CONFIGURE_ARGS+=	--with-module=postgresql
.  include "../../mk/pgsql.buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mgdbm)
CONFIGURE_ARGS+=	--with-module=gdbm
.  include "../../databases/gdbm/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mbdb)
# it requires version 4, not anything older
CONFIGURE_ARGS+=	--with-module=berkeley-db
.  include "../../databases/db4/buildlink3.mk"
CPPFLAGS+=	-I${PREFIX}/include/db4
LDFLAGS+=	-L${PREFIX}/lib
.endif

.if !empty(PKG_OPTIONS:Mpcre)
CONFIGURE_ARGS+=	--with-module=pcre
.  include "../../devel/pcre/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mrawsock)
CONFIGURE_ARGS+=	--with-module=rawsock
.endif

.if !empty(PKG_OPTIONS:Mpari)
CONFIGURE_ARGS+=	--with-module=pari
.  include "../../math/pari/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mfastcgi)
CONFIGURE_ARGS+=	--with-module=fastcgi
.  include "../../www/fcgi/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mnew-clx)
CONFIGURE_ARGS+=	--with-module=clx/new-clx
.  include "../../x11/libX11/buildlink3.mk"
.  include "../../x11/libXau/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mmit-clx)
CONFIGURE_ARGS+=	--with-module=clx/mit-clx
.  include "../../x11/libX11/buildlink3.mk"
.  include "../../x11/libXau/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mgtk2)
CONFIGURE_ARGS+=	--with-module=gtk2
.  include "../../devel/libglade/buildlink3.mk"
.  include "../../x11/gtk2/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mwildcard)
CONFIGURE_ARGS+=	--with-module=wildcard
.endif

.if !empty(PKG_OPTIONS:Mzlib)
CONFIGURE_ARGS+=	--with-module=zlib
BUILDLINK_API_DEPENDS.zlib+=	zlib>=1.2
.include "../../devel/zlib/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mreadline)
USE_GNU_READLINE=	YES
CONFIGURE_ARGS+=	--with-readline
.include "../../devel/readline/buildlink3.mk"
.endif
