# $NetBSD$

BUILDLINK_TREE+=	hs-comonads-fd

.if !defined(HS_COMONADS_FD_BUILDLINK3_MK)
HS_COMONADS_FD_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-comonads-fd+=	hs-comonads-fd>=3.0.3
BUILDLINK_ABI_DEPENDS.hs-comonads-fd+=	hs-comonads-fd>=3.0.3
BUILDLINK_PKGSRCDIR.hs-comonads-fd?=	../../wip/hs-comonads-fd

.endif	# HS_COMONADS_FD_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-comonads-fd
