# $NetBSD$
#

PKG_OPTIONS_VAR=                PKG_OPTIONS.${SHORTNAME}
PKG_OPTIONS_REQUIRED_GROUPS=    lisp
PKG_OPTIONS_GROUP.lisp=         ecl
PKG_SUGGESTED_OPTIONS+=         ecl

.include "../../mk/bsd.options.mk"

PLIST_VARS+=                    ${PKG_OPTIONS_GROUP.lisp}
.for opt in ${PKG_OPTIONS_GROUP.lisp}
.  if !empty(PKG_OPTIONS:M${opt})
PLIST.${opt}=                   yes
.  endif
.endfor
