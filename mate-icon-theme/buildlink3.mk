# $NetBSD$
#

BUILDLINK_TREE+=	mate-icon-theme

.if !defined(MATE_ICON_THEME_BUILDLINK3_MK)
MATE_ICON_THEME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mate-icon-theme+=	mate-icon-theme>=1.8.0
BUILDLINK_PKGSRCDIR.mate-icon-theme?=	../../wip/mate-icon-theme

.endif	# MATE_ICON_THEME_BUILDLINK3_MK

BUILDLINK_TREE+=	-mate-icon-theme
