# $NetBSD$

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
HASKELL_SRC_EXTS_BUILDLINK3_MK:=	${HASKELL_SRC_EXTS_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	haskell-src-exts
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nhaskell-src-exts}
BUILDLINK_PACKAGES+=	haskell-src-exts
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}haskell-src-exts

.if ${HASKELL_SRC_EXTS_BUILDLINK3_MK} == "+"
BUILDLINK_DEPMETHOD.haskell-src-exts?=	build
BUILDLINK_API_DEPENDS.haskell-src-exts+=	haskell-src-exts>=0.4.8
BUILDLINK_PKGSRCDIR.haskell-src-exts?=	../../wip/haskell-src-exts
.endif	# HASKELL_SRC_EXTS_BUILDLINK3_MK

.include "../../wip/cpphs/buildlink3.mk"

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH:S/+$//}
