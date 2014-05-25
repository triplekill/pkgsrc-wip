# $NetBSD$

BUILDLINK_TREE+=	hs-unordered-containers

.if !defined(HS_UNORDERED_CONTAINERS_BUILDLINK3_MK)
HS_UNORDERED_CONTAINERS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-unordered-containers+=	hs-unordered-containers>=0.2.4
BUILDLINK_PKGSRCDIR.hs-unordered-containers?=	../../wip/hs-unordered-containers

.include "../../devel/hs-hashable/buildlink3.mk"
.endif	# HS_UNORDERED_CONTAINERS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-unordered-containers
