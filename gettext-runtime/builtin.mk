# $NetBSD: builtin.mk,v 1.1 2004/03/10 17:57:14 jlam Exp $

.if !defined(_BLNK_LIBINTL_FOUND)
_BLNK_LIBINTL_FOUND!=	\
	if [ "`${ECHO} /usr/lib/libintl.*`" = "/usr/lib/libintl.*" ]; then \
		${ECHO} "no";						\
	else								\
		${ECHO} "yes";						\
	fi
MAKEFLAGS+=	_BLNK_LIBINTL_FOUND=${_BLNK_LIBINTL_FOUND}
.endif

_LIBINTL_H=	/usr/include/libintl.h

.if !defined(IS_BUILTIN.gettext)
IS_BUILTIN.gettext=	no
.  if !empty(_BLNK_LIBINTL_FOUND:M[yY][eE][sS]) && exists(${_LIBINTL_H})
IS_BUILTIN.gettext!=	\
	if ${GREP} -q "\#define[ 	]*__USE_GNU_GETTEXT" ${_LIBINTL_H}; then \
		${ECHO} "yes";						\
	else								\
		${ECHO} "no";						\
	fi
.    if !empty(IS_BUILTIN.gettext:M[yY][eE][sS])
#
# XXX Consider the base system libintl to be gettext-runtime-0.14.1
#
BUILTIN_PKG.gettext=	gettext-runtime-0.14.1
MAKEFLAGS+=		BUILTIN_PKG.gettext=${BUILTIN_PKG.gettext}
.    endif
.  endif
MAKEFLAGS+=	IS_BUILTIN.gettext=${IS_BUILTIN.gettext}
.endif

CHECK_BUILTIN.gettext?=	no
.if !empty(CHECK_BUILTIN.gettext:M[yY][eE][sS])
USE_BUILTIN.gettext=	yes
.endif

.if !defined(USE_BUILTIN.gettext)
USE_BUILTIN.gettext?=	${IS_BUILTIN.gettext}
PREFER.getext?=		pkgsrc

.  if defined(BUILTIN_PKG.gettext)
USE_BUILTIN.gettext=	yes
.    for _depend_ in ${BUILDLINK_DEPENDS.gettext}
.      if !empty(USE_BUILTIN.gettext:M[yY][eE][sS])
USE_BUILTIN.gettext!=	\
	if ${PKG_ADMIN} pmatch '${_depend_}' ${BUILTIN_PKG.gettext}; then \
		${ECHO} "yes";						\
	else								\
		${ECHO} "no";						\
	fi
.      endif
.    endfor
.  endif

.  if ${PREFER.gettext} == "native"
# XXX
# XXX By default, assume that the native libintl is good enough.
# XXX
.    if !empty(_BLNK_LIBINTL_FOUND:M[yY][eE][sS]) && exists(${_LIBINTL_H})
USE_BUILTIN.gettext=	yes
#
# The listed platforms have an implementation of libintl that isn't
# GNUish enough.
#
_INCOMPAT_GETTEXT=	SunOS-*-*
.      for _pattern_ in ${_INCOMPAT_GETTEXT} ${INCOMPAT_GETTEXT}
.        if !empty(MACHINE_PLATFORM:M${_pattern_})
USE_BUILTIN.gettext=   no
.        endif
.      endfor
.    endif
.  endif

.  if defined(USE_GNU_GETTEXT)
.    if !empty(IS_BUILTIN.gettext:M[nN][oO]) || \
        (${PREFER.gettext} == "pkgsrc")
USE_BUILTIN.gettext=	no
.    endif
.  endif
.endif	# USE_BUILTIN.gettext

.if !empty(USE_BUILTIN.gettext:M[nN][oO])
_BLNK_LIBINTL=		-lintl
_GETTEXT_ICONV_DEPENDS=	gettext-runtime>=0.14.1
.  if !defined(_GETTEXT_NEEDS_ICONV)
_GETTEXT_NEEDS_ICONV?=	no
.    for _depend_ in ${BUILDLINK_DEPENDS.gettext}
.      if !empty(_GETTEXT_NEEDS_ICONV:M[nN][oO])
_GETTEXT_NEEDS_ICONV!=	\
	if ${PKG_INFO} -qe '${_depend_}'; then				\
		pkg=`cd ${_PKG_DBDIR}; ${PKG_ADMIN} -S lsbest '${_depend_}'`; \
		if ${PKG_INFO} -qN "$$pkg" | ${GREP} -q "libiconv-[0-9]"; then \
			${ECHO} "yes";					\
		else							\
			${ECHO} "no";					\
		fi;							\
	else								\
		${ECHO} "yes";						\
	fi
.      endif
.    endfor
.  endif
.  if ${_GETTEXT_NEEDS_ICONV} == "yes"
.    for _mkfile_ in buildlink3.mk builtin.mk
.      if exists(../../converters/libiconv/${_mkfile_})
.        include "../../converters/libiconv/${_mkfile_}"
.      endif
.    endfor
BUILDLINK_DEPENDS.gettext+=	${_GETTEXT_ICONV_DEPENDS}
_BLNK_LIBINTL+=			${BUILDLINK_LDADD.iconv}
.  endif
.endif

.if !empty(USE_BUILTIN.gettext:M[yY][eE][sS])
.  if ${_BLNK_LIBINTL_FOUND} == "yes"
_BLNK_LIBINTL=		-lintl
.  else
_BLNK_LIBINTL=		# empty
BUILDLINK_TRANSFORM+=	l:intl:
.  endif
.endif

BUILDLINK_LDADD.gettext?=	${_BLNK_LIBINTL}

# Add -lintl to LIBS in CONFIGURE_ENV to work around broken gettext.m4:
# older gettext.m4 does not add -lintl where it should, and the resulting
# configure script fails to detect if libintl.a is the genuine GNU gettext
# or not.
#
.if defined(GNU_CONFIGURE)
LIBS+=			${BUILDLINK_LDADD.gettext}
CONFIGURE_ENV+=		INTLLIBS="${BUILDLINK_LDADD.gettext}"
.  if !empty(USE_BUILTIN.gettext:M[yY][eE][sS])
.    if ${_BLNK_LIBINTL_FOUND} == "yes"
CONFIGURE_ENV+=		gt_cv_func_gnugettext1_libintl="yes"
.    endif
.  endif
.  if !empty(USE_BUILTIN.gettext:M[nN][oO])
CONFIGURE_ARGS+=	--with-libintl-prefix=${BUILDLINK_PREFIX.gettext}
.  else
CONFIGURE_ARGS+=	--without-libintl-prefix
.  endif
.endif
