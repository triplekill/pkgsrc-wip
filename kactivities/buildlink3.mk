# $NetBSD: buildlink3.mk,v 1.8 2011/01/13 13:36:55 wiz Exp $

BUILDLINK_TREE+=	kactivities

.if !defined(KACTIVITIES_BUILDLINK3_MK)
KACTIVITIES_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kactivities+=	kactivities>=4.7.95
BUILDLINK_ABI_DEPENDS.kactivities?=	kactivities>=4.7.95
BUILDLINK_PKGSRCDIR.kactivities?=	../../wip/kactivities

.include "../../wip/kdelibs4/buildlink3.mk"
.endif # KACTIVITIES_BUILDLINK3_MK

BUILDLINK_TREE+=	-kactivities
