$NetBSD$

--- gui/word_register_dialog/word_register_dialog.cc.orig	2012-08-31 05:37:28.000000000 +0000
+++ gui/word_register_dialog/word_register_dialog.cc
@@ -81,7 +81,7 @@ QString GetEnv(const char *envname) {
   }
   return "";
 #endif  // OS_WINDOWS
-#if defined(OS_MACOSX) || defined(OS_LINUX)
+#if defined(OS_MACOSX) || defined(OS_LINUX) || defined(OS_NETBSD)
   return ::getenv(envname);
 #endif  // OS_MACOSX or OS_LINUX
   // TODO(team): Support other platforms.
