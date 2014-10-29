# $NetBSD: buildlink3.mk,v 1.16 2013/10/18 15:53:27 roy Exp $

BUILDLINK_TREE+=	guile2

.if !defined(GUILE2_BUILDLINK3_MK)
GUILE2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.guile2+=	guile>=2.0
BUILDLINK_PKGSRCDIR.guile2?=	../../wip/guile2

.include "../../devel/gmp/buildlink3.mk"
.include "../../devel/libltdl/buildlink3.mk"
.include "../../devel/readline/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../textproc/libunistring/buildlink3.mk"
.include "../../devel/boehm-gc/buildlink3.mk"
.endif # GUILE2_BUILDLINK3_MK

BUILDLINK_TREE+=	-guile2
