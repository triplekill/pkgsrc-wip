# $NetBSD$

BUILDLINK_TREE+=	hs-entropy

.if !defined(HS_ENTROPY_BUILDLINK3_MK)
HS_ENTROPY_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-entropy+=	hs-entropy>=0.2.2
BUILDLINK_ABI_DEPENDS.hs-entropy+=	hs-entropy>=0.2.2.4
BUILDLINK_PKGSRCDIR.hs-entropy?=	../../wip/hs-entropy
.endif	# HS_ENTROPY_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-entropy
