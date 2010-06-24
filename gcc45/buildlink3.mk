# $NetBSD: buildlink3.mk,v 1.3 2010/03/15 08:27:06 adam Exp $

BUILDLINK_TREE+=	gcc45

.if !defined(GCC45_BUILDLINK3_MK)
GCC45_BUILDLINK3_MK:=

FIND_PREFIX:=	BUILDLINK_PREFIX.gcc45=gcc45
.include "../../mk/find-prefix.mk"

_GCC45_SUBDIR=	gcc45
_GCC45_PREFIX=	${BUILDLINK_PREFIX.gcc45}/${_GCC45_SUBDIR}

BUILDLINK_API_DEPENDS.gcc45+=	gcc45>=${_GCC_REQD}
BUILDLINK_ABI_DEPENDS.gcc45?=	gcc45>=4.5.0
BUILDLINK_PKGSRCDIR.gcc45?=	../../lang/gcc45

.if exists(${_GCC45_PREFIX}/bin/gcc)

# logic for detecting the ADA compiler (not yet supported)
#gcc45_GNAT1!=${_GCC45_PREFIX}/bin/gcc -print-prog-name=gnat1
#.  if exists(${gcc45_GNAT1})
#CONFIGURE_ENV+=	ADAC=${_GCC45_PREFIX}/bin/gcc
#MAKE_ENV+=	ADAC=${_GCC45_PREFIX}/bin/gcc
#.  endif

# add libraries
BUILDLINK_LIBDIRS.gcc45+=	${_GCC45_SUBDIR}/lib

# find the gcc architecture
gcc45_GCC_ARCHDIR!=	${DIRNAME} `${_GCC45_PREFIX}/bin/gcc --print-libgcc-file-name`

# add the architecture dep libraries
.  if empty(gcc45_GCC_ARCHDIR:M*not_found*)
BUILDLINK_LIBDIRS.gcc45+=	${gcc45_GCC_ARCHDIR:S/^${BUILDLINK_PREFIX.gcc45}\///}/

# add the ada libraries (not yet supported)
#.    if exists(${gcc45_GNAT1})
#BUILDLINK_LIBDIRS.gcc45+=	${gcc45_GCC_ARCHDIR:S/^${BUILDLINK_PREFIX.gcc45}\///}/adalib
#.    endif

# add the header files
BUILDLINK_INCDIRS.gcc45+=	${_GCC45_SUBDIR}/include ${gcc45_GCC_ARCHDIR:S/^${BUILDLINK_PREFIX.gcc45}\///}/include
.  endif
.endif

BUILDLINK_FILES_CMD.gcc45=	\
	(cd  ${BUILDLINK_PREFIX.gcc45} &&	\
	${FIND} ${_GCC45_SUBDIR}/bin ${_GCC45_SUBDIR}/libexec ${_GCC45_SUBDIR}/lib \( -type f -o -type l \) -print)
BUILDLINK_FNAME_TRANSFORM.gcc45=	-e s:buildlink:buildlink/gcc45:

# Packages that link against shared libraries need a full dependency.
.if defined(_USE_GCC_SHLIB)
BUILDLINK_DEPMETHOD.gcc45+=	full
.else
BUILDLINK_DEPMETHOD.gcc45?=	build
.endif

.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.endif # GCC45_BUILDLINK3_MK

BUILDLINK_TREE+=	-gcc45
