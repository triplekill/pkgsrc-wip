$NetBSD$

Fix build on older NetBSD w/o _SC_PHYS_PAGES.

--- src/mesa/drivers/dri/i965/intel_screen.c.orig	2015-03-28 18:20:39.000000000 +0000
+++ src/mesa/drivers/dri/i965/intel_screen.c
@@ -42,6 +42,11 @@
 #include "utils.h"
 #include "xmlpool.h"
 
+#if defined(__NetBSD__)
+#include <sys/param.h>
+#include <sys/sysctl.h>
+#endif
+
 static const __DRIconfigOptionsExtension brw_config_options = {
    .base = { __DRI_CONFIG_OPTIONS, 1 },
    .xml =
@@ -829,7 +834,18 @@ brw_query_renderer_integer(__DRIscreen *
       const unsigned gpu_mappable_megabytes =
          (aper_size / (1024 * 1024)) * 3 / 4;
 
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
