# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
EET_BUILDLINK3_MK:=	${EET_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	eet
.endif

BUILDLINK_PACKAGES+=	eet

.if !empty(EET_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.eet+=		eet>=0.9.9
BUILDLINK_PKGSRCDIR.eet?=	../../wip/eet
.endif	# EET_BUILDLINK3_MK

.include "../../devel/libtool/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/jpeg/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
