# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBXPM_BUILDLINK3_MK:=	${LIBXPM_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libXpm
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NlibXpm}
BUILDLINK_PACKAGES+=	libXpm

.if !empty(LIBXPM_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libXpm+=	libXpm>=3.5.4.2
BUILDLINK_PKGSRCDIR.libXpm?=	../../wip/libXpm
.endif	# LIBXPM_BUILDLINK3_MK

#.include "../../wip/xproto/buildlink3.mk"
.include "../../wip/libX11/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
