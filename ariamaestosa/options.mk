# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.ariamaestosa
PKG_SUPPORTED_OPTIONS=	opengl
PKG_SUGGESTED_OPTIONS+=	# blank

.include "../../mk/bsd.options.mk"
.include "../../mk/bsd.options.mk"

.if ${OPSYS} == 'Darwin'
PKG_SUGGESTED_OPTIONS+=	opengl
.endif

.if !empty(PKG_OPTIONS:Mopengl)
.include "../../graphics/MesaLib/buildlink3.mk"
.endif
