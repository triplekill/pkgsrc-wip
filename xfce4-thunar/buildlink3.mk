# $NetBSD$

BUILDLINK_TREE+=	xfce4-thunar

.if !defined(XFCE4_THUNAR_BUILDLINK3_MK)
XFCE4_THUNAR_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-thunar+=	xfce4-thunar>=0.8.0
BUILDLINK_PKGSRCDIR.xfce4-thunar?=	../../wip/xfce4-thunar

.include "../../devel/GConf/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/libexif/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../wip/xfce4-exo/buildlink3.mk"
.include "../../wip/xfce4-panel/buildlink3.mk"
.include "../../x11/startup-notification/buildlink3.mk"
.include "../../wip/xfce4-dev-tools/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/fam.buildlink3.mk"
.endif # XFCE4_THUNAR_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-thunar
