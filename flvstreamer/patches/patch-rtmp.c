$NetBSD$

Fix build on NetBSD

--- rtmp.c.orig	2010-02-15 01:04:35.000000000 +0000
+++ rtmp.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <sys/time.h>
 #include <stdint.h>
 #include <stdlib.h>
 #include <string.h>
