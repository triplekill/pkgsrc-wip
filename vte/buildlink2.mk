# $NetBSD$
#
# This Makefile fragment is included by packages that use vte.
#
# This file was created automatically using createbuildlink 2.6.
#

.if !defined(VTE_BUILDLINK2_MK)
VTE_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			vte
BUILDLINK_DEPENDS.vte?=		vte>=0.10.29
BUILDLINK_PKGSRCDIR.vte?=		../../wip/vte

EVAL_PREFIX+=	BUILDLINK_PREFIX.vte=vte
BUILDLINK_PREFIX.vte_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.vte+=	include/vte/pty.h
BUILDLINK_FILES.vte+=	include/vte/reaper.h
BUILDLINK_FILES.vte+=	include/vte/vte.h
BUILDLINK_FILES.vte+=	include/vte/vteaccess.h
BUILDLINK_FILES.vte+=	lib/libvte.*
BUILDLINK_FILES.vte+=	lib/pkgconfig/vte.pc
BUILDLINK_FILES.vte+=	lib/vte/decset
BUILDLINK_FILES.vte+=	lib/vte/interpret
BUILDLINK_FILES.vte+=	lib/vte/iso8859mode
BUILDLINK_FILES.vte+=	lib/vte/nativeecho
BUILDLINK_FILES.vte+=	lib/vte/osc
BUILDLINK_FILES.vte+=	lib/vte/slowcat
BUILDLINK_FILES.vte+=	lib/vte/utf8echo
BUILDLINK_FILES.vte+=	lib/vte/utf8mode
BUILDLINK_FILES.vte+=	lib/vte/window

.include "../../x11/gtk2/buildlink2.mk"

BUILDLINK_TARGETS+=	vte-buildlink

vte-buildlink: _BUILDLINK_USE

.endif	# VTE_BUILDLINK2_MK
