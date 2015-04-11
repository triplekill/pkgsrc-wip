# $NetBSD$

BUILDLINK_TREE+=	liblxqt-mount

.if !defined(LIBLXQT_MOUNT_BUILDLINK3_MK)
LIBLXQT_MOUNT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.liblxqt-mount+=	liblxqt-mount>=0.9.0
BUILDLINK_PKGSRCDIR.liblxqt-mount?=	../../wip/liblxqt-mount

.include "../../x11/qt5-dbus/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# LIBLXQT_MOUNT_BUILDLINK3_MK

BUILDLINK_TREE+=	-liblxqt-mount
