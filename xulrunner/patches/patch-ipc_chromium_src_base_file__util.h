$NetBSD$

--- ipc/chromium/src/base/file_util.h.orig	2013-05-07 18:01:28.000000000 +0900
+++ ipc/chromium/src/base/file_util.h	2013-05-11 22:21:15.000000000 +0900
@@ -16,8 +16,8 @@
 #include <sys/stat.h>
 #elif defined(OS_POSIX) 
 #include <sys/types.h>
-#include <fts.h>
 #include <sys/stat.h>
+#include <fts.h>
 #endif
 
 #include <stdio.h>
