# $NetBSD$

BUILDLINK_TREE+=	py-instant

.if !defined(PY_INSTANT_BUILDLINK3_MK)
PY_INSTANT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.py-instant+=	${PYPKGPREFIX}-instant>=1.0.0
BUILDLINK_PKGSRCDIR.py-instant?=	../../wip/py-instant
.endif	# PY_INSTANT_BUILDLINK3_MK

BUILDLINK_TREE+=	-py-instant
