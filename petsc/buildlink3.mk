# $NetBSD$
BUILDLINK_DEPMETHOD.petsc?=	build

BUILDLINK_TREE+=	petsc

.if !defined(PETSC_BUILDLINK3_MK)
PETSC_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.petsc+=	petsc>=3.1p2
BUILDLINK_PKGSRCDIR.petsc?=	../../wip/petsc

.include "../../math/lapack/buildlink3.mk"
.include "../../math/blas/buildlink3.mk"
.endif	# PETSC_BUILDLINK3_MK

BUILDLINK_TREE+=	-petsc
