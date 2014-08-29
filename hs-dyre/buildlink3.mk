# $NetBSD$

BUILDLINK_TREE+=	hs-dyre

.if !defined(HS_DYRE_BUILDLINK3_MK)
HS_DYRE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-dyre+=	hs-dyre>=0.8.6
BUILDLINK_ABI_DEPENDS.hs-dyre+=	hs-dyre>=0.8.6
BUILDLINK_PKGSRCDIR.hs-dyre?=	../../wip/hs-dyre

.include "../../wip/hs-executable-path/buildlink3.mk"
.include "../../devel/hs-ghc-paths/buildlink3.mk"
.include "../../wip/hs-io-storage/buildlink3.mk"
.include "../../wip/hs-xdg-basedir/buildlink3.mk"
.endif	# HS_DYRE_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-dyre
