# $NetBSD: buildlink3.mk,v 1.14 2005/10/01 04:42:09 taya Exp $

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
SEAMONKEY_GTK1_BUILDLINK3_MK:=		${SEAMONKEY_GTK1_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=			seamonkey-gtk1
.endif

BUILDLINK_PACKAGES:=			${BUILDLINK_PACKAGES:Nseamonkey-gtk1}
BUILDLINK_PACKAGES+=			seamonkey-gtk1

.if !empty(SEAMONKEY_GTK1_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.seamonkey-gtk1+=	seamonkey-gtk1>=1.0
BUILDLINK_RECOMMENDED.seamonkey-gtk1+=	seamonkey-gtk1>=1.0
BUILDLINK_PKGSRCDIR.seamonkey-gtk1?=	../../wip/seamonkey-gtk1
.endif	# SEAMONKEY_GTK1_BUILDLINK3_MK

.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/gdk-pixbuf/buildlink3.mk"
.include "../../graphics/jpeg/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../net/ORBit/buildlink3.mk"
.include "../../x11/gtk/buildlink3.mk"

BUILDLINK_DEPTH:=    			 ${BUILDLINK_DEPTH:S/+$//}
