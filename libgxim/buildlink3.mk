# $NetBSD$

BUILDLINK_TREE+=	libgxim

.if !defined(LIBGXIM_BUILDLINK3_MK)
LIBGXIM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgxim+=	libgxim>=0.3.3
BUILDLINK_PKGSRCDIR.libgxim?=	../../wip/libgxim

.include "../../devel/check/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../lang/ruby/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"

.endif	# LIBGXIM_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgxim
