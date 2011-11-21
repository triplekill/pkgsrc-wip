# $NetBSD: buildlink3.mk,v 1.19 2006/07/08 23:10:56 jlam Exp $

BUILDLINK_TREE+=	tcl

.if !defined(TCL_BUILDLINK3_MK)
TCL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.tcl+=	tcl>=8.5.7
BUILDLINK_ABI_DEPENDS.tcl+=	tcl>=8.5.7
BUILDLINK_PKGSRCDIR.tcl?=	../../wip/tcl85

BUILDLINK_FILES.tcl+=	bin/tclsh*
#
# Make "-ltcl" and "-ltcl85" resolve into "-ltcl8.5", so that we don't
# need to patch so many Makefiles.
#
BUILDLINK_TRANSFORM+=	l:tcl:tcl8.5
BUILDLINK_TRANSFORM+=	l:tcl85:tcl8.5

TCLCONFIG_SH?=		${BUILDLINK_PREFIX.tcl}/lib/tcl8.5/tclConfig.sh

.include "../../mk/dlopen.buildlink3.mk"
.endif # TCL_BUILDLINK3_MK

BUILDLINK_TREE+=	-tcl
