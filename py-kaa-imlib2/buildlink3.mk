# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_KAA_IMLIB2_BUILDLINK3_MK:=	${PY_KAA_IMLIB2_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	py-kaa-imlib2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy-kaa-imlib2}
BUILDLINK_PACKAGES+=	py-kaa-imlib2
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}py-kaa-imlib2

.if ${PY_KAA_IMLIB2_BUILDLINK3_MK} == "+"
.include "../../lang/python/pyversion.mk"
BUILDLINK_API_DEPENDS.py-kaa-imlib2+=	${PYPKGPREFIX}-kaa-imlib2>=0.2.3
BUILDLINK_PKGSRCDIR.py-kaa-imlib2?=	../../wip/py-kaa-imlib2
.endif	# PY_KAA_IMLIB2_BUILDLINK3_MK

.include "../../wip/py-kaa-base/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
