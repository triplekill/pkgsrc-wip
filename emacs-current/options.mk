# $NetBSD: options.mk,v 1.7 2011/10/09 14:02:06 obache Exp $
#

PKG_OPTIONS_VAR=	PKG_OPTIONS.emacs_current
PKG_SUPPORTED_OPTIONS=	dbus gconf gnutls imagemagick svg xaw3d xft2
# xaw3d is only valid with tookit = xaw

PKG_OPTIONS_OPTIONAL_GROUPS+= window-system
PKG_OPTIONS_GROUP.window-system= x11 nextstep

PKG_OPTIONS_OPTIONAL_GROUPS+= toolkit
#  --with-x-toolkit=KIT    use an X toolkit (KIT one of: yes or gtk, gtk2,
#                          gtk3, lucid or athena, motif, no)
# gtk in next line implies gtk2, xaw = athena = lucid
PKG_OPTIONS_GROUP.toolkit= gtk motif xaw
# gconf, gtk and xft2 will be ingnored for nextstep even shown as selected.
PKG_SUGGESTED_OPTIONS=	dbus gnutls imagemagick svg gconf gtk xft2

.include "../../mk/bsd.options.mk"

###
### Support D-BUS
###
.if !empty(PKG_OPTIONS:Mdbus)
.include "../../sysutils/dbus/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-dbus
.endif

###
### Support gnutls
###
.if !empty(PKG_OPTIONS:Mgnutls)
.include "../../security/gnutls/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-gnutls
.endif

###
### Support ImageMagick
###
.if !empty(PKG_OPTIONS:Mimagemagick)
.include "../../graphics/ImageMagick/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-imagemagic
.endif

###
### Check non nextstep (implies x11) options  ---------------------
###
.if empty(PKG_OPTIONS:Mnextstep)
###
### Support SVG
###
.  if !empty(PKG_OPTIONS:Msvg)
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/librsvg/buildlink3.mk"
.  else
CONFIGURE_ARGS+=	--without-rsvg
.  endif

###
### Support gconf
###
.  if !empty(PKG_OPTIONS:Mgconf)
.include "../../devel/gconfmm/buildlink3.mk"
.  else
CONFIGURE_ARGS+=	--without-gconf
.  endif

###
### Support Xaw3d (This is only valid with Lucid Toolkit)
###
.  if !empty(PKG_OPTIONS:Mxaw3d)
.include "../../x11/Xaw3d/buildlink3.mk"
.  else
CONFIGURE_ARGS+=	--without-xaw3d
.  endif
.endif
###
### End of Check non nextstep options  ---------------------
###

###
### .
### Any of the "toolkit" options with no window-system option implies "x11"
###
.if !empty(PKG_OPTIONS:Mgtk) || !empty(PKG_OPTIONS:Mmotif) || !empty(PKG_OPTIONS:Mxaw) || !empty(PKG_OPTIONS:Mxft2)
.  if empty(PKG_OPTIONS:Mx11) && empty(PKG_OPTIONS:Mnextstep)
PKG_OPTIONS+=		x11
.  endif
.endif

###
### Default to using the GTK toolkit if none is specified.
###
.if !empty(PKG_OPTIONS:Mx11)
.  if !empty(PKG_OPTIONS:Mlucid)
PKG_OPTIONS+=		lucid
.  else
.    if empty(PKG_OPTIONS:Mgtk) && empty(PKG_OPTIONS:Mmotif) && empty(PKG_OPTIONS:Mxaw)
PKG_OPTIONS+=		gtk
.    endif
.  endif
.endif

###
### Support drawing pretty X11 widgets.
###
.if !empty(PKG_OPTIONS:Mx11)

CONFIGURE_ARGS+=	--with-x
CONFIGURE_ARGS+=	--with-xpm
CONFIGURE_ARGS+=	--with-jpeg
CONFIGURE_ARGS+=	--with-tiff
CONFIGURE_ARGS+=	--with-gif
CONFIGURE_ARGS+=	--with-png

.include "../../mk/jpeg.buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../mk/giflib.buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"

###
### Enable font backend
###
.  if !empty(PKG_OPTIONS:Mxft2)
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/libotf/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../x11/libXft/buildlink3.mk"
.include "../../devel/m17n-lib/buildlink3.mk"
.  else
CONFIGURE_ARGS+=	--without-xft --without-otf --without-m17n-flt
.  endif

###
### Support using GTK X11 widgets.
###
.  if !empty(PKG_OPTIONS:Mgtk)
USE_TOOLS+=		pkg-config
.include "../../x11/gtk2/buildlink3.mk"
CONFIGURE_ARGS+=	--with-x-toolkit=gtk

###
### Support using Motif X11 widgets.
###
.  elif !empty(PKG_OPTIONS:Mmotif)
.include "../../mk/motif.buildlink3.mk"
CONFIGURE_ARGS+=	--with-x-toolkit=motif

###
### Support using Xaw (Lucid) X11 widgets.
###
.  elif !empty(PKG_OPTIONS:Mxaw)
.include "../../mk/xaw.buildlink3.mk"
CONFIGURE_ARGS+=	--with-x-toolkit=athena
.  endif

###
### Support using NextStep (Cocoa or GNUstep) windowing system
###
.elif !empty(PKG_OPTIONS:Mnextstep)
.  if exists(/System/Library/Frameworks/Cocoa.framework)
APPLICATIONS_DIR=	Applications
NS_APPBINDIR=		nextstep/Emacs.app/Contents/MacOS
PLIST_SRC+=		PLIST.cocoa
CHECK_WRKREF_SKIP+=	Applications/Emacs.app/Contents/MacOS/Emacs
.  else
.include "../../x11/gnustep-gui/buildlink3.mk"
MAKE_FILE=		Makefile
APPLICATIONS_DIR=	share/GNUstep/Local/Applications
NS_APPBINDIR=		nextstep/Emacs.app
PLIST_SRC+=		PLIST.gnustep
CHECK_WRKREF_SKIP+=	share/GNUstep/Local/Applications/Emacs.app/Emacs
.  endif
CONFIGURE_ARGS+=	--without-x
CONFIGURE_ARGS+=	--with-ns
CONFIGURE_ARGS+=	--disable-ns-self-contained

INSTALLATION_DIRS+=	${APPLICATIONS_DIR}
USE_TOOLS+=		pax

post-install:
	cd ${WRKSRC}/nextstep && \
		pax -rw -pp -pm Emacs.app ${DESTDIR}${PREFIX}/${APPLICATIONS_DIR}

.else
CONFIGURE_ARGS+=	--without-x
CONFIGURE_ARGS+=	--without-xpm
CONFIGURE_ARGS+=	--without-jpeg
CONFIGURE_ARGS+=	--without-tiff
CONFIGURE_ARGS+=	--without-gif
CONFIGURE_ARGS+=	--without-png
.endif

# Local Variables:
# mode: outline-minor
# outline-regexp: "\\(.[ \t]*\\(if\\|endif\\|else\\|elif\\)\\)\\|### ."
# End:
