# $NetBSD$

BUILDLINK_TREE+=	smpeg2

.if !defined(SMPEG2_BUILDLINK3_MK)
SMPEG2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.smpeg2+=	smpeg2>=2.0.0
BUILDLINK_PKGSRCDIR.smpeg2?=	../../wip/smpeg2

.include "../../wip/SDL2/buildlink3.mk"
.endif	# SMPEG2_BUILDLINK3_MK

BUILDLINK_TREE+=	-smpeg2
