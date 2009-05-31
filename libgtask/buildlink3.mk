# $NetBSD$

BUILDLINK_TREE+=	libgtask

.if !defined(LIBGTASK_BUILDLINK3_MK)
LIBGTASK_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgtask+=	libgtask>=0.1.2
BUILDLINK_PKGSRCDIR.libgtask?=	../../wip/libgtask


.include "../../devel/glib2/buildlink3.mk"

.endif	# LIBGTASK_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgtask
