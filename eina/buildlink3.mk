# $NetBSD$

BUILDLINK_TREE+=	eina

.if !defined(EINA_BUILDLINK3_MK)
EINA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.eina+=	eina>=0.0.1
BUILDLINK_PKGSRCDIR.eina?=	../../wip/eina

.include "../../wip/ecore/buildlink3.mk"
.endif # EINA_BUILDLINK3_MK

BUILDLINK_TREE+=	-eina
