# $NetBSD$

BUILDLINK_TREE+=	gsettings-desktop-schemas

.if !defined(GSETTINGS_DESKTOP_SCHEMAS_BUILDLINK3_MK)
GSETTINGS_DESKTOP_SCHEMAS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gsettings-desktop-schemas+=	gsettings-desktop-schemas>=3.2.0
BUILDLINK_PKGSRCDIR.gsettings-desktop-schemas?=	../../wip/gsettings-desktop-schemas

.endif	# GSETTINGS_DESKTOP_SCHEMAS_BUILDLINK3_MK

BUILDLINK_TREE+=	-gsettings-desktop-schemas
