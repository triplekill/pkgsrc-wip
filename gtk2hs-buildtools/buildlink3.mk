# $NetBSD$

BUILDLINK_TREE+=	gtk2hs-buildtools

.if !defined(GTK2HS_BUILDTOOLS_BUILDLINK3_MK)
GTK2HS_BUILDTOOLS_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.gtk2hs-buildtools?=	build
BUILDLINK_API_DEPENDS.gtk2hs-buildtools+=	gtk2hs-buildtools>=0.12
BUILDLINK_PKGSRCDIR.gtk2hs-buildtools?=	../../wip/gtk2hs-buildtools
.endif	# GTK2HS_BUILDTOOLS_BUILDLINK3_MK

BUILDLINK_TREE+=	-gtk2hs-buildtools
