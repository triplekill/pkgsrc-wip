# $NetBSD$
#
# This Makefile fragment is included by packages that use fixesext.
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
FIXESEXT_BUILDLINK3_MK:=	${FIXESEXT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	fixesext
.endif

.if !empty(FIXESEXT_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=			fixesext
BUILDLINK_DEPENDS.fixesext?=		fixesext>=2.0
BUILDLINK_PKGSRCDIR.fixesext?=		../../wip/fixesext

.include "../../wip/xextensions/buildlink3.mk"

.endif # FIXESEXT_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
