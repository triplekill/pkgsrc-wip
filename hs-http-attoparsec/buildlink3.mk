# $NetBSD$

BUILDLINK_TREE+=	hs-http-attoparsec

.if !defined(HS_HTTP_ATTOPARSEC_BUILDLINK3_MK)
HS_HTTP_ATTOPARSEC_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-http-attoparsec+=	hs-http-attoparsec>=0.1.1
BUILDLINK_ABI_DEPENDS.hs-http-attoparsec+=	hs-http-attoparsec>=0.1.1
BUILDLINK_PKGSRCDIR.hs-http-attoparsec?=	../../wip/hs-http-attoparsec

.include "../../textproc/hs-attoparsec/buildlink3.mk"
.include "../../wip/hs-http-types/buildlink3.mk"
.endif	# HS_HTTP_ATTOPARSEC_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-http-attoparsec
