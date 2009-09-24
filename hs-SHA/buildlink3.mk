# $NetBSD$

BUILDLINK_TREE+=	hs-SHA

.if !defined(HS_SHA_BUILDLINK3_MK)
HS_SHA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-SHA+=	hs-SHA>=1.4.0
BUILDLINK_PKGSRCDIR.hs-SHA?=	../../wip/hs-SHA

.include "../../wip/hs-binary/buildlink3.mk"
.endif	# HS_SHA_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-SHA
