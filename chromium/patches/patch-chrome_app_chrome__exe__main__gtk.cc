$NetBSD$

--- chrome/app/chrome_exe_main_gtk.cc.orig	2011-04-13 08:01:37.000000000 +0000
+++ chrome/app/chrome_exe_main_gtk.cc
@@ -3,7 +3,7 @@
 // found in the LICENSE file.
 
 #include "base/process_util.h"
-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
+#if (defined(OS_LINUX) || defined(OS_BSD)) && !defined(OS_CHROMEOS)
 #include "chrome/browser/first_run/first_run.h"
 #endif
 
@@ -19,11 +19,11 @@
 extern "C" {
 int ChromeMain(int argc, const char** argv);
 
-#if defined(OS_LINUX) && defined(USE_TCMALLOC)
+#if (defined(OS_LINUX) || defined(OS_BSD)) && defined(USE_TCMALLOC)
 
 int tc_set_new_mode(int mode);
 
-#endif  // defined(OS_LINUX) && defined(USE_TCMALLOC)
+#endif  // (defined(OS_LINUX) || defined(OS_BSD)) && defined(USE_TCMALLOC)
 }
 
 int main(int argc, const char** argv) {
@@ -36,7 +36,7 @@ int main(int argc, const char** argv) {
   // dependency on TCMalloc.  Really, we ought to have our allocator shim code
   // implement this EnableTerminationOnOutOfMemory() function.  Whateverz.  This
   // works for now.
-#if defined(OS_LINUX) && defined(USE_TCMALLOC)
+#if (defined(OS_LINUX) || defined(OS_BSD)) && defined(USE_TCMALLOC)
   // For tcmalloc, we need to tell it to behave like new.
   tc_set_new_mode(1);
 #endif
