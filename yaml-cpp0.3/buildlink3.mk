# $NetBSD: buildlink3.mk,v 1.2 2012/09/22 11:43:27 obache Exp $

BUILDLINK_TREE+=	yaml-cpp

.if !defined(YAML_CPP_BUILDLINK3_MK)
YAML_CPP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.yaml-cpp+=	yaml-cpp>=0.3<0.5
BUILDLINK_PKGSRCDIR.yaml-cpp?=	../../wip/yaml-cpp0.3
.endif	# LIBYAML_BUILDLINK3_MK

BUILDLINK_TREE+=	-yaml-cpp
