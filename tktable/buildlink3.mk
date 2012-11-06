# $NetBSD$

BUILDLINK_TREE+=	tktable

.if !defined(TKTABLE_BUILDLINK3_MK)
TKTABLE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.tktable+=	tktable>=2.10
BUILDLINK_PKGSRCDIR.tktable?=	../../wip/tktable

pkgbase := tktable
.include "../../mk/pkg-build-options.mk"


.if !empty(PKG_BUILD_OPTIONS:Mpthread)
.include "../../mk/pthread.buildlink3.mk"
.endif


.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/tk/buildlink3.mk"
.endif # TKTABLE_BUILDLINK3_MK

BUILDLINK_TREE+=	-tktable
