# $NetBSD$
#
# This Makefile fragment is included by packages that use libXmu.
#
# This file was created automatically using createbuildlink-3.0.
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBXMU_BUILDLINK3_MK:=	${LIBXMU_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libXmu
.endif

.if !empty(LIBXMU_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=			libXmu
BUILDLINK_DEPENDS.libXmu+=		libXmu>=6.2.1nb2
BUILDLINK_PKGSRCDIR.libXmu?=		../../wip/libXmu

.include "../../wip/libXt/buildlink3.mk"
.include "../../wip/libX11/buildlink3.mk"
.include "../../wip/libXext/buildlink3.mk"
.include "../../wip/xextensions/buildlink3.mk"
.include "../../wip/xproto/buildlink3.mk"

# libXmu uses libXext's XShapeCombineMask()
LDFLAGS+=	-lXext

.include "../../mk/pthread.buildlink3.mk"
LIBS+=		${BUILDLINK_LDADD.pthread}
LDFLAGS+=	${BUILDLINK_LDADD.pthread}

.endif # LIBXMU_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
