# $NetBSD$
#
# This Makefile fragment is included by packages that use libuuid.
#

.if !defined(LIBUUID_BUILDLINK2_MK)
LIBUUID_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			libuuid
BUILDLINK_DEPENDS.libuuid?=		libuuid>=1.34
BUILDLINK_PKGSRCDIR.libuuid?=		../../wip/libuuid

EVAL_PREFIX+=	BUILDLINK_PREFIX.libuuid=libuuid
BUILDLINK_PREFIX.libuuid_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.libuuid+=	include/uuid/*.h
BUILDLINK_FILES.libuuid+=	lib/libuuid.*

.include "../../devel/gettext-lib/buildlink2.mk"

BUILDLINK_TARGETS+=	libuuid-buildlink

libuuid-buildlink: _BUILDLINK_USE

.endif	# LIBUUID_BUILDLINK2_MK
