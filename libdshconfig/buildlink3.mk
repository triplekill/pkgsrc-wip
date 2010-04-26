# $NetBSD$

BUILDLINK_TREE+=	libdshconfig

.if !defined(LIBDSHCONFIG_BUILDLINK3_MK)
LIBDSHCONFIG_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libdshconfig+=	libdshconfig>=0.20.13
BUILDLINK_PKGSRCDIR.libdshconfig?=	../../wip/libdshconfig
.endif	# LIBDSHCONFIG_BUILDLINK3_MK

BUILDLINK_TREE+=	-libdshconfig
