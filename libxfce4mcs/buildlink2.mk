# $NetBSD$
#
# This Makefile fragment is included by packages that use libxfce4mcs.
#
# This file was created automatically using createbuildlink 2.6.
#

.if !defined(LIBXFCE4MCS_BUILDLINK2_MK)
LIBXFCE4MCS_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			libxfce4mcs
BUILDLINK_DEPENDS.libxfce4mcs?=		libxfce4mcs>=3.91.0
BUILDLINK_PKGSRCDIR.libxfce4mcs?=		../../wip/libxfce4mcs

EVAL_PREFIX+=	BUILDLINK_PREFIX.libxfce4mcs=libxfce4mcs
BUILDLINK_PREFIX.libxfce4mcs_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.libxfce4mcs+=	include/xfce4/libxfce4mcs/mcs-client.h
BUILDLINK_FILES.libxfce4mcs+=	include/xfce4/libxfce4mcs/mcs-common.h
BUILDLINK_FILES.libxfce4mcs+=	include/xfce4/libxfce4mcs/mcs-manager.h
BUILDLINK_FILES.libxfce4mcs+=	lib/libxfce4mcs-client.*
BUILDLINK_FILES.libxfce4mcs+=	lib/libxfce4mcs-manager.*
BUILDLINK_FILES.libxfce4mcs+=	lib/pkgconfig/libxfce4mcs-client-1.0.pc
BUILDLINK_FILES.libxfce4mcs+=	lib/pkgconfig/libxfce4mcs-manager-1.0.pc

.include "../../devel/pkgconfig/buildlink2.mk"
.include "../../wip/libxfce4util/buildlink2.mk"
.include "../../devel/glib2/buildlink2.mk"
.include "../../devel/pkgconfig/buildlink2.mk"

BUILDLINK_TARGETS+=	libxfce4mcs-buildlink

libxfce4mcs-buildlink: _BUILDLINK_USE

.endif	# LIBXFCE4MCS_BUILDLINK2_MK
