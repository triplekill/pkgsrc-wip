$NetBSD$

--- chrome/browser/ui/views/frame/browser_view_layout.cc.orig	2011-04-13 08:01:42.000000000 +0000
+++ chrome/browser/ui/views/frame/browser_view_layout.cc
@@ -21,7 +21,7 @@
 #include "views/controls/single_split_view.h"
 #include "views/window/window.h"
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
 #include "views/window/hit_test.h"
 #endif
 
