# $NetBSD$

.include "../../mk/bsd.fast.prefs.mk"

.if ${X11_TYPE} != "modular"
.include "../../mk/x11.buildlink3.mk"
.else

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBXV_BUILDLINK3_MK:=	${LIBXV_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libXv
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NlibXv}
BUILDLINK_PACKAGES+=	libXv
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libXv

.if ${LIBXV_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libXv+=	libXv>=1.0.3
BUILDLINK_PKGSRCDIR.libXv?=	../../wip/libXv
.endif	# LIBXV_BUILDLINK3_MK

.include "../../wip/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/videoproto/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../x11/xproto/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
.endif
