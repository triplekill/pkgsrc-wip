$NetBSD$

https://github.com/rockdaboot/libpsl/issues/16

--- src/psl.c.orig	2014-08-03 10:19:28.000000000 +0000
+++ src/psl.c
@@ -63,7 +63,6 @@
 #include <stdlib.h>
 #include <string.h>
 #include <ctype.h>
-#include <alloca.h>
 #include <errno.h>
 #include <langinfo.h>
 
