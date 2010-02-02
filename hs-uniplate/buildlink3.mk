# $NetBSD$

BUILDLINK_TREE+=	hs-uniplate

.if !defined(HS_UNIPLATE_BUILDLINK3_MK)
HS_UNIPLATE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-uniplate+=	hs-uniplate>=1.5.1
BUILDLINK_PKGSRCDIR.hs-uniplate?=	../../wip/hs-uniplate

.include "../../wip/hs-mtl/buildlink3.mk"
.endif	# HS_UNIPLATE_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-uniplate
