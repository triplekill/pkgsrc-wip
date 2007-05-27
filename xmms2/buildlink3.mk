# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
XMMS2_BUILDLINK3_MK:=	${XMMS2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	xmms2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxmms2}
BUILDLINK_PACKAGES+=	xmms2

.if !empty(XMMS2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.xmms2+=	xmms2>=0.1DR2.2
BUILDLINK_PKGSRCDIR.xmms2?=	../../wip/xmms2
.endif	# XMMS2_BUILDLINK3_MK

.if !defined(PKG_BUILD_OPTIONS.xmms2)
PKG_BUILD_OPTIONS.xmms2!=						\
	cd ${BUILDLINK_PKGSRCDIR.xmms2} &&				\
	${MAKE} show-var ${MAKEFLAGS} VARNAME=PKG_OPTIONS
MAKEFLAGS+=	PKG_BUILD_OPTIONS.xmms2=${PKG_BUILD_OPTIONS.xmms2:Q}
.endif
MAKEVARS+=	PKG_BUILD_OPTIONS.xmms2

.if !empty(PKG_BUILD_OPTIONS.xmms2:Mfaad)
.  include "../../audio/faad2/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.xmms2:Mflac)
.  include "../../audio/flac/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.xmms2:Mgnomevfs)
.  include "../../sysutils/gnome-vfs2/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.xmms2:Mmodplug)
.  include "../../audio/libmodplug/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.xmms2:Mogg)
.  include "../../audio/libvorbis/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.xmms2:Mperl)
.  include "../../lang/perl5/buildlink3.mk"
.endif

.include "../../audio/libmad/buildlink3.mk"
.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/oss.buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
