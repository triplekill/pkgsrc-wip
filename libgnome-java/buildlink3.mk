# $NetBSD$

BUILDLINK_TREE+=	libgnome-java

BUILDLINK_API_DEPENDS.libgnome-java+=	libgnome-java>=2.10.1
BUILDLINK_PKGSRCDIR.libgnome-java?=	../../wip/libgnome-java

.include "../../wip/libgtk-java/buildlink3.mk"
.endif # LIBGNOME_JAVA_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgnome-java
