$NetBSD$

--- native_client/src/trusted/service_runtime/arch/x86/sel_ldr_x86.h.orig	2011-04-13 08:13:10.000000000 +0000
+++ native_client/src/trusted/service_runtime/arch/x86/sel_ldr_x86.h
@@ -14,6 +14,9 @@
 # define LDT_ENTRIES 8192
 #elif NACL_LINUX
 # include <asm/ldt.h>
+#ifndef LDT_ENTRIES
+# define LDT_ENTRIES 8192
+#endif
 #endif
 
 #include "native_client/src/trusted/service_runtime/arch/x86/nacl_ldt_x86.h"
