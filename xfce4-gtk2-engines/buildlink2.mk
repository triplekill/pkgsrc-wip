# $NetBSD$
#
# This Makefile fragment is included by packages that use xfce4-gtk2-engine.
#
# This file was created automatically using createbuildlink 2.6.
#

.if !defined(XFCE4_GTK2_ENGINE_BUILDLINK2_MK)
XFCE4_GTK2_ENGINE_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			xfce4-gtk2-engine
BUILDLINK_DEPENDS.xfce4-gtk2-engine?=		xfce4-gtk2-engine>=2.1.1
BUILDLINK_PKGSRCDIR.xfce4-gtk2-engine?=		../../wip/xfce4-gtk2-engines

EVAL_PREFIX+=	BUILDLINK_PREFIX.xfce4-gtk2-engine=xfce4-gtk2-engine
BUILDLINK_PREFIX.xfce4-gtk2-engine_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.xfce4-gtk2-engine+=	lib/gtk-2.0/2.2.0/engines/libxfce.*

.include "../../x11/gtk2/buildlink2.mk"
.include "../../devel/glib2/buildlink2.mk"
.include "../../devel/pkgconfig/buildlink2.mk"

BUILDLINK_TARGETS+=	xfce4-gtk2-engine-buildlink

xfce4-gtk2-engine-buildlink: _BUILDLINK_USE

.endif	# XFCE4_GTK2_ENGINE_BUILDLINK2_MK
