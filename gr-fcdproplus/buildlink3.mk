# $NetBSD: buildlink3.mk,v 1.25 2013/11/20 20:04:35 adam Exp $

BUILDLINK_TREE+=	gr-fcdproplus

.if !defined(GR_FCDPROPLUS_BUILDLINK3_MK)
GR_FCDPROPLUS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gr-fcdproplus+=	gr-fcdproplus>=0.1
BUILDLINK_ABI_DEPENDS.gr-fcdproplus+=	gr-fcdproplus>=0.1
BUILDLINK_PKGSRCDIR.gr-fcdproplus?=	../../wip/gr-fcdproplus
.endif # GR_FCDPROPLUS_BUILDLINK3_MK

BUILDLINK_TREE+=	-gr-fcdproplus
