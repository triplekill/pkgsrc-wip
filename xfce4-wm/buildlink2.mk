# $NetBSD$
#
# This Makefile fragment is included by packages that use xfce4-wm.
#
# This file was created automatically using createbuildlink 2.6.
#

.if !defined(XFCE4_WM_BUILDLINK2_MK)
XFCE4_WM_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			xfce4-wm
BUILDLINK_DEPENDS.xfce4-wm?=		xfce4-wm>=3.90.20030604
BUILDLINK_PKGSRCDIR.xfce4-wm?=		../../wip/xfce4-wm

EVAL_PREFIX+=	BUILDLINK_PREFIX.xfce4-wm=xfce4-wm
BUILDLINK_PREFIX.xfce4-wm_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.xfce4-wm+=	lib/xfce4/mcs-plugins/margins_plugin.*
BUILDLINK_FILES.xfce4-wm+=	lib/xfce4/mcs-plugins/xfwm4_plugin.*

.include "../../devel/pkgconfig/buildlink2.mk"
.include "../../wip/xfce4-mcs-plugins/buildlink2.mk"
.include "../../x11/startup-notification/buildlink2.mk"
.include "../../devel/glib2/buildlink2.mk"
.include "../../devel/pkgconfig/buildlink2.mk"

BUILDLINK_TARGETS+=	xfce4-wm-buildlink

xfce4-wm-buildlink: _BUILDLINK_USE

.endif	# XFCE4_WM_BUILDLINK2_MK
