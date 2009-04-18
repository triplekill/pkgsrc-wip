# $NetBSD$

BUILDLINK_TREE+=	libanculus-sharp

.if !defined(LIBANCULUS_SHARP_BUILDLINK3_MK)
LIBANCULUS_SHARP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libanculus-sharp+=	libanculus-sharp>=0.3.1
BUILDLINK_PKGSRCDIR.libanculus-sharp?=	../../wip/libanaculus-sharp

.include "../../lang/mono/buildlink3.mk"
.include "../../x11/gtk-sharp/buildlink3.mk"
.endif	# LIBANCULUS_SHARP_BUILDLINK3_MK

BUILDLINK_TREE+=	-libanculus-sharp
