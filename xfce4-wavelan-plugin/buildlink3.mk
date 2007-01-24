# $NetBSD$

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
XFCE4_WAVELAN_PLUGIN_BUILDLINK3_MK:=	${XFCE4_WAVELAN_PLUGIN_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	xfce4-wavelan-plugin
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-wavelan-plugin}
BUILDLINK_PACKAGES+=	xfce4-wavelan-plugin
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}xfce4-wavelan-plugin

.if ${XFCE4_WAVELAN_PLUGIN_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.xfce4-wavelan-plugin+=	xfce4-wavelan-plugin>=0.5.3
BUILDLINK_PKGSRCDIR.xfce4-wavelan-plugin?=	../../wip/xfce4-wavelan-plugin
.endif	# XFCE4_WAVELAN_PLUGIN_BUILDLINK3_MK

.include "../../wip/xfce4-panel/buildlink3.mk"
.include "../../wip/xfce4-dev-tools/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH:S/+$//}
