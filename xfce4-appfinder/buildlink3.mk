# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
XFCE4_APPFINDER_BUILDLINK3_MK:=	${XFCE4_APPFINDER_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	xfce4-appfinder
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-appfinder}
BUILDLINK_PACKAGES+=	xfce4-appfinder
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}xfce4-appfinder

.if ${XFCE4_APPFINDER_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.xfce4-appfinder+=	xfce4-appfinder>=4.3.90.2
BUILDLINK_PKGSRCDIR.xfce4-appfinder?=	../../wip/xfce4-appfinder
.endif	# XFCE4_APPFINDER_BUILDLINK3_MK

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../wip/libxfce4gui/buildlink3.mk"
.include "../../wip/xfce4-dev-tools/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
