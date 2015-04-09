# $NetBSD$
#

BUILDLINK_TREE+=	upower

.if !defined(UPOWER_BUILDLINK3_MK)
UPOWER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.upower+=	upower>=0.9.16
BUILDLINK_PKGSRCDIR.upower?=	../../wip/upower

.include "../../devel/glib2/buildlink3.mk"
.endif	# UPOWER_BUILDLINK3_MK

BUILDLINK_TREE+=	-upower
