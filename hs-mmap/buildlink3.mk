# $NetBSD$

BUILDLINK_TREE+=	hs-mmap

.if !defined(HS_MMAP_BUILDLINK3_MK)
HS_MMAP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-mmap+=	hs-mmap>=0.5.9
BUILDLINK_ABI_DEPENDS.hs-mmap+=	hs-mmap>=0.5.9
BUILDLINK_PKGSRCDIR.hs-mmap?=	../../wip/hs-mmap
.endif	# HS_MMAP_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-mmap
