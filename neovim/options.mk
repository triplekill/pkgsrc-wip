# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.neovim
PKG_SUPPORTED_OPTIONS=	python
PKG_SUGGESTED_OPTIONS=	python

.include "../../mk/bsd.options.mk"

###
### Support Python (add dependency)
###
.  if !empty(PKG_OPTIONS:Mpython)
DEPENDS+=       ${PYPKGPREFIX}-neovim:../../wip/py-neovim

.include "../../lang/python/pyversion.mk"
.  endif
