# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
XFCE4_TASKMANAGER_BUILDLINK3_MK:=	${XFCE4_TASKMANAGER_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	xfce4-taskmanager
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-taskmanager}
BUILDLINK_PACKAGES+=	xfce4-taskmanager

.if !empty(XFCE4_TASKMANAGER_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.xfce4-taskmanager+=	xfce4-appfinder>=0.3.1
BUILDLINK_PKGSRCDIR.xfce4-taskmanager?=	../../wip/xfce4-taskmanager
.endif	# XFCE4_TASKMANAGER_BUILDLINK3_MK

.include "../../x11/libxfce4gui/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
