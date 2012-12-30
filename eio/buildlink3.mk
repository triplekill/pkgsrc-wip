# $NetBSD$

BUILDLINK_TREE+=	eio

.if !defined(EIO_BUILDLINK3_MK)
EIO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.eio+=	eio>=1.7.0
BUILDLINK_PKGSRCDIR.eio?=	../../wip/eio

.include "../../wip/ecore/buildlink3.mk"
.include "../../wip/eet/buildlink3.mk"
.include "../../wip/eina/buildlink3.mk"
.endif	# EIO_BUILDLINK3_MK

BUILDLINK_TREE+=	-eio
