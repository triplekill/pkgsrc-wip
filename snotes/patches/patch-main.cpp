$NetBSD$

Needs exit().

--- main.cpp.orig	2005-07-15 18:19:17.000000000 +0000
+++ main.cpp
@@ -4,6 +4,7 @@
 **
 ****************************************************************/
 
+#include <stdlib.h>
 #include <qapplication.h>
 #include <qstring.h>
 #include <qpixmap.h>
