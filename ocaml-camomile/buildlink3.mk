# $NetBSD$

BUILDLINK_TREE+=	ocaml-camomile

.if !defined(OCAML_CAMOMILE_BUILDLINK3_MK)
OCAML_CAMOMILE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ocaml-camomile+=	ocaml-camomile>=0.8.4
BUILDLINK_PKGSRCDIR.ocaml-camomile?=	../../wip/ocaml-camomile
.endif	# OCAML_CAMOMILE_BUILDLINK3_MK

BUILDLINK_TREE+=	-ocaml-camomile
