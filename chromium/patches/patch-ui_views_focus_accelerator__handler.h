$NetBSD$

--- ui/views/focus/accelerator_handler.h.orig	2011-05-24 08:01:59.000000000 +0000
+++ ui/views/focus/accelerator_handler.h
@@ -8,7 +8,7 @@
 
 #include "build/build_config.h"
 
-#if defined(OS_LINUX)
+#if defined(TOOLKIT_USES_GTK)
 #include <gdk/gdk.h>
 #endif
 
