# $NetBSD$
#
# This Makefile fragment is included by packages that use py-twisted.
#

.if !defined(PY_TWISTED_BUILDLINK2_MK)
PY_TWISTED_BUILDLINK2_MK=	# defined

.include "../../lang/python/pyversion.mk"

BUILDLINK_PACKAGES+=			${PYPKGPREFIX}-twisted
BUILDLINK_DEPENDS.${PYPKGPREFIX}-twisted?=		${PYPKGPREFIX}-twisted>=1.1.1
BUILDLINK_PKGSRCDIR.${PYPKGPREFIX}-twisted?=		../../wip/py-twisted

EVAL_PREFIX+=	BUILDLINK_PREFIX.${PYPKGPREFIX}-twisted=${PYPKGPREFIX}-twisted
BUILDLINK_PREFIX.${PYPKGPREFIX}-twisted_DEFAULT=	${LOCALBASE}

BUILDLINK_TARGETS+=	${PYPKGPREFIX}-twisted-buildlink

${PYPKGPREFIX}-twisted-buildlink: _BUILDLINK_USE

.endif	# PY_TWISTED_BUILDLINK2_MK
