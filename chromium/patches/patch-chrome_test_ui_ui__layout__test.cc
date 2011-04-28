$NetBSD$

--- chrome/test/ui/ui_layout_test.cc.orig	2011-04-13 08:01:56.000000000 +0000
+++ chrome/test/ui/ui_layout_test.cc
@@ -19,7 +19,7 @@
 static const char kPlatformName[] = "chromium-win";
 #elif defined(OS_MACOSX)
 static const char kPlatformName[] = "chromium-mac";
-#elif defined(OS_LINUX)
+#elif defined(OS_LINUX) || defined(OS_BSD)
 static const char kPlatformName[] = "chromium-linux";
 #else
 #error No known OS defined
