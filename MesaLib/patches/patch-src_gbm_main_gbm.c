$NetBSD$

--- src/gbm/main/gbm.c.orig	2015-03-21 00:51:18.000000000 +0000
+++ src/gbm/main/gbm.c
@@ -35,6 +35,9 @@
 #include <stdint.h>
 
 #include <sys/types.h>
+#idef __sun
+#include <sys/mkdev.h> /* for major(2) */
+#endif
 #include <sys/stat.h>
 #include <unistd.h>
 #include <errno.h>
