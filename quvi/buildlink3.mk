# $NetBSD$

BUILDLINK_TREE+=	quvi

.if !defined(QUVI_BUILDLINK3_MK)
QUVI_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.quvi+=	quvi>=0.2.0
BUILDLINK_PKGSRCDIR.quvi?=	../../wip/quvi

.include "../../devel/pcre/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../lang/lua/buildlink3.mk"
.endif	# QUVI_BUILDLINK3_MK

BUILDLINK_TREE+=	-quvi
