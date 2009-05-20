# $NetBSD$

BUILDLINK_TREE+=	kdeedu4

.if !defined(KDEEDU4_BUILDLINK3_MK)
KDEEDU4_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kdeedu4+=	kdeedu4>=4.1.1
BUILDLINK_ABI_DEPENDS.kdeedu4?=	kdeedu4>=4.2.3nb1
BUILDLINK_PKGSRCDIR.kdeedu4?=	../../wip/kdeedu4

#.include "../../devel/libusb/buildlink3.mk"
#.include "../../devel/readline/buildlink3.mk"
#.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../wip/kdelibs4/buildlink3.mk"
#.include "../../wip/kdebase-runtime4/buildlink3.mk"
#.include "../../wip/kdebase-workspace4/buildlink3.mk"
.endif # KDEEDU4_BUILDLINK3_MK

BUILDLINK_TREE+=	-kdeedu4
