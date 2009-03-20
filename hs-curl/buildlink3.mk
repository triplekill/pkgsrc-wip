# $NetBSD$

BUILDLINK_TREE+=	hs-curl

.if !defined(HS_CURL_BUILDLINK3_MK)
HS_CURL_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.hs-curl?=	build
BUILDLINK_API_DEPENDS.hs-curl+=	hs-curl>=1.3.4
BUILDLINK_PKGSRCDIR.hs-curl?=	../../wip/hs-curl

.include "../../www/curl/buildlink3.mk"
.endif # HS_CURL_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-curl
