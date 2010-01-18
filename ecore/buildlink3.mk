# $NetBSD$

BUILDLINK_TREE+=	ecore

.if !defined(ECORE_BUILDLINK3_MK)
ECORE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ecore+=	ecore>=0.9.9.062
BUILDLINK_ABI_DEPENDS.ecore?=	ecore>=0.9.9.062nb2
BUILDLINK_PKGSRCDIR.ecore?=	../../wip/ecore

.include "../../devel/eet/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../graphics/evas/buildlink3.mk"
.include "../../graphics/evas-buffer/buildlink3.mk"
.include "../../graphics/evas-software-x11/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../x11/libXScrnSaver/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXp/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.endif # ECORE_BUILDLINK3_MK

BUILDLINK_TREE+=	-ecore
