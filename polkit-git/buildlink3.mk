# $NetBSD$
#

BUILDLINK_TREE+=	polkit

.if !defined(POLKIT_BUILDLINK3_MK)
POLKIT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.polkit+=	polkit>=0.103
BUILDLINK_PKGSRCDIR.polkit?=	../../wip/polkit

#.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
#.include "../../textproc/expat/buildlink3.mk"
.endif	# POLKIT_BUILDLINK3_MK

BUILDLINK_TREE+=	-polkit
