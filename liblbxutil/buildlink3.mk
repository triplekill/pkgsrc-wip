# $NetBSD$

BUILDLINK_TREE+=	liblbxutil

.if !defined(LIBLBXUTIL_BUILDLINK3_MK)
LIBLBXUTIL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.liblbxutil+=	liblbxutil>=1.1.0
BUILDLINK_PKGSRCDIR.liblbxutil?=	../../wip/liblbxutil

.include "../../devel/zlib/buildlink3.mk"
.include "../../x11/xproto/buildlink3.mk"
.endif	# LIBLBXUTIL_BUILDLINK3_MK

BUILDLINK_TREE+=	-liblbxutil
