# $NetBSD$
# XXX
# XXX This file was created automatically using createbuildlink-3.8.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified buildlink3.mk files.
# XXX
# XXX Packages that only install static libraries or headers should
# XXX include the following line:
# XXX
# XXX	BUILDLINK_DEPMETHOD.glib-java?=	build

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
GLIB_JAVA_BUILDLINK3_MK:=	${GLIB_JAVA_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	glib-java
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nglib-java}
BUILDLINK_PACKAGES+=	glib-java

.if !empty(GLIB_JAVA_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.glib-java+=	glib-java>=0.2.1
BUILDLINK_PKGSRCDIR.glib-java?=	../../wip/glib-java
.endif	# GLIB_JAVA_BUILDLINK3_MK

# XXX
# XXX Uncomment and keep only the buildlink3 lines below which are directly
# XXX needed for dependencies to compile, link, and run.  If this package
# XXX provides a wrappered API or otherwise does not expose the APIs of the
# XXX buildlink3 lines below to dependencies, remove them.
# XXX
#.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
