# $NetBSD$

BUILDLINK_TREE+=	hs-terminfo

.if !defined(HS_TERMINFO_BUILDLINK3_MK)
HS_TERMINFO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-terminfo+=	hs-terminfo>=0.3.2
BUILDLINK_ABI_DEPENDS.hs-terminfo+=	hs-terminfo>=0.3.2.6
BUILDLINK_PKGSRCDIR.hs-terminfo?=	../../wip/hs-terminfo

.include "../../devel/ncurses/buildlink3.mk"
.endif	# HS_TERMINFO_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-terminfo
