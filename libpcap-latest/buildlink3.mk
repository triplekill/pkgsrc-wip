# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBPCAP_BUILDLINK3_MK:=	${LIBPCAP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libpcap
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibpcap}
BUILDLINK_PACKAGES+=	libpcap

.if !empty(LIBPCAP_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libpcap+=	libpcap>=0.8.3nb1
BUILDLINK_PKGSRCDIR.libpcap?=	../../wip/libpcap-latest

.include "../../mk/bsd.prefs.mk"

# on Solaris, we always need libnsl and libsocket because libpcap.a
# references symbols in them.
.if ${OPSYS} == "SunOS"
BUILDLINK_LDADD.libpcap+=	-lnsl -lsocket
LDFLAGS+=			${BUILDLINK_LDADD.libpcap}
.endif

.endif	# LIBPCAP_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
