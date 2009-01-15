# $NetBSD: buildlink3.mk,v 1.15 2007/01/17 03:11:19 rillig Exp $

BUILDLINK_DEPTH:=       ${BUILDLINK_DEPTH}+
GCC42_BUILDLINK3_MK:=  ${GCC42_BUILDLINK3_MK}+
BUILDLINK_PREFIX.gcc42:=${LOCALBASE}/gcc42

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=     gcc42
.endif

BUILDLINK_PACKAGES:=    ${BUILDLINK_PACKAGES:Ngcc42}
BUILDLINK_PACKAGES+=    gcc42
BUILDLINK_ORDER:=    ${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}gcc42

.if !empty(GCC42_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gcc42+=	gcc42>=${_GCC_REQD}
BUILDLINK_ABI_DEPENDS.gcc42?=	gcc42>=4.2.0
BUILDLINK_PKGSRCDIR.gcc42?=	../../wip/gcc42
.  if exists(${BUILDLINK_PREFIX.gcc42}/bin/gcc)
_GNAT1!=${BUILDLINK_PREFIX.gcc42}/bin/gcc -print-prog-name=gnat1
.    if exists(${_GNAT1})
BUILDLINK_ENV+=	ADAC=${BUILDLINK_PREFIX.gcc42}/bin/gcc
.    endif
BUILDLINK_LIBDIRS.gcc42+=	lib
_GCC_ARCHDIR!=	${DIRNAME} `${BUILDLINK_PREFIX.gcc42}/bin/gcc --print-libgcc-file-name`
.    if empty(_GCC_ARCHDIR:M*not_found*)
BUILDLINK_LIBDIRS.gcc42+=	${_GCC_ARCHDIR:S/^${BUILDLINK_PREFIX.gcc42}\///}/
.      if exists(${_GNAT1})
BUILDLINK_LIBDIRS.gcc42+=	${_GCC_ARCHDIR:S/^${BUILDLINK_PREFIX.gcc42}\///}/adalib
.      endif
BUILDLINK_INCDIRS.gcc42+=	include ${_GCC_ARCHDIR:S/^${BUILDLINK_PREFIX.gcc42}\///}/include
.    endif
.  endif
.endif  # GCC42_BUILDLINK3_MK

BUILDLINK_FILES_CMD.gcc42=	\
	(cd  ${BUILDLINK_PREFIX.gcc42} &&	\
	${FIND} bin libexec lib \( -type f -o -type l \) -print)
BUILDLINK_FNAME_TRANSFORM.gcc42=	-e s:\buildlink:buildlink/gcc42:

# Packages that link against shared libraries need a full dependency.
.  if defined(_USE_GCC_SHLIB)
BUILDLINK_DEPMETHOD.gcc+=	full
.  else
BUILDLINK_DEPMETHOD.gcc?=	build
.  endif


.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"

BUILDLINK_DEPTH:=       ${BUILDLINK_DEPTH:S/+$//}
