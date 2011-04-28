$NetBSD$

--- chrome/test/in_process_browser_test.cc.orig	2011-04-13 08:01:56.000000000 +0000
+++ chrome/test/in_process_browser_test.cc
@@ -4,6 +4,10 @@
 
 #include "chrome/test/in_process_browser_test.h"
 
+#if defined(OS_POSIX)
+#include <signal.h>
+#endif
+
 #include "base/command_line.h"
 #include "base/file_path.h"
 #include "base/file_util.h"
