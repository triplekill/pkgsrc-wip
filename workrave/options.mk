# $NetBSD: options.mk,v 1.5 2007/09/05 14:31:52 reed Exp $

PKG_OPTIONS_VAR=		PKG_OPTIONS.workrave
PKG_SUPPORTED_OPTIONS+=		arts dbus debug distributed
PKG_SUGGESTED_OPTIONS+=		distributed

PKG_OPTIONS_REQUIRED_GROUPS=	frontends backends
PKG_OPTIONS_GROUP.frontends=	gtk gnome kde

# The backends (configuration databases) is a bit of a mess!
#   * backends/src/Core.cc requires one of GConf, GDome (XML), or Qt
#   * backends/src/Configurator.cc requires one of GLib or Qt
#     to read .ini-style files
# Workrave doesn't currently support Qt without KDE.
# We interpret gnome to imply gconf.
# No KDE/Qt implies glib must be included
PKG_OPTIONS_GROUP.backends=	xml gconf gnome kde

.include "../../mk/bsd.options.mk"

#.if !empty(PKG_OPTIONS:Mx11)
#CONFIGURE_ARGS+=	--with-x
#.  include "../../x11/libX11/buildlink3.mk"
#.else
#CONFIGURE_ARGS+=	--without-x
#.endif

###
### GTK2
###
.if !empty(PKG_OPTIONS:Mgtk)
CONFIGURE_ARGS+=	--enable-app-gtk
.  include "../../x11/gtk2/buildlink3.mk"
.  include "../../x11/gtkmm/buildlink3.mk"
.  include "../../x11/libX11/buildlink3.mk"
.  include "../../x11/libXt/buildlink3.mk"
.  include "../../x11/libXmu/buildlink3.mk"
#XXX .  include "../../devel/glibmm/buildlink3.mk"
#XXX .  include "../../devel/libsigc++/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-app-gtk
.endif

###
### GNOME and GConf
### GNOME implies GConf
###
.if !empty(PKG_OPTIONS:Mgnome)
CONFIGURE_ARGS+=	--enable-gnome --enable-gnomemm --enable-gconf
.  include "../../devel/libgnomeui/buildlink3.mk"
.  include "../../devel/libgnomeuimm/buildlink3.mk"
.  include "../../devel/GConf/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-gnome --disable-gnomemm
.  if !empty(PKG_OPTIONS:Mgconf)
CONFIGURE_ARGS+=	--enable-gconf
.    include "../../devel/GConf/buildlink3.mk"
.  else
CONFIGURE_ARGS+=	--disable-gconf
.  endif
.endif

###
### KDE
###
.if !empty(PKG_OPTIONS:Mkde)
CONFIGURE_ARGS+=	--enable-kde
.  include "../../devel/kdesdk3/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-kde
#  must explicitly include glib if no KDE for backends/src/Configurator.cc
.  include "../../devel/glib2/buildlink3.mk"
.endif

###
### XML backends (via GDome2)
###
.if !empty(PKG_OPTIONS:Mxml)
CONFIGURE_ARGS+=	--enable-xml
.  include "../../textproc/gdome2/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-xml
.endif

###
### DBus
###
.if !empty(PKG_OPTIONS:Mdbus)
CONFIGURE_ARGS+=	--enable-dbus
.  include "../../sysutils/dbus/buildlink3.mk"
.  include "../../sysutils/dbus-glib/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-dbus
.endif

###
### Distributed: coordinate with workrave instances on other machines
###
.if !empty(PKG_OPTIONS:Mdistributed)
CONFIGURE_ARGS+=	--enable-distributed
.  include "../../net/gnet/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-distributed
.endif

###
### Debugging
###
.if !empty(PKG_OPTIONS:Mdebug)
CONFIGURE_ARGS+=	--enable-debug
.else
CONFIGURE_ARGS+=	--disable-debug
.endif
