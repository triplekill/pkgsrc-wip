# $NetBSD$

BUILDLINK_TREE+=	hs-dataenc

.if !defined(HS_DATAENC_BUILDLINK3_MK)
HS_DATAENC_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.hs-dataenc?=	build
BUILDLINK_API_DEPENDS.hs-dataenc+=	hs-dataenc>=0.11.1
BUILDLINK_PKGSRCDIR.hs-dataenc?=	../../wip/hs-dataenc
.endif # HS_DATAENC_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-dataenc
