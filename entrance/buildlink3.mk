# $NetBSD$

BUILDLINK_TREE+=	entrance

.if !defined(ENTRANCE_BUILDLINK3_MK)
ENTRANCE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.entrance+=	entrance>=0.9.9.042nb1
BUILDLINK_ABI_DEPENDS.entrance?=	entrance>=0.9.9.050nb3
BUILDLINK_PKGSRCDIR.entrance?=	../../wip/entrance

.include	"../../wip/ecore/buildlink3.mk"
.include	"../../graphics/evas/buildlink3.mk"
.include	"../../wip/edje/buildlink3.mk"
.include	"../../wip/esmart/buildlink3.mk"
.include	"../../wip/efreet/buildlink3.mk"
.endif # ENTRANCE_BUILDLINK3_MK

BUILDLINK_TREE+=	-entrance
