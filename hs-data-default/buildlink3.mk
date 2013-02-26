# $NetBSD$

BUILDLINK_TREE+=	hs-data-default

.if !defined(HS_DATA_DEFAULT_BUILDLINK3_MK)
HS_DATA_DEFAULT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-data-default+=	hs-data-default>=0.5.0
BUILDLINK_PKGSRCDIR.hs-data-default?=	../../wip/hs-data-default

.include "../../wip/hs-dlist/buildlink3.mk"
.endif	# HS_DATA_DEFAULT_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-data-default
