# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBXINERAMA_BUILDLINK3_MK:=	${LIBXINERAMA_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libXinerama
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NlibXinerama}
BUILDLINK_PACKAGES+=	libXinerama

.if !empty(LIBXINERAMA_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libXinerama+=	libXinerama>=1.0.1
BUILDLINK_PKGSRCDIR.libXinerama?=	../../wip/libXinerama
.endif	# LIBXINERAMA_BUILDLINK3_MK

.include "../../wip/libX11/buildlink3.mk"
.include "../../wip/libXext/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../wip/xineramaproto/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
