$NetBSD$

--- General.h.orig	2009-01-09 11:18:03.000000000 +0000
+++ General.h
@@ -12,7 +12,7 @@
 #undef _POSIX_SOURCE
 #endif
 
-#ifndef __FreeBSD__
+#if !defined(__FreeBSD__) && !defined(__NetBSD__) && !defined(__DragonFly__)
 #define _POSIX_SOURCE 1
 #endif
 
