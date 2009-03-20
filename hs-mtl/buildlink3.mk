# $NetBSD$

BUILDLINK_TREE+=	hs-mtl

.if !defined(HS_MTL_BUILDLINK3_MK)
HS_MTL_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.hs-mtl?=	build
BUILDLINK_API_DEPENDS.hs-mtl+=	hs-mtl>=1.1.0.2
BUILDLINK_PKGSRCDIR.hs-mtl?=	../../wip/hs-mtl
.endif # HS_MTL_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-mtl
