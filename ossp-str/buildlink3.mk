# $NetBSD$
#

BUILDLINK_TREE+=	ossp-str

.if !defined(OSSP_STR_BUILDLINK3_MK)
OSSP_STR_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ossp-str+=	ossp-str>=0.9.12
BUILDLINK_PKGSRCDIR.ossp-str?=	../../wip/ossp-str
.endif	# OSSP_STR_BUILDLINK3_MK

BUILDLINK_TREE+=	-ossp-str
