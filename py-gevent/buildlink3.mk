# $NetBSD$

BUILDLINK_TREE+=	py-gevent

.if !defined(PY_GEVENT_BUILDLINK3_MK)
PY_GEVENT_BUILDLINK3_MK:=

.include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.py-gevent+=	${PYPKGPREFIX}-gevent>=0.13.0
BUILDLINK_PKGSRCDIR.py-gevent?=		../../wip/py-gevent

.include "../../devel/py-cython/buildlink3.mk"
.include "../../devel/libevent/buildlink3.mk"

.endif	# PY_GEVENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-py-gevent
