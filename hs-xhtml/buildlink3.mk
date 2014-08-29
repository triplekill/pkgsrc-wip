# $NetBSD$

BUILDLINK_TREE+=	hs-xhtml

.if !defined(HS_XHTML_BUILDLINK3_MK)
HS_XHTML_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-xhtml+=	hs-xhtml>=3000.2.1
BUILDLINK_ABI_DEPENDS.hs-xhtml+=	hs-xhtml>=3000.2.1
BUILDLINK_PKGSRCDIR.hs-xhtml?=	../../wip/hs-xhtml
.endif	# HS_XHTML_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-xhtml
