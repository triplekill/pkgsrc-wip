# $NetBSD$

BUILDLINK_TREE+=	hs-hxt-xpath

.if !defined(HS_HXT_XPATH_BUILDLINK3_MK)
HS_HXT_XPATH_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-hxt-xpath+=	hs-hxt-xpath>=9.1.2
BUILDLINK_ABI_DEPENDS.hs-hxt-xpath+=	hs-hxt-xpath>=9.1.2.1
BUILDLINK_PKGSRCDIR.hs-hxt-xpath?=	../../wip/hs-hxt-xpath

.include "../../wip/hs-hxt/buildlink3.mk"
.include "../../textproc/hs-parsec/buildlink3.mk"
.endif	# HS_HXT_XPATH_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-hxt-xpath
