# $NetBSD$

BUILDLINK_DEPMETHOD.mlton?=	build

BUILDLINK_TREE+=	mlton

.if !defined(MLTON_BUILDLINK3_MK)
MLTON_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mlton+=	mlton-*
BUILDLINK_PKGSRCDIR.mlton?=	../../wip/mlton-svn
BUILDLINK_INCDIRS.mlton= lib/mlton/include
BUILDLINK_LIBDIRS.mlton= lib/mlton/self
#BUILDLINK_CONTENTS_FILTER.mlton= ${EGREP} '.*\.a$$|.*\.h$$'
.include "../../devel/gmp/buildlink3.mk"
.endif	# MLTON_BUILDLINK3_MK

BUILDLINK_TREE+=	-mlton
