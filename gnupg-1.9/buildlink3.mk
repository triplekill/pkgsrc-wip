# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
GNUPG_DEVEL_BUILDLINK3_MK:=	${GNUPG_DEVEL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gnupg-devel
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngnupg-devel}
BUILDLINK_PACKAGES+=	gnupg-devel

.if !empty(GNUPG_DEVEL_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.gnupg-devel+=	gnupg-devel>=1.9.11
BUILDLINK_PKGSRCDIR.gnupg-devel?=	../../wip/gnupg-1.9
.endif	# GNUPG_DEVEL_BUILDLINK3_MK
BUILDLINK_PREFIX.gnupg-devel?=	${LOCALBASE}

.include "../../security/libgpg-error/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../wip/libassuan/buildlink3.mk"
.include "../../security/libksba/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
