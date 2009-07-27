# $NetBSD$

BUILDLINK_TREE+=	hs-HsHyperEstraier

.if !defined(HS_HSHYPERESTRAIER_BUILDLINK3_MK)
HS_HSHYPERESTRAIER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-HsHyperEstraier+=	hs-HsHyperEstraier>=0.3.1
BUILDLINK_PKGSRCDIR.hs-HsHyperEstraier?=	../../wip/hs-HsHyperEstraier

.include "../../textproc/hyperestraier/buildlink3.mk"
.include "../../wip/hs-network/buildlink3.mk"
.include "../../wip/hs-utf8-string/buildlink3.mk"
.endif	# HS_HSHYPERESTRAIER_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-HsHyperEstraier
