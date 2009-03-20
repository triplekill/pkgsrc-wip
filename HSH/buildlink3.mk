# $NetBSD$

BUILDLINK_TREE+=	HSH

.if !defined(HSH_BUILDLINK3_MK)
HSH_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.HSH?=	build
BUILDLINK_API_DEPENDS.HSH+=	HSH>=1.2.6
BUILDLINK_PKGSRCDIR.HSH?=	../../wip/HSH

.include "../../wip/MissingH/buildlink3.mk"
.include "../../wip/hslogger/buildlink3.mk"
.endif # HSH_BUILDLINK3_MK

BUILDLINK_TREE+=	-HSH
