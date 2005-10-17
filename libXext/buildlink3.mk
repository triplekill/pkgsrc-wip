# $NetBSD$
#
# This Makefile fragment is included by packages that use libXext.
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBXEXT_BUILDLINK3_MK:=	${LIBXEXT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libXext
.endif

.if !empty(LIBXEXT_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=			libXext
BUILDLINK_DEPENDS.libXext+=		libXext>=0.99.0
BUILDLINK_PKGSRCDIR.libXext?=		../../wip/libXext

.include "../../wip/libX11/buildlink3.mk"

.endif # LIBXEXT_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
