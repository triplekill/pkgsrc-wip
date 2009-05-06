# $NetBSD$

BUILDLINK_TREE+=	grass

.if !defined(GRASS_BUILDLINK3_MK)
GRASS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.grass+=	grass>=6.0.0
BUILDLINK_ABI_DEPENDS.grass?=	grass>=6.0.2nb2
BUILDLINK_PKGSRCDIR.grass?=	../../wip/grass

.include "../../geography/gdal-lib/buildlink3.mk"
.endif # GRASS_BUILDLINK3_MK

BUILDLINK_TREE+=	-grass
