# $NetBSD$
#
# This Makefile fragment is included by packages that use libebml.
#

BUILDLINK_DEPMETHOD.libebml?=	build

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBEBML_BUILDLINK3_MK:=	${LIBEBML_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libebml
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibebml}
BUILDLINK_PACKAGES+=	libebml

.if !empty(LIBEBML_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libebml+=	libebml>=0.6.5
BUILDLINK_PKGSRCDIR.libebml?=	../../wip/libebml
.endif	# LIBEBML_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
