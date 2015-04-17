$NetBSD$

Fix build on older NetBSD w/o _SC_PHYS_PAGES.

--- src/mesa/drivers/dri/swrast/swrast.c.orig	2015-03-28 18:20:39.000000000 +0000
+++ src/mesa/drivers/dri/swrast/swrast.c
@@ -60,6 +60,11 @@
 #include "swrast_priv.h"
 #include "swrast/s_context.h"
 
+#if defined(__NetBSD__)
+#include <sys/param.h>
+#include <sys/sysctl.h>
+#endif
+
 const __DRIextension **__driDriverGetExtensions_swrast(void);
 
 const char * const swrast_vendor_string = "Mesa Project";
@@ -137,7 +142,18 @@ swrast_query_renderer_integer(__DRIscree
       return 0;
    case __DRI2_RENDERER_VIDEO_MEMORY: {
       /* XXX: Do we want to return the full amount of system memory ? */
+#if !defined(_SC_PHYS_PAGES) && defined(__NetBSD__)
+      uint64_t physmem64;
+      uint32_t pagesize;
+      size_t len;
+      int ret1 = sysctlbyname("hw.physmem64", &physmem64, &len, (void*)NULL, 0);
+      int ret2 = sysctlbyname("hw.pagesize", &pagesize, &len, (void*)NULL, 0);
+      const long system_memory_pages = \
+        (ret1 == 0 && ret2 == 0 && physmem64 > 0 && pagesize > 0) ?
+        (physmem64 / pagesize) : -1;
+#else
       const long system_memory_pages = sysconf(_SC_PHYS_PAGES);
+#endif
       const long system_page_size = sysconf(_SC_PAGE_SIZE);
 
       if (system_memory_pages <= 0 || system_page_size <= 0)
