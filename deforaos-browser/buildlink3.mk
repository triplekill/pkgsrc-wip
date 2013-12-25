# $NetBSD$

BUILDLINK_TREE+=	deforaos-browser

.if !defined(DEFORAOS_BROWSER_BUILDLINK3_MK)
DEFORAOS_BROWSER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.deforaos-browser+=	deforaos-browser>=0.4.5
BUILDLINK_PKGSRCDIR.deforaos-browser?=	../../wip/deforaos-browser

.include "../../x11/gtk3/buildlink3.mk"
.endif	# DEFORAOS_BROWSER_BUILDLINK3_MK

BUILDLINK_TREE+=	-deforaos-browser
