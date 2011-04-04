# $NetBSD$
#

BUILDLINK_TREE+=	zeromq

.if !defined(ZEROMQ_BUILDLINK3_MK)
ZEROMQ_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.zeromq+=	zeromq>=2.0.11
BUILDLINK_PKGSRCDIR.zeromq?=	../../wip/zeromq

.include "../../mk/bsd.fast.prefs.mk"

.if ${OPSYS} == "Linux" || ${OPSYS} == "SunOS"
.include "../../devel/libuuid/buildlink3.mk"
.endif

.endif	# ZEROMQ_BUILDLINK3_MK

BUILDLINK_TREE+=	-zeromq
