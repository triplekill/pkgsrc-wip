# $NetBSD$

BUILDLINK_TREE+=	liblxqt

.if !defined(LIBLXQT_BUILDLINK3_MK)
LIBLXQT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.liblxqt+=	liblxqt>=0.9.0
BUILDLINK_PKGSRCDIR.liblxqt?=	../../wip/liblxqt

.include "../../wip/kwindowsystem/buildlink3.mk"
.include "../../wip/libqtxdg/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtx11extras/buildlink3.mk"
.include "../../x11/qt5-qttools/buildlink3.mk"
.endif	# LIBLXQT_BUILDLINK3_MK

BUILDLINK_TREE+=	-liblxqt
