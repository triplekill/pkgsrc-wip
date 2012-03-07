# $NetBSD$

BUILDLINK_TREE+=	libyubikey

.if !defined(LIBYUBIKEY_BUILDLINK3_MK)
LIBYUBIKEY_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libyubikey+=	libyubikey>=1.7
BUILDLINK_PKGSRCDIR.libyubikey?=	../../wip/libyubikey
.endif	# LIBYUBIKEY_BUILDLINK3_MK

BUILDLINK_TREE+=	-libyubikey
