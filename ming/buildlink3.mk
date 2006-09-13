# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
MING_BUILDLINK3_MK:=	${MING_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ming
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nming}
BUILDLINK_PACKAGES+=	ming
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}ming

.if !empty(MING_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.ming+=	ming>=0.2
BUILDLINK_PKGSRCDIR.ming?=	../../wip/ming
.endif	# MING_BUILDLINK3_MK

.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/libungif/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
