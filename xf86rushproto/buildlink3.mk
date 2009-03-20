# $NetBSD$

BUILDLINK_TREE+=	xf86rushproto

.if !defined(XF86RUSHPROTO_BUILDLINK3_MK)
XF86RUSHPROTO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xf86rushproto+=	xf86rushproto>=1.1.2
BUILDLINK_PKGSRCDIR.xf86rushproto?=	../../wip/xf86rushproto

.include "../../x11/xproto/buildlink3.mk"
.endif # XF86RUSHPROTO_BUILDLINK3_MK

BUILDLINK_TREE+=	-xf86rushproto
