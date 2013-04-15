# $NetBSD$

BUILDLINK_TREE+=	libzrtpcpp

.if !defined(LIBZRTPCPP_BUILDLINK3_MK)
LIBZRTPCPP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libzrtpcpp+=	libzrtpcpp>=0.9.0
BUILDLINK_ABI_DEPENDS.libzrtpcpp?=	libzrtpcpp>=1.4.6nb1
BUILDLINK_PKGSRCDIR.libzrtpcpp?=	../../wip/libzrtpcpp

.include "../../wip/ccrtp/buildlink3.mk"
#.include "../../wip/commoncpp2/buildlink3.mk"
.endif # LIBZRTPCPP_BUILDLINK3_MK

BUILDLINK_TREE+=	-libzrtpcpp
