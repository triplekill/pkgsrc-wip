# $NetBSD$
#
# This Makefile fragment is included by packages that use xfce4-mcs-manager.
#
# This file was created automatically using createbuildlink 2.6.
#

.if !defined(XFCE4_MCS_MANAGER_BUILDLINK2_MK)
XFCE4_MCS_MANAGER_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			xfce4-mcs-manager
BUILDLINK_DEPENDS.xfce4-mcs-manager?=		xfce4-mcs-manager>=3.90.0
BUILDLINK_PKGSRCDIR.xfce4-mcs-manager?=		../../wip/xfce4-mcs-manager

EVAL_PREFIX+=	BUILDLINK_PREFIX.xfce4-mcs-manager=xfce4-mcs-manager
BUILDLINK_PREFIX.xfce4-mcs-manager_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.xfce4-mcs-manager+=	include/xfce4/xfce-mcs-manager/manager-plugin.h
BUILDLINK_FILES.xfce4-mcs-manager+=	lib/pkgconfig/xfce-mcs-manager.pc

.include "../../devel/pkgconfig/buildlink2.mk"
.include "../../wip/libxfce4gui/buildlink2.mk"
.include "../../wip/libxfce4mcs/buildlink2.mk"
.include "../../devel/glib2/buildlink2.mk"
.include "../../devel/pkgconfig/buildlink2.mk"

BUILDLINK_TARGETS+=	xfce4-mcs-manager-buildlink

xfce4-mcs-manager-buildlink: _BUILDLINK_USE

.endif	# XFCE4_MCS_MANAGER_BUILDLINK2_MK
