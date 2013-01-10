# $NetBSD$

BUILDLINK_TREE+=	libuna

.if !defined(LIBUNA_BUILDLINK3_MK)
LIBUNA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libuna+=	libuna>=20130103
BUILDLINK_PKGSRCDIR.libuna?=	../../wip/libuna

pkgbase := libuna
.include "../../mk/pkg-build-options.mk"


.if !empty(PKG_BUILD_OPTIONS.libuna:Mnls)
.include "../../devel/gettext-lib/buildlink3.mk"
.endif

#.include "../../wip/libcerror/buildlink3.mk"
.endif	# LIBUNA_BUILDLINK3_MK

BUILDLINK_TREE+=	-libuna
