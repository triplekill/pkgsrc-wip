# $NetBSD$

BUILDLINK_TREE+=	hs-mtl

.if !defined(HS_MTL_BUILDLINK3_MK)
HS_MTL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-mtl+=	hs-mtl>=2.0
BUILDLINK_PKGSRCDIR.hs-mtl?=	../../wip/hs-mtl
.endif # HS_MTL_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-mtl
