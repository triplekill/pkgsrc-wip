# $NetBSD$
# XXX
# XXX This file was created automatically using createbuildlink-3.4.
# XXX After this file as been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified buildlink[23].mk files.
# XXX
# XXX Packages that only install static libraries or headers should
# XXX include the following line:
# XXX
# XXX	BUILDLINK_DEPMETHOD.postgis?=	build

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
POSTGIS_BUILDLINK3_MK:=	${POSTGIS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	postgis
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npostgis}
BUILDLINK_PACKAGES+=	postgis

.if !empty(POSTGIS_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.postgis+=	postgis>=0.7.5
BUILDLINK_PKGSRCDIR.postgis?=	../../wip/postgis
.endif	# POSTGIS_BUILDLINK3_MK

.include "../../databases/postgresql-lib/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
