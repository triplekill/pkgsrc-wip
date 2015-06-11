# $NetBSD$
# XXX
# XXX This file was created automatically using createbuildlink-3.16.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified buildlink3.mk files.
# XXX
# XXX Packages that only install static libraries or headers should
# XXX include the following line:
# XXX
# XXX	BUILDLINK_DEPMETHOD.abiword?=	build

BUILDLINK_TREE+=	abiword

.if !defined(ABIWORD_BUILDLINK3_MK)
ABIWORD_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.abiword+=	abiword>=3.0.1
BUILDLINK_PKGSRCDIR.abiword?=	../../wip/abiword

# XXX
# XXX Uncomment and keep only the buildlink3 lines below which are directly
# XXX needed for dependencies to compile, link, and run.  If this package
# XXX provides a wrappered API or otherwise does not expose the APIs of the
# XXX buildlink3 lines below to dependencies, remove them.
# XXX
#.include "../../converters/fribidi/buildlink3.mk"
#.include "../../converters/wv/buildlink3.mk"
#.include "../../devel/boost-headers/buildlink3.mk"
#.include "../../devel/glib2/buildlink3.mk"
#.include "../../graphics/librsvg/buildlink3.mk"
#.include "../../graphics/png/buildlink3.mk"
#.include "../../textproc/enchant/buildlink3.mk"
#.include "../../textproc/libxslt/buildlink3.mk"
#.include "../../time/libical/buildlink3.mk"
.endif	# ABIWORD_BUILDLINK3_MK

BUILDLINK_TREE+=	-abiword
