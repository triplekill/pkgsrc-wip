# $NetBSD$

BUILDLINK_TREE+=	py26-pygraphviz

.if !defined(PY26_PYGRAPHVIZ_BUILDLINK3_MK)
PY26_PYGRAPHVIZ_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.py26-pygraphviz+=	py26-pygraphviz>=1.0
BUILDLINK_PKGSRCDIR.py26-pygraphviz?=	../../wip/py-pygraphviz

.endif	# PY26_PYGRAPHVIZ_BUILDLINK3_MK

BUILDLINK_TREE+=	-py26-pygraphviz
