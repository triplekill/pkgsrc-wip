# $NetBSD$

BUILDLINK_TREE+=	libcdr

.if !defined(LIBCDR_BUILDLINK3_MK)
LIBCDR_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libcdr+=	libcdr>=0.0.6
BUILDLINK_PKGSRCDIR.libcdr?=	../../wip/libcdr

.include "../../converters/libwpd/buildlink3.mk"
.include "../../converters/libwpg/buildlink3.mk"
.include "../../graphics/lcms2/buildlink3.mk"
.endif	# LIBCDR_BUILDLINK3_MK

BUILDLINK_TREE+=	-libcdr
