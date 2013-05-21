# $NetBSD$

BUILDLINK_TREE+=	hs-semigroups

.if !defined(HS_SEMIGROUPS_BUILDLINK3_MK)
HS_SEMIGROUPS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-semigroups+=	hs-semigroups>=0.9.2
BUILDLINK_PKGSRCDIR.hs-semigroups?=	../../wip/hs-semigroups

.include "../../wip/hs-nats/buildlink3.mk"
.endif	# HS_SEMIGROUPS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-semigroups
