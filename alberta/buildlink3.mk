# $NetBSD$

BUILDLINK_TREE+=	alberta

.if !defined(ALBERTA_BUILDLINK3_MK)
ALBERTA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.alberta+=	alberta>=2.0.1
BUILDLINK_PKGSRCDIR.alberta?=	../../wip/alberta

.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../math/blas/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libICE/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.endif	# ALBERTA_BUILDLINK3_MK

BUILDLINK_TREE+=	-alberta
