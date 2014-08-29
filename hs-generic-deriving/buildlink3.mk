# $NetBSD$

BUILDLINK_TREE+=	hs-generic-deriving

.if !defined(HS_GENERIC_DERIVING_BUILDLINK3_MK)
HS_GENERIC_DERIVING_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-generic-deriving+=	hs-generic-deriving>=1.6.2
BUILDLINK_ABI_DEPENDS.hs-generic-deriving+=	hs-generic-deriving>=1.6.2
BUILDLINK_PKGSRCDIR.hs-generic-deriving?=	../../wip/hs-generic-deriving
.endif	# HS_GENERIC_DERIVING_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-generic-deriving
