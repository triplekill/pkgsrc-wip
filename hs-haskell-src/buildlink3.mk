# $NetBSD$

BUILDLINK_TREE+=	hs-haskell-src

.if !defined(HS_HASKELL_SRC_BUILDLINK3_MK)
HS_HASKELL_SRC_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-haskell-src+=	hs-haskell-src>=1.0.1.3
BUILDLINK_PKGSRCDIR.hs-haskell-src?=	../../wip/hs-haskell-src
.endif	# HS_HASKELL_SRC_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-haskell-src
