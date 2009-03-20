# $NetBSD$

BUILDLINK_TREE+=	avifile-devel

.if !defined(AVIFILE_DEVEL_BUILDLINK3_MK)
AVIFILE_DEVEL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.avifile-devel+=	avifile-devel>=0.7.41
BUILDLINK_PKGSRCDIR.avifile-devel?=	../../wip/avifile-devel
.endif # AVIFILE_DEVEL_BUILDLINK3_MK

BUILDLINK_TREE+=	-avifile-devel
