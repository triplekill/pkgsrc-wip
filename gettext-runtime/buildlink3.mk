# $NetBSD: buildlink3.mk,v 1.18 2004/03/16 18:23:27 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GETTEXT_BUILDLINK3_MK:=	${GETTEXT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gettext
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngettext}
BUILDLINK_PACKAGES+=	gettext

.if !empty(GETTEXT_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gettext+=	gettext-runtime>=0.14.1
BUILDLINK_PKGSRCDIR.gettext?=	../../wip/gettext-runtime
.endif	# GETTEXT_BUILDLINK3_MK

# libiconv/buildlink3.mk is included by gettext-lib/builtin.mk
#.include "../../converters/libiconv/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
