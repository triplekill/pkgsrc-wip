# $NetBSD: $

.include "../../mk/bsd.fast.prefs.mk"

BUILDLINK_TREE+=	wxGTK-unicode

.if !defined(WXGTK_UNICODE_BUILDLINK3_MK)
WXGTK_UNICODE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.wxGTK-unicode+=	wxGTK-unicode>=2.8.0
BUILDLINK_ABI_DEPENDS.wxGTK-unicode?=	wxGTK-unicode>=2.8.8nb1
BUILDLINK_PKGSRCDIR.wxGTK-unicode?=	../../wip/wxGTK-unicode

.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../graphics/glu/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # WXGTK_UNICODE_BUILDLINK3_MK

BUILDLINK_TREE+=	-wxGTK-unicode
