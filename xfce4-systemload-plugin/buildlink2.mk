# $NetBSD$
#
# This Makefile fragment is included by packages that use xfce4-systemload-plugin.
#
# This file was created automatically using createbuildlink 2.6.
#

.if !defined(XFCE4_SYSTEMLOAD_PLUGIN_BUILDLINK2_MK)
XFCE4_SYSTEMLOAD_PLUGIN_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			xfce4-systemload-plugin
BUILDLINK_DEPENDS.xfce4-systemload-plugin?=		xfce4-systemload-plugin>=0.2.6
BUILDLINK_PKGSRCDIR.xfce4-systemload-plugin?=		../../wip/xfce4-systemload-plugin

EVAL_PREFIX+=	BUILDLINK_PREFIX.xfce4-systemload-plugin=xfce4-systemload-plugin
BUILDLINK_PREFIX.xfce4-systemload-plugin_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.xfce4-systemload-plugin+=	lib/xfce4/panel-plugins/libsystemload.*

.include "../../wip/xfce4-panel/buildlink2.mk"
.include "../../devel/glib2/buildlink2.mk"
.include "../../devel/pkgconfig/buildlink2.mk"

BUILDLINK_TARGETS+=	xfce4-systemload-plugin-buildlink

xfce4-systemload-plugin-buildlink: _BUILDLINK_USE

.endif	# XFCE4_SYSTEMLOAD_PLUGIN_BUILDLINK2_MK
