# $NetBSD$

BUILDLINK_TREE+=	hs-ObjectName

.if !defined(HS_OBJECTNAME_BUILDLINK3_MK)
HS_OBJECTNAME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-ObjectName+=	hs-ObjectName>=1.0.0
BUILDLINK_ABI_DEPENDS.hs-ObjectName+=	hs-ObjectName>=1.0.0.0
BUILDLINK_PKGSRCDIR.hs-ObjectName?=	../../wip/hs-ObjectName
.endif	# HS_OBJECTNAME_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-ObjectName
