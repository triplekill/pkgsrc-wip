# $NetBSD$

BUILDLINK_TREE+=	hs-mmorph

.if !defined(HS_MMORPH_BUILDLINK3_MK)
HS_MMORPH_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-mmorph+=	hs-mmorph>=1.0.2
BUILDLINK_PKGSRCDIR.hs-mmorph?=	../../wip/hs-mmorph

.include "../../devel/hs-transformers/buildlink3.mk"
.endif	# HS_MMORPH_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-mmorph
