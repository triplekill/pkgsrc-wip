# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBXFCE4MCS_BUILDLINK3_MK:=	${LIBXFCE4MCS_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libxfce4mcs
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibxfce4mcs}
BUILDLINK_PACKAGES+=	libxfce4mcs
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libxfce4mcs

.if ${LIBXFCE4MCS_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libxfce4mcs+=	libxfce4mcs>=4.4.0
BUILDLINK_PKGSRCDIR.libxfce4mcs?=	../../wip/libxfce4mcs
.endif	# LIBXFCE4MCS_BUILDLINK3_MK

.include "../../x11/startup-notification/buildlink3.mk"
.include "../../wip/libxfce4util/buildlink3.mk"
.include "../../wip/xfce4-dev-tools/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
