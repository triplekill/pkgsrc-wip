# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
RTE_BUILDLINK3_MK:=	${RTE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	rte
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nrte}
BUILDLINK_PACKAGES+=	rte

.if !empty(RTE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.rte+=		rte>=0.5.6
BUILDLINK_PKGSRCDIR.rte?=	../../wip/rte
.endif	# RTE_BUILDLINK3_MK

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
