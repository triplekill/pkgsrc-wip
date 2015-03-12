# $NetBSD$

BUILDLINK_TREE+=	go-backoff

.if !defined(GO_BACKOFF_BUILDLINK3_MK)
GO_BACKOFF_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.go-backoff?=	build
BUILDLINK_API_DEPENDS.go-backoff+=	go-backoff>=20141124
BUILDLINK_PKGSRCDIR.go-backoff?=	../../wip/go-backoff

.endif	# GO_BACKOFF_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-backoff
