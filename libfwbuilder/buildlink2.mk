# $NetBSD$
#

.if !defined(LIBFWBUILDER_BUILDLINK2_MK)
LIBFWBUILDER_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			libfwbuilder
BUILDLINK_DEPENDS.libfwbuilder?=		libfwbuilder>=1.0.1
BUILDLINK_PKGSRCDIR.libfwbuilder?=		../../wip/libfwbuilder

EVAL_PREFIX+=	BUILDLINK_PREFIX.libfwbuilder=libfwbuilder
BUILDLINK_PREFIX.libfwbuilder_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.libfwbuilder+=	include/fwbuilder/*.h
BUILDLINK_FILES.libfwbuilder+=	include/fwbuilder/*.hh
BUILDLINK_FILES.libfwbuilder+=	include/fwcompiler/*.hh
BUILDLINK_FILES.libfwbuilder+=	lib/libfwbuilder.*
BUILDLINK_FILES.libfwbuilder+=	lib/libfwcompiler.*

.include "../../devel/glib/buildlink2.mk"
.include "../../net/net-snmp/buildlink2.mk"
.include "../../textproc/libxslt/buildlink2.mk"

.if defined(FWBUILDER_USE_BIND) && !empty(FWBUILDER_USE_BIND:M[yY][eE][sS])
.include "../../net/bind9/buildlink2.mk"
.else
.include "../../security/openssl/buildlink2.mk"
.endif

BUILDLINK_TARGETS+=	libfwbuilder-buildlink

libfwbuilder-buildlink: _BUILDLINK_USE

.endif	# LIBFWBUILDER_BUILDLINK2_MK
