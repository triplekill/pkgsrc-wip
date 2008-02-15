# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.ffmpeg-snapshot
PKG_SUPPORTED_OPTIONS=	old-dist mmx i686 gsm mp3lame xvid vorbis faad \
			faad faac x264 a52
PKG_SUGGESTED_OPTIONS=	mp3lame a52 faad i686 mmx xvid

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mold-dist)
TODAY=	${DISTDATE}
.endif

.if empty(PKG_OPTIONS:Mmmx)
CONFIGURE_ARGS+=	--disable-mmx
.endif

.if !empty(PKG_OPTIONS:Mi686)
CONFIGURE_ARGS+=	--cpu=i686
.endif

.if !empty(PKG_OPTIONS:Mgsm)
CONFIGURE_ARGS+=	--enable-libgsm
.include "../../audio/gsm/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mmp3lame)
CONFIGURE_ARGS+=	--enable-libmp3lame
.include "../../audio/lame/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mxvid)
CONFIGURE_ARGS+=	--enable-libxvid
.include "../../multimedia/xvidcore/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mvorbis)
CONFIGURE_ARGS+=	--enable-libvorbis
.include "../../audio/libvorbis/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mfaad)
CONFIGURE_ARGS+=	--enable-libfaad
.include "../../audio/faad2/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mfaac)
CONFIGURE_ARGS+=	--enable-libfaac
.include "../../audio/faac/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mx264)
CONFIGURE_ARGS+=	--enable-libx264
.include "../../multimedia/x264-devel/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Ma52)
CONFIGURE_ARGS+=	--enable-liba52
.include "../../audio/liba52/buildlink3.mk"
.endif
