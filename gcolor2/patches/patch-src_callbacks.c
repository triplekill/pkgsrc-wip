$NetBSD$

Add missing header for strlen(3) and strspn(3).

--- src/callbacks.c.orig	2005-07-12 18:06:12.000000000 +0000
+++ src/callbacks.c
@@ -4,6 +4,7 @@
 
 #include <gtk/gtk.h>
 #include <stdio.h>
+#include <string.h>
 
 #include "callbacks.h"
 #include "interface.h"
