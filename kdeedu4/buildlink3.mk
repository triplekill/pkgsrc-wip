# $NetBSD: buildlink3.mk,v 1.8 2011/01/13 13:36:55 wiz Exp $

BUILDLINK_TREE+=	kdeedu4

.if !defined(KDEEDU4_BUILDLINK3_MK)
KDEEDU4_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kdeedu4+=	kdeedu4>=4.1.1
BUILDLINK_ABI_DEPENDS.kdeedu4?=	kdeedu4>=4.5.4nb1
BUILDLINK_PKGSRCDIR.kdeedu4?=	../../misc/kdeedu4

.include "../../wip/kdelibs4/buildlink3.mk"
.endif # KDEEDU4_BUILDLINK3_MK

BUILDLINK_TREE+=	-kdeedu4
