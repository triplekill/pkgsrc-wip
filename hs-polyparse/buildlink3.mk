# $NetBSD$

BUILDLINK_TREE+=	hs-polyparse

.if !defined(HS_POLYPARSE_BUILDLINK3_MK)
HS_POLYPARSE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-polyparse+=	hs-polyparse>=1.9
BUILDLINK_PKGSRCDIR.hs-polyparse?=	../../wip/hs-polyparse

.include "../../devel/hs-text/buildlink3.mk"
.endif	# HS_POLYPARSE_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-polyparse
