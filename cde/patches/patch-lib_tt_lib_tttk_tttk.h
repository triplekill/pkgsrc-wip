$NetBSD$

--- lib/tt/lib/tttk/tttk.h.orig	2012-09-26 18:55:37.000000000 +0000
+++ lib/tt/lib/tttk/tttk.h
@@ -33,7 +33,7 @@
 #ifndef tttk_h
 #define tttk_h
 
-#include <Tt/tt_c.h>
+#include "../../lib/api/c/tt_c.h"
 #include <X11/Intrinsic.h>
 
 #if defined(__cplusplus)
