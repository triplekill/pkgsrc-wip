# $NetBSD$

BUILDLINK_TREE+=	libisoburn

.if !defined(LIBISOBURN_BUILDLINK3_MK)
LIBISOBURN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libisoburn+=	libisoburn>=1.1.8
BUILDLINK_PKGSRCDIR.libisoburn?=	../../wip/libisoburn

.include "../../sysutils/libisofs/buildlink3.mk"
.include "../../sysutils/libburn/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.endif	# LIBISOBURN_BUILDLINK3_MK

BUILDLINK_TREE+=	-libisoburn
