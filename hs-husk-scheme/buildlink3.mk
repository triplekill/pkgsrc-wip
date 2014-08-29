# $NetBSD$

BUILDLINK_TREE+=	hs-husk-scheme

.if !defined(HS_HUSK_SCHEME_BUILDLINK3_MK)
HS_HUSK_SCHEME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-husk-scheme+=	hs-husk-scheme>=3.17
BUILDLINK_ABI_DEPENDS.hs-husk-scheme+=	hs-husk-scheme>=3.17
BUILDLINK_PKGSRCDIR.hs-husk-scheme?=	../../wip/hs-husk-scheme

.include "../../devel/hs-ghc-paths/buildlink3.mk"
.include "../../wip/hs-haskeline/buildlink3.mk"
.include "../../wip/hs-knob/buildlink3.mk"
.include "../../devel/hs-mtl/buildlink3.mk"
.include "../../textproc/hs-parsec/buildlink3.mk"
.include "../../devel/hs-transformers/buildlink3.mk"
.include "../../devel/hs-utf8-string/buildlink3.mk"
.endif	# HS_HUSK_SCHEME_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-husk-scheme
