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
# XXX	BUILDLINK_DEPMETHOD.postgresql80-postgis-1.0.0?=	build

BUILDLINK_DEPTH:=				${BUILDLINK_DEPTH}+
POSTGRESQL80_POSTGIS_1.0.0_BUILDLINK3_MK:=	${POSTGRESQL80_POSTGIS_1.0.0_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	postgresql80-postgis-1.0.0
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npostgresql80-postgis-1.0.0}
BUILDLINK_PACKAGES+=	postgresql80-postgis-1.0.0

.if !empty(POSTGRESQL80_POSTGIS_1.0.0_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.postgresql80-postgis-1.0.0+=	postgresql80-postgis-1.0.0>=rc2
BUILDLINK_ABI_DEPENDS.postgresql80-postgis-1.0.0?=	postgresql80-postgis>=1.0.3nb1
BUILDLINK_PKGSRCDIR.postgresql80-postgis-1.0.0?=	../../wip/postgresql80-postgis
.endif	# POSTGRESQL80_POSTGIS_1.0.0_BUILDLINK3_MK

.include "../../geography/geos/buildlink3.mk"
.include "../../misc/proj/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
