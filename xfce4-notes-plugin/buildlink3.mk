# $NetBSD: buildlink3.mk,v 1.25 2011/04/22 13:42:18 obache Exp $

BUILDLINK_TREE+=	xfce4-notes-plugin

.if !defined(XFCE4_NOTES_PLUGIN_BUILDLINK3_MK)
XFCE4_NOTES_PLUGIN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-notes-plugin+=	xfce4-notes-plugin>=1.7.7
BUILDLINK_ABI_DEPENDS.xfce4-notes-plugin?=	xfce4-notes-plugin>=1.7.7
BUILDLINK_PKGSRCDIR.xfce4-notes-plugin?=	../../wip/xfce4-notes-plugin

.include "../../wip/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.endif # XFCE4_NOTES_PLUGIN_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-notes-plugin
