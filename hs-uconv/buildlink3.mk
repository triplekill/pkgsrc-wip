# $NetBSD$

BUILDLINK_TREE+=	hs-uconv

.if !defined(HS_UCONV_BUILDLINK3_MK)
HS_UCONV_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-uconv+=	hs-uconv>=0.0.3
BUILDLINK_ABI_DEPENDS.hs-uconv?=	hs-uconv>=0.0.3nb2
BUILDLINK_PKGSRCDIR.hs-uconv?=	../../wip/hs-uconv

.include "../../textproc/icu/buildlink3.mk"
.endif # HS_UCONV_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-uconv
