# $NetBSD$
#
# This Makefile fragment is included by packages that use libpathan.
#
# This file was created automatically using createbuildlink 2.9.
#

.if !defined(LIBPATHAN_BUILDLINK2_MK)
LIBPATHAN_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			libpathan
BUILDLINK_DEPENDS.libpathan?=		libpathan>=1.2.2
BUILDLINK_PKGSRCDIR.libpathan?=		../../wip/libpathan

EVAL_PREFIX+=	BUILDLINK_PREFIX.libpathan=libpathan
BUILDLINK_PREFIX.libpathan_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.libpathan+=	include/pathan/*.hpp
BUILDLINK_FILES.libpathan+=	include/pathan/ext/*.hpp
BUILDLINK_FILES.libpathan+=	lib/libpathan.*

.include "../../textproc/xerces-c/buildlink2.mk"

BUILDLINK_TARGETS+=	libpathan-buildlink

libpathan-buildlink: _BUILDLINK_USE

.endif	# LIBPATHAN_BUILDLINK2_MK
