# $NetBSD$
#
# This Makefile fragment is included by packages that use xfce4-utils.
#
# This file was created automatically using createbuildlink 2.6.
#

.if !defined(XFCE4_UTILS_BUILDLINK2_MK)
XFCE4_UTILS_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			xfce4-utils
BUILDLINK_DEPENDS.xfce4-utils?=		xfce4-utils>=3.90.20030604
BUILDLINK_PKGSRCDIR.xfce4-utils?=		../../wip/xfce4-utils

EVAL_PREFIX+=	BUILDLINK_PREFIX.xfce4-utils=xfce4-utils
BUILDLINK_PREFIX.xfce4-utils_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.xfce4-utils+=	lib/xfce4/mcs-plugins/xftaskbar_plugin.*

.include "../../devel/pkgconfig/buildlink2.mk"
.include "../../wip/xfce4-mcs-plugins/buildlink2.mk"
.include "../../devel/glib2/buildlink2.mk"
.include "../../devel/pkgconfig/buildlink2.mk"

BUILDLINK_TARGETS+=	xfce4-utils-buildlink

xfce4-utils-buildlink: _BUILDLINK_USE

.endif	# XFCE4_UTILS_BUILDLINK2_MK
