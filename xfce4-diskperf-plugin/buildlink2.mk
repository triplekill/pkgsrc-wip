# $NetBSD$
#
# This Makefile fragment is included by packages that use xfce4-diskperf-plugin.
#
# This file was created automatically using createbuildlink 2.7.
#

.if !defined(XFCE4_DISKPERF_PLUGIN_BUILDLINK2_MK)
XFCE4_DISKPERF_PLUGIN_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			xfce4-diskperf-plugin
BUILDLINK_DEPENDS.xfce4-diskperf-plugin?=		xfce4-diskperf-plugin>=1.4
BUILDLINK_PKGSRCDIR.xfce4-diskperf-plugin?=		../../sysutils/xfce4-diskperf-plugin

EVAL_PREFIX+=	BUILDLINK_PREFIX.xfce4-diskperf-plugin=xfce4-diskperf-plugin
BUILDLINK_PREFIX.xfce4-diskperf-plugin_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.xfce4-diskperf-plugin+=	lib/xfce4/panel-plugins/libdiskperf.*

.include "../../x11/xfce4-panel/buildlink2.mk"
.include "../../devel/glib2/buildlink2.mk"

BUILDLINK_TARGETS+=	xfce4-diskperf-plugin-buildlink

xfce4-diskperf-plugin-buildlink: _BUILDLINK_USE

.endif	# XFCE4_DISKPERF_PLUGIN_BUILDLINK2_MK
