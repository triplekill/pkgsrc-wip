$NetBSD$

Add NetBSD support.

--- lang/LangSource/PyrMathSupport.cpp.orig	2013-11-10 21:08:21.000000000 +0000
+++ lang/LangSource/PyrMathSupport.cpp
@@ -26,7 +26,7 @@
 #include <stdlib.h>
 #include <math.h>
 
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__NetBSD__)
 # include <complex.h>
 #endif
 
