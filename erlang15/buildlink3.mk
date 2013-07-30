# $NetBSD: buildlink3.mk,v 1.11 2012/05/07 01:53:39 dholland Exp $

BUILDLINK_TREE+=	erlang

.if !defined(ERLANG_BUILDLINK3_MK)
ERLANG_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.erlang+=	erlang>=15.1.3.1<16
BUILDLINK_ABI_DEPENDS.erlang+=	erlang>=15.1.3.1<16
BUILDLINK_PKGSRCDIR.erlang?=	../../wip/erlang15

pkgbase := erlang
.include "../../mk/pkg-build-options.mk"

.if !empty(PKG_BUILD_OPTIONS.erlang:Miodbc)
.  include "../../databases/iodbc/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.erlang:Munixodbc)
.  include "../../databases/unixodbc/buildlink3.mk"
.endif

.endif # ERLANG_BUILDLINK3_MK

BUILDLINK_TREE+=	-erlang
