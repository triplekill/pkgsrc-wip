# $NetBSD$
#
# This Makefile fragment is included by packages that use dbxml.
#
# This file was created automatically using createbuildlink 2.9.
#

.if !defined(DBXML_BUILDLINK2_MK)
DBXML_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			dbxml
BUILDLINK_DEPENDS.dbxml?=		dbxml>=1.2.0
BUILDLINK_PKGSRCDIR.dbxml?=		../../wip/dbxml

EVAL_PREFIX+=	BUILDLINK_PREFIX.dbxml=dbxml
BUILDLINK_PREFIX.dbxml_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.dbxml+=	include/dbxml/*.hpp
BUILDLINK_FILES.dbxml+=	lib/libdbxml-1.*
BUILDLINK_FILES.dbxml+=	lib/libdbxml-1.2.*
BUILDLINK_FILES.dbxml+=	lib/libdbxml.*

.include "../../databases/db4/buildlink2.mk"
.include "../../textproc/libpathan/buildlink2.mk"
.include "../../textproc/xerces-c/buildlink2.mk"

BUILDLINK_TARGETS+=	dbxml-buildlink

dbxml-buildlink: _BUILDLINK_USE

.endif	# DBXML_BUILDLINK2_MK
