# $NetBSD$

BUILDLINK_TREE+=	hs-unix-compat

.if !defined(HS_UNIX_COMPAT_BUILDLINK3_MK)
HS_UNIX_COMPAT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-unix-compat+=	hs-unix-compat>=0.3.0
BUILDLINK_PKGSRCDIR.hs-unix-compat?=	../../wip/hs-unix-compat
.endif	# HS_UNIX_COMPAT_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-unix-compat
