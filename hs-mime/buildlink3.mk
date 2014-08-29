# $NetBSD$

BUILDLINK_TREE+=	hs-mime

.if !defined(HS_MIME_BUILDLINK3_MK)
HS_MIME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-mime+=	hs-mime>=0.3.0
BUILDLINK_ABI_DEPENDS.hs-mime+=	hs-mime>=0.3.0nb1
BUILDLINK_PKGSRCDIR.hs-mime?=	../../wip/hs-mime
.endif # HS_MIME_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-mime
