# $NetBSD$

BUILDLINK_TREE+=	HsSVN

.if !defined(HSSVN_BUILDLINK3_MK)
HSSVN_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.HsSVN?=	build
BUILDLINK_API_DEPENDS.HsSVN+=	HsSVN>=0.4
BUILDLINK_PKGSRCDIR.HsSVN?=	../../wip/HsSVN

.include "../../wip/hs-mtl/buildlink3.mk"
.include "../../wip/stm/buildlink3.mk"
.include "../../devel/subversion-base/buildlink3.mk"
.endif # HSSVN_BUILDLINK3_MK

BUILDLINK_TREE+=	-HsSVN
