# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.rss-glib

PKG_SUPPORTED_OPTIONS=	python mono vala
PKG_SUGGESTED_OPTIONS=	python

.include "../../mk/bsd.options.mk"

###
### Enable python support
###
.if !empty(PKG_OPTIONS:Mpython)
.  include "../../lang/python/extension.mk"
.  include "../../lang/python/pyversion.mk"
PYTHON_VERSIONS_ACCEPTED=	26 25 24 23 22
PLIST_SUBST+=			PYSITELIB=${PYSITELIB}
.  include "../../devel/py-gobject/buildlink3.mk"
.  include "../../x11/py-gtk2/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-python
.endif

###
### Enable mono support
###
.if !empty(PKG_OPTIONS:Mmono)
.  include "../../lang/mono/buildlink3.mk"
.  include "../../x11/gtk-sharp/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-mono=yes
.else
CONFIGURE_ARGS+=	--disable-mono
.endif

###
### Enable vala support
###
.if !empty(PKG_OPTIONS:Mvala)
.  include "../../lang/vala/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-vala=yes
.else
CONFIGURE_ARGS+=	--disable-vala
.endif
