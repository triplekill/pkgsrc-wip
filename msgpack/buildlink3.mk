# $NetBSD$
#

BUILDLINK_TREE+=	msgpack

.if !defined(MSGPACK_BUILDLINK3_MK)
MSGPACK_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.msgpack+=	msgpack>=0.5.5
BUILDLINK_PKGSRCDIR.msgpack?=	../../wip/msgpack
.endif	# MSGPACK_BUILDLINK3_MK

BUILDLINK_TREE+=	-msgpack
