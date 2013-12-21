# $NetBSD$

BUILDLINK_TREE+=	libgrss

.if !defined(LIBGRSS_BUILDLINK3_MK)
LIBGRSS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgrss+=	libgrss>=0.5.0
BUILDLINK_ABI_DEPENDS.libgrss+=	libgrss>=0.5.0
BUILDLINK_PKGSRCDIR.libgrss?=	../../wip/libgrss

.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/gnome-doc-utils/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../net/libsoup24/buildlink3.mk"
.endif	# LIBGRSS_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgrss
