# $NetBSD$

BUILDLINK_TREE+=	hs-zlib

.if !defined(HS_ZLIB_BUILDLINK3_MK)
HS_ZLIB_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.hs-zlib?=	build
BUILDLINK_API_DEPENDS.hs-zlib+=	hs-zlib>=0.4.0.4
BUILDLINK_PKGSRCDIR.hs-zlib?=	../../wip/hs-zlib

.include "../../devel/zlib/buildlink3.mk"
.endif # HS_ZLIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-zlib
