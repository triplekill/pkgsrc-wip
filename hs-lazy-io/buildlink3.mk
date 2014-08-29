# $NetBSD$

BUILDLINK_TREE+=	hs-lazy-io

.if !defined(HS_LAZY_IO_BUILDLINK3_MK)
HS_LAZY_IO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-lazy-io+=	hs-lazy-io>=0.1.0
BUILDLINK_ABI_DEPENDS.hs-lazy-io+=	hs-lazy-io>=0.1.0
BUILDLINK_PKGSRCDIR.hs-lazy-io?=	../../wip/hs-lazy-io
.endif	# HS_LAZY_IO_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-lazy-io
