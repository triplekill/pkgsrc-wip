# $NetBSD$
BUILDLINK_TREE+=	ocaml-pipebang

.if !defined(OCAML_PIPEBANG_BUILDLINK3_MK)
OCAML_PIPEBANG_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ocaml-pipebang+=	ocaml-pipebang>=110.01.00
BUILDLINK_PKGSRCDIR.ocaml-pipebang?=	../../wip/ocaml-pipebang
.endif	# OCAML_PIPEBANG_BUILDLINK3_MK

BUILDLINK_TREE+=	-ocaml-pipebang
