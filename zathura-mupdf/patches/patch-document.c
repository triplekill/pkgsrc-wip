$NetBSD$

Correct the glib-2.0 include header file path.

--- document.c.orig	2015-05-27 15:18:11.000000000 +0000
+++ document.c
@@ -6,7 +6,7 @@
 #include <mupdf/xps.h>
 #include <mupdf/pdf.h>
 
-#include <glib-2.0/glib.h>
+#include <glib.h>
 
 #include "plugin.h"
 
