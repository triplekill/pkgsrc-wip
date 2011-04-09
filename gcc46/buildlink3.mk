# $NetBSD: buildlink3.mk,v 1.3 2010/03/15 08:27:06 adam Exp $

BUILDLINK_TREE+=	gcc46

.if !defined(GCC46_BUILDLINK3_MK)
GCC46_BUILDLINK3_MK:=

FIND_PREFIX:=	BUILDLINK_PREFIX.gcc46=gcc46
.include "../../mk/find-prefix.mk"

_GCC46_SUBDIR=	gcc46
_GCC46_PREFIX=	${BUILDLINK_PREFIX.gcc46}/${_GCC46_SUBDIR}

BUILDLINK_API_DEPENDS.gcc46+=	gcc46>=${_GCC_REQD}
BUILDLINK_ABI_DEPENDS.gcc46?=	gcc46>=4.6.0
BUILDLINK_PKGSRCDIR.gcc46?=	../../wip/gcc46

.if exists(${_GCC46_PREFIX}/bin/gcc)

# logic for detecting the ADA compiler (not yet supported)
#gcc46_GNAT1!=${_GCC46_PREFIX}/bin/gcc -print-prog-name=gnat1
#.  if exists(${gcc46_GNAT1})
#CONFIGURE_ENV+=	ADAC=${_GCC46_PREFIX}/bin/gcc
#MAKE_ENV+=	ADAC=${_GCC46_PREFIX}/bin/gcc
#.  endif

# add libraries
BUILDLINK_LIBDIRS.gcc46+=	${_GCC46_SUBDIR}/lib

# find the gcc architecture
gcc46_GCC_ARCHDIR!=	${DIRNAME} `${_GCC46_PREFIX}/bin/gcc --print-libgcc-file-name`

# add the architecture dep libraries
.  if empty(gcc46_GCC_ARCHDIR:M*not_found*)
BUILDLINK_LIBDIRS.gcc46+=	${gcc46_GCC_ARCHDIR:S/^${BUILDLINK_PREFIX.gcc46}\///}/

# add the ada libraries (not yet supported)
#.    if exists(${gcc46_GNAT1})
#BUILDLINK_LIBDIRS.gcc46+=	${gcc46_GCC_ARCHDIR:S/^${BUILDLINK_PREFIX.gcc46}\///}/adalib
#.    endif

# add the header files
BUILDLINK_INCDIRS.gcc46+=	${_GCC46_SUBDIR}/include ${gcc46_GCC_ARCHDIR:S/^${BUILDLINK_PREFIX.gcc46}\///}/include
.  endif
.endif

BUILDLINK_FILES_CMD.gcc46=	\
	(cd  ${BUILDLINK_PREFIX.gcc46} &&	\
	${FIND} ${_GCC46_SUBDIR}/bin ${_GCC46_SUBDIR}/libexec ${_GCC46_SUBDIR}/lib \( -type f -o -type l \) -print)
BUILDLINK_FNAME_TRANSFORM.gcc46=	-e s:buildlink:buildlink/gcc46:

# Packages that link against shared libraries need a full dependency.
.if defined(_USE_GCC_SHLIB)
BUILDLINK_DEPMETHOD.gcc46+=	full
.else
BUILDLINK_DEPMETHOD.gcc46?=	build
.endif

.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.endif # GCC46_BUILDLINK3_MK

BUILDLINK_TREE+=	-gcc46
