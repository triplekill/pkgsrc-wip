# $NetBSD$

BUILDLINK_TREE+=	libgadu

.if !defined(LIBGADU_BUILDLINK3_MK)
LIBGADU_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgadu+=	libgadu>=1.7.1
BUILDLINK_ABI_DEPENDS.libgadu+=	libgadu>=1.7.1
BUILDLINK_PKGSRCDIR.libgadu?=	../../wip/libgadu
.endif # LIBGADU_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgadu
