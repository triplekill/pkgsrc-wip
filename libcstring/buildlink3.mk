# $NetBSD$

BUILDLINK_TREE+=	libcstring

.if !defined(LIBCSTRING_BUILDLINK3_MK)
LIBCSTRING_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libcstring+=	libcstring>=20141018
BUILDLINK_PKGSRCDIR.libcstring?=	../../wip/libcstring

.endif	# LIBCSTRING_BUILDLINK3_MK

BUILDLINK_TREE+=	-libcstring
