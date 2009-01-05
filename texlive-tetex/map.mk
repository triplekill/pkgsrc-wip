# $NetBSD$
#
# This Makefile fragment is intended to be included by packages that
# install font maps for TeX.  It updates font map entries in updmap.cfg
# at (de)installation time.
#
# The following variables can be defined:
#
#    TEX_MAP_FILES - A list of map files.
#
#    TEX_MIXEDMAP_FILES - A list of mixed map files.
#

.if !defined(TEX_MAP_MK)
TEX_MAP_MK=		# defined

DEPENDS+=		texlive-tetex>=2008:../../wip/texlive-tetex
DEPENDS+=		tex-bin-tetex-[0-9]*:../../wip/tex-bin-tetex
DEPENDS+=		tex-bin-texlive-[0-9]*:../../wip/tex-bin-texlive

EVAL_PREFIX+=		TETEX_PREFIX=texlive-tetex
FILES_SUBST+=		UPDMAP_SYS=${TETEX_PREFIX:Q}/bin/updmap-sys
FILES_SUBST+=		MAP_FILES=${TEX_MAP_FILES:Q}
FILES_SUBST+=		MIXEDMAP_FILES=${TEX_MIXEDMAP_FILES:Q}
INSTALL_TEMPLATES+=	../../wip/texlive-tetex/files/map-install.tmpl
DEINSTALL_TEMPLATES+=	../../wip/texlive-tetex/files/map-deinstall.tmpl

.endif	# TEX_MAP_MK
