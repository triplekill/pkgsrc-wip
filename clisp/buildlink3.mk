# $NetBSD$
#
# It may be sufficient to use this:
#BUILDLINK_DEPMETHOD.clisp?=	build

BUILDLINK_TREE+=	clisp

.if !defined(CLISP_BUILDLINK3_MK)
CLISP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.clisp+=	clisp>=2.48.99nb20100206
BUILDLINK_PKGSRCDIR.clisp?=	../../wip/clisp

.endif	# CLISP_BUILDLINK3_MK

BUILDLINK_TREE+=	-clisp
