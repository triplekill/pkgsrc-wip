# $NetBSD$

BUILDLINK_TREE+=	hs-parallel-io

.if !defined(HS_PARALLEL_IO_BUILDLINK3_MK)
HS_PARALLEL_IO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-parallel-io+=	hs-parallel-io>=0.3.3
BUILDLINK_PKGSRCDIR.hs-parallel-io?=	../../wip/hs-parallel-io

.endif	# HS_PARALLEL_IO_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-parallel-io
