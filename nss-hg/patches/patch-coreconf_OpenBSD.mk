$NetBSD$

PLIST unification (see nspr)?

--- coreconf/OpenBSD.mk.orig	2014-09-28 13:54:02.000000000 +0000
+++ coreconf/OpenBSD.mk
@@ -24,7 +24,7 @@ OS_LIBS			+= -pthread
 DSO_LDOPTS		+= -pthread
 endif
 
-DLL_SUFFIX		= so.1.0
+DLL_SUFFIX		= so
 
 OS_CFLAGS		= $(DSO_CFLAGS) $(OS_REL_CFLAGS) -ansi -Wall -Wno-switch -pipe -DOPENBSD
 
