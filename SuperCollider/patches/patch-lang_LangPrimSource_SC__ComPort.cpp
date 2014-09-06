$NetBSD$

Fix for NetBSD.

--- lang/LangPrimSource/SC_ComPort.cpp.orig	2013-11-27 12:54:02.000000000 +0000
+++ lang/LangPrimSource/SC_ComPort.cpp
@@ -37,7 +37,7 @@
 # include <errno.h>
 #endif
 
-#ifdef __FreeBSD__
+#if defined (__FreeBSD__) || defined(__NetBSD__)
 # include <errno.h>
 #endif
 
