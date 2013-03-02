# $NetBSD$

BUILDLINK_TREE+=	libfishsound

.if !defined(LIBFISHSOUND_BUILDLINK3_MK)
LIBFISHSOUND_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libfishsound+=	libfishsound>=1.0.0
BUILDLINK_PKGSRCDIR.libfishsound?=	../../wip/libfishsound

pkgbase := libfishsound
.include "../../mk/pkg-build-options.mk"

.if !empty(PKG_BUILD_OPTIONS.libfishsound:Mflac)
.include "../../audio/flac/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.libfishsound:Mspeex)
.include "../../audio/speex/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.libfishsound:Mvorbis)
.include "../../audio/libvorbis/buildlink3.mk"
.endif

.include "../../wip/liboggz/buildlink3.mk"
.include "../../audio/libsndfile/buildlink3.mk"
.endif	# LIBFISHSOUND_BUILDLINK3_MK

BUILDLINK_TREE+=	-libfishsound
