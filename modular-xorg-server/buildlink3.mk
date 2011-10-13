# $NetBSD: buildlink3.mk,v 1.9 2010/09/14 11:03:10 wiz Exp $

BUILDLINK_TREE+=	modular-xorg-server

.if !defined(MODULAR_XORG_SERVER_BUILDLINK3_MK)
MODULAR_XORG_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.modular-xorg-server+=	modular-xorg-server>=1.6.0
BUILDLINK_ABI_DEPENDS.modular-xorg-server+=	modular-xorg-server>=1.6.5nb8
BUILDLINK_PKGSRCDIR.modular-xorg-server?=	../../x11/modular-xorg-server

.include "../../sysutils/libpciaccess/buildlink3.mk"
.include "../../x11/pixman/buildlink3.mk"

.include "../../x11/compositeproto/buildlink3.mk"
.include "../../x11/dri2proto/buildlink3.mk"
.include "../../x11/fontsproto/buildlink3.mk"
.include "../../x11/inputproto/buildlink3.mk"
.include "../../x11/randrproto/buildlink3.mk"
.include "../../x11/renderproto/buildlink3.mk"
.include "../../x11/videoproto/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../x11/xf86driproto/buildlink3.mk"
.include "../../x11/xproto/buildlink3.mk"
.endif # MODULAR_XORG_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-modular-xorg-server
