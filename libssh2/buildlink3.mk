# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBSSH2_BUILDLINK3_MK:=	${LIBSSH2_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libssh2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibssh2}
BUILDLINK_PACKAGES+=	libssh2
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libssh2

.if ${LIBSSH2_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libssh2+=	libssh2>=0.17
BUILDLINK_PKGSRCDIR.libssh2?=	../../local/libssh2
.endif	# LIBSSH2_BUILDLINK3_MK

pkgbase:=	libssh2

.include "../../mk/pkg-build-options.mk"

.if !empty(PKG_BUILD_OPTIONS:Mssl)
.	include "../../security/openssl/buildlink3.mk"
.elif !empty(PKG_BUILD_OPTIONS:Mgcrypt)
.	include "../../security/openssl/buildlink3.mk"
.else
PKG_FAIL_REASON=	"${BUILDLINK_PACKAGES:Mlibssh2} should set \
			PKG_SUGGESTED_OPTIONS!"
.endif

.include "../../devel/zlib/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
