# $NetBSD$
#
# This Makefile fragment is included by packages that use ming.
#
# This file was created automatically using createbuildlink 2.8.
#

.if !defined(MING_BUILDLINK2_MK)
MING_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			ming
BUILDLINK_DEPENDS.ming?=		ming>=0.2
BUILDLINK_PKGSRCDIR.ming?=		../../wip/ming

EVAL_PREFIX+=	BUILDLINK_PREFIX.ming=ming
BUILDLINK_PREFIX.ming_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.ming+=	include/ming.h
BUILDLINK_FILES.ming+=	include/mingpp.h
BUILDLINK_FILES.ming+=	lib/libming.*
BUILDLINK_FILES.ming+=	lib/libming.a

BUILDLINK_TARGETS+=	ming-buildlink

ming-buildlink: _BUILDLINK_USE

.endif	# MING_BUILDLINK2_MK
