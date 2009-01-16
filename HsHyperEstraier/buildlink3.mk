# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
HSHYPERESTRAIER_BUILDLINK3_MK:=	${HSHYPERESTRAIER_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	HsHyperEstraier
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NHsHyperEstraier}
BUILDLINK_PACKAGES+=	HsHyperEstraier
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}HsHyperEstraier

.if ${HSHYPERESTRAIER_BUILDLINK3_MK} == "+"
BUILDLINK_DEPMETHOD.HsHyperEstraier?=	build
BUILDLINK_API_DEPENDS.HsHyperEstraier+=	HsHyperEstraier>=0.3
BUILDLINK_PKGSRCDIR.HsHyperEstraier?=	../../wip/HsHyperEstraier
.endif	# HSHYPERESTRAIER_BUILDLINK3_MK

.include "../../textproc/hyperestraier/buildlink3.mk"
.include "../../wip/hs-network/buildlink3.mk"
.include "../../wip/hs-utf8-string/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
