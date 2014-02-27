# $NetBSD$

BUILDLINK_TREE+=	libglobalplatform

.if !defined(LIBGLOBALPLATFORM_BUILDLINK3_MK)
LIBGLOBALPLATFORM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libglobalplatform+=	libglobalplatform>=6.0.0
BUILDLINK_PKGSRCDIR.libglobalplatform?=	../../wip/libglobalplatform

.include "../../security/pcsc-lite/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif	# LIBGLOBALPLATFORM_BUILDLINK3_MK

BUILDLINK_TREE+=	-libglobalplatform
