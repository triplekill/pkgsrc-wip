# $NetBSD$
#
# This Makefile fragment is included by packages that use libXt.
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBXT_BUILDLINK3_MK:=	${LIBXT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libXt
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NlibXt}
BUILDLINK_PACKAGES+=	libXt

.if !empty(LIBXT_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libXt+=		libXt>=0.99.2
BUILDLINK_PKGSRCDIR.libXt?=		../../wip/libXt

.include "../../wip/libSM/buildlink3.mk"
.endif # LIBXT_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
