# $NetBSD$

BUILDLINK_TREE+=	hs-haskell-src

.if !defined(HS_HASKELL_SRC_BUILDLINK3_MK)
HS_HASKELL_SRC_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-haskell-src+=	hs-haskell-src>=1.0
BUILDLINK_PKGSRCDIR.hs-haskell-src?=	../../wip/hs-haskell-src

.include "../../wip/hs-syb/buildlink3.mk"
.endif	# HS_HASKELL_SRC_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-haskell-src
