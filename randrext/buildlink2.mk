# $NetBSD$
#
# This Makefile fragment is included by packages that use randrext.
#
# This file was created automatically using createbuildlink 2.8.
#

.if !defined(RANDREXT_BUILDLINK2_MK)
RANDREXT_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			randrext
BUILDLINK_DEPENDS.randrext?=		randrext>=1.0
BUILDLINK_PKGSRCDIR.randrext?=		../../wip/randrext

EVAL_PREFIX+=	BUILDLINK_PREFIX.randrext=randrext
BUILDLINK_PREFIX.randrext_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.randrext+=	include/X11/extensions/randr.h
BUILDLINK_FILES.randrext+=	include/X11/extensions/randrproto.h


BUILDLINK_TARGETS+=	randrext-buildlink

randrext-buildlink: _BUILDLINK_USE

.endif	# RANDREXT_BUILDLINK2_MK
