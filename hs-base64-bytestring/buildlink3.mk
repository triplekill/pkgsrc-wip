# $NetBSD$

BUILDLINK_TREE+=	hs-base64-bytestring

.if !defined(HS_BASE64_BYTESTRING_BUILDLINK3_MK)
HS_BASE64_BYTESTRING_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-base64-bytestring+=	hs-base64-bytestring>=1.0.0
BUILDLINK_PKGSRCDIR.hs-base64-bytestring?=	../../wip/hs-base64-bytestring
.endif	# HS_BASE64_BYTESTRING_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-base64-bytestring
