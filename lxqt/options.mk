# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.lxqt
PKG_SUPPORTED_OPTIONS=	openbox # alternatives: kwin and possibly metacity
PKG_SUGGESTED_OPTIONS=	openbox

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mopenbox)
DEPENDS+=       openbox>=3.5.2:../../wm/openbox
DEPENDS+=       obconf-qt>=0.1.0:../../wm/obconf-qt
.endif
