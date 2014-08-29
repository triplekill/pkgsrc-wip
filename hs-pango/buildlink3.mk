# $NetBSD$

BUILDLINK_TREE+=	hs-pango

.if !defined(HS_PANGO_BUILDLINK3_MK)
HS_PANGO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-pango+=	hs-pango>=0.12.3
BUILDLINK_ABI_DEPENDS.hs-pango+=	hs-pango>=0.12.3
BUILDLINK_PKGSRCDIR.hs-pango?=	../../wip/hs-pango

.include "../../devel/pango/buildlink3.mk"
.include "../../wip/hs-cairo/buildlink3.mk"
.include "../../wip/hs-glib/buildlink3.mk"
.include "../../devel/hs-mtl/buildlink3.mk"
.endif	# HS_PANGO_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-pango
