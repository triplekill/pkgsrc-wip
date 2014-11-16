# $NetBSD$
BUILDLINK_TREE+=	ocaml-herelib

.if !defined(OCAML_HERELIB_BUILDLINK3_MK)
OCAML_HERELIB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ocaml-herelib+=	ocaml-herelib>=109.35.02
BUILDLINK_PKGSRCDIR.ocaml-herelib?=	../../wip/ocaml-herelib

.include "../../lang/camlp4/buildlink3.mk"
.include "../../lang/ocaml/buildlink3.mk"
.endif	# OCAML_HERELIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-ocaml-herelib
