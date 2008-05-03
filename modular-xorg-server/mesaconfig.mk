# $NetBSD$
###
###
### XXX This is the default heap size.  Would there be an occasion to
### change it?  It seems large, so we should investigate further.
###
.include "../../mk/bsd.fast.prefs.mk"
MESA_EXECMEM_HEAPSIZE?=	10485760

.if !empty(OPSYS:M*BSD) || ${OPSYS} == "Linux" || ${OPSYS} == "DragonFly"
CFLAGS+=	-DMESA_EXECMEM_MMAP
CFLAGS+=	-DEXEC_HEAP_SIZE=${MESA_EXECMEM_HEAPSIZE:M[0-9]*:Q}
CFLAGS+=	-DUSE_NATIVE_LIBM_FUNCS
.endif

.if !empty(MACHINE_ARCH:Mi386)
###
### This is taken from <sys/arch/i386/include/npx.h>.  If we don't override
### it, the FPU control word will be restored to 0x037f.
###
### Also, see patch-aq about the libm functions required (float functions
### such as floorf).  Proper configuration of this should be a goal of
### the Mesa developers; alas, it obviously is not.
###
### XXX We need a reliable check for these functions.
###
#/* NetBSD uses IEEE double precision. */
CFLAGS.NetBSD+=		-DDEFAULT_X86_FPU=0x127f
###
###
#/* FreeBSD leaves some exceptions unmasked as well. */
###
CFLAGS.FreeBSD+=	-DDEFAULT_x86_FPU=0x1272
.endif
