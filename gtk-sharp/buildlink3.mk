# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
GTK_SHARP_BUILDLINK3_MK:=	${GTK_SHARP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gtk-sharp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngtk-sharp}
BUILDLINK_PACKAGES+=	gtk-sharp

.if !empty(GTK_SHARP_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.gtk-sharp+=	gtk-sharp>=0.18
BUILDLINK_PKGSRCDIR.gtk-sharp?=	../../wip/gtk-sharp
.endif	# GTK_SHARP_BUILDLINK3_MK

.include "../../databases/libgnomedb/buildlink3.mk"
.include "../../graphics/libgdiplus/buildlink3.mk"
.include "../../graphics/librsvg2/buildlink3.mk"
.include "../../multimedia/gstreamer/buildlink3.mk"
.include "../../lang/mono/buildlink3.mk"
.include "../../www/gtkhtml3/buildlink3.mk"
.include "../../x11/vte/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
