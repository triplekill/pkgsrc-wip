# $NetBSD$
# XXX
# XXX This file was created automatically using createbuildlink-3.13.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified buildlink3.mk files.
# XXX
# XXX Packages that only install static libraries or headers should
# XXX include the following line:
# XXX
# XXX	BUILDLINK_DEPMETHOD.beryl-settings?=	build

BUILDLINK_TREE+=	beryl-settings

.if !defined(BERYL_SETTINGS_BUILDLINK3_MK)
BERYL_SETTINGS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.beryl-settings+=	beryl-settings>=0.2.1
BUILDLINK_PKGSRCDIR.beryl-settings?=	../../wip/beryl-settings
.endif # BERYL_SETTINGS_BUILDLINK3_MK

BUILDLINK_TREE+=	-beryl-settings
