# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBGNOME_JAVA_BUILDLINK3_MK:=	${LIBGNOME_JAVA_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libgnome-java
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibgnome-java}
BUILDLINK_PACKAGES+=	libgnome-java

.if !empty(LIBGNOME_JAVA_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libgnome-java+=	libgnome-java>=2.10.1
BUILDLINK_PKGSRCDIR.libgnome-java?=	../../wip/libgnome-java
.endif	# LIBGNOME_JAVA_BUILDLINK3_MK

.include "../../wip/libgtk-java/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
