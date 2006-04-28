# $NetBSD: buildlink3.mk,v 1.10 2005/09/18 19:33:42 xtraeme Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
MODULAR_XORG_LIBS_BUILDLINK3_MK:=	${MODULAR_XORG_LIBS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	modular-xorg-libs
.endif

#
# modular-xorg-libs must come first so that packages listed later can overwrite
# any symlinks created by buildlinking modular-xorg-libs.
#
BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nmodular-xorg-libs}
BUILDLINK_PACKAGES:=	modular-xorg-libs ${BUILDLINK_PACKAGES}

.include "../../mk/bsd.prefs.mk"

.if !empty(MODULAR_XORG_LIBS_BUILDLINK3_MK:M+)

BUILDLINK_API_DEPENDS.modular-xorg-libs+=	modular-xorg-libs>=7.0nb4
BUILDLINK_PKGSRCDIR.modular-xorg-libs?=		../../wip/modular-xorg-libs
#BUILDLINK_TRANSFORM.modular-xorg-libs+=	-e "s|/${X11ROOT_PREFIX}/|/|"

.endif  # MODULAR_XORG_LIBS_BUILDLINK3_MK

.include "../../wip/libX11/buildlink3.mk"
.include "../../wip/libXau/buildlink3.mk"
.include "../../wip/libXaw/buildlink3.mk"
.include "../../wip/libXext/buildlink3.mk"
.include "../../wip/libXfont/buildlink3.mk"
.include "../../wip/libXi/buildlink3.mk"
.include "../../wip/libXinerama/buildlink3.mk"
.include "../../wip/libXmu/buildlink3.mk"
.include "../../wip/libXt/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"

#.include "../../devel/zlib/buildlink3.mk"
#.include "../../fonts/fontconfig/buildlink3.mk"
#.include "../../graphics/freetype2/buildlink3.mk"
#.include "../../textproc/expat/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
