# $NetBSD$

BUILDLINK_TREE+=	glfw

.if !defined(GLFW_BUILDLINK3_MK)
GLFW_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.glfw+=	glfw>=2.7
BUILDLINK_PKGSRCDIR.glfw?=	../../wip/glfw

#.include "../../graphics/glu/buildlink3.mk"
#.include "../../graphics/MesaLib/buildlink3.mk"
#.include "../../x11/libX11/buildlink3.mk"
#.include "../../x11/libXrandr/buildlink3.mk"
.endif	# GLFW_BUILDLINK3_MK

BUILDLINK_TREE+=	-glfw
