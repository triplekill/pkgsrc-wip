# $NetBSD: buildlink3.mk,v 1.2 2011/06/22 18:42:16 adam Exp $

BUILDLINK_TREE+=	python32

.if !defined(PYTHON32_BUILDLINK3_MK)
PYTHON32_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.python32+=	python32>=3.2
BUILDLINK_PKGSRCDIR.python32?=		../../wip/python32

.if defined(BUILDLINK_DEPMETHOD.python)
BUILDLINK_DEPMETHOD.python32?=	${BUILDLINK_DEPMETHOD.python}
.endif

BUILDLINK_INCDIRS.python32+=	include/python3.2
BUILDLINK_LIBDIRS.python32+=	lib/python3.2/config
BUILDLINK_TRANSFORM+=		l:python:python3.2

.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.endif # PYTHON32_BUILDLINK3_MK

BUILDLINK_TREE+=	-python32
