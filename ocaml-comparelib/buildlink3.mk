# $NetBSD$
BUILDLINK_TREE+=	ocaml-comparelib

.if !defined(OCAML_COMPARELIB_BUILDLINK3_MK)
OCAML_COMPARELIB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ocaml-comparelib+=	ocaml-comparelib>=109.60.00
BUILDLINK_PKGSRCDIR.ocaml-comparelib?=	../../wip/ocaml-comparelib

.include "../../devel/ocaml-type_conv/buildlink3.mk"
.include "../../lang/ocaml/buildlink3.mk"
.endif	# OCAML_COMPARELIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-ocaml-comparelib
