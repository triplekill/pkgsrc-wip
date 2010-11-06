# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.gnome-mplayer
PKG_SUPPORTED_OPTIONS=	alsa gnome musicbrainz pulseaudio libgpod
PKG_SUGGESTED_OPTIONS=	gnome musicbrainz pulseaudio

.include "../../mk/bsd.options.mk"

PLIST_VARS+=	nautilus

#
# Use pulse audio flat volume feature
#
.if !empty(PKG_OPTIONS:Mpulseaudio)
DEPENDS+=		pulseaudio>=0.9.14:../../audio/pulseaudio
CONFIGURE_ARGS+=	--with-flat-volume=yes
.else
CONFIGURE_ARGS+=	--with-flat-volume=no
.endif

#
# Compile the nautilus plugin
# Use gnome-power-manager below 2.26 inhibit methods
# Send notifications of new media
#
.if !empty(PKG_OPTIONS:Mgnome)
DEPENDS+=		gnome-power-manager-[0-9]*:../../sysutils/gnome-power-manager
.include "../../sysutils/libnotify/buildlink3.mk"
.include "../../sysutils/nautilus/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-nautilus
CONFIGURE_ARGS+=	--with-gpm-old-method
CONFIGURE_ARGS+=	--with-gpm-new-method=no
CONFIGURE_ARGS+=	--with-libnotify
PLIST.nautilus=		yes
.else
CONFIGURE_ARGS+=	--disable-nautilus
CONFIGURE_ARGS+=	--with-gpm-old-method=no
CONFIGURE_ARGS+=	--with-gpm-new-method=no
CONFIGURE_ARGS+=	--with-libnotify=no
.endif

#
# Add support for libmusicbrainz3
#
.if !empty(PKG_OPTIONS:Mmusicbrainz)
.include "../../audio/libmusicbrainz/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
CONFIGURE_ARGS+=	--with-libmusicbrainz3
.else
CONFIGURE_ARGS+=	--with-libmusicbrainz3=no
.endif

#
# Read volume from alsa devices
#
.if !empty(PKG_OPTIONS:Malsa)
.include "../../audio/alsa-lib/buildlink3.mk"
CONFIGURE_ARGS+=	--with-alsa
.else
CONFIGURE_ARGS+=	--with-alsa=no
.endif

#
# Add support for libgpod
#
.if !empty(PKG_OPTIONS:Mlibgpod)
.include "../../audio/libgpod/buildlink3.mk"
CONFIGURE_ARGS+=	--with-libgpod
.else
CONFIGURE_ARGS+=	--with-libgpod=no
.endif
