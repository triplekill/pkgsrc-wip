# $NetBSD$
#
# This Makefile fragment is included by packages that use xtrans.
#
# This file was created automatically using createbuildlink 2.8.
#

.if !defined(XTRANS_BUILDLINK2_MK)
XTRANS_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			xtrans
BUILDLINK_DEPENDS.xtrans?=		xtrans>=0.1
BUILDLINK_PKGSRCDIR.xtrans?=		../../wip/xtrans

EVAL_PREFIX+=	BUILDLINK_PREFIX.xtrans=xtrans
BUILDLINK_PREFIX.xtrans_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.xtrans+=	include/X11/Xtrans/*.h

BUILDLINK_TARGETS+=	xtrans-buildlink

xtrans-buildlink: _BUILDLINK_USE

.endif	# XTRANS_BUILDLINK2_MK
