# $NetBSD$
#
# This Makefile fragment is included by packages that use libXres.
#
# This file was created automatically using createbuildlink-3.1.
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBXRES_BUILDLINK3_MK:=	${LIBXRES_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libXres
.endif

.if !empty(LIBXRES_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=			libXres
BUILDLINK_DEPENDS.libXres+=		libXres>=1.0.1
BUILDLINK_PKGSRCDIR.libXres?=		../../wip/libXres

.include "../../wip/libX11/buildlink3.mk"
.include "../../wip/libXau/buildlink3.mk"
.include "../../wip/libXext/buildlink3.mk"
.include "../../wip/xproto/buildlink3.mk"
.include "../../wip/xextensions/buildlink3.mk"
.include "../../wip/resourceext/buildlink3.mk"

.endif # LIBXRES_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
