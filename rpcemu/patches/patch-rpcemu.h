$NetBSD$

* Support NetBSD

--- rpcemu.h.orig	2010-09-19 19:25:37.000000000 +0000
+++ rpcemu.h
@@ -51,7 +51,7 @@
 #define fseeko64(_a, _b, _c) fseek(_a, (long)_b, _c)
 #endif
 
-#ifdef __MACH__
+#if defined __MACH__ || defined __NetBSD__
 #define fseeko64(_a, _b, _c) fseeko(_a, _b, _c)
 #define ftello64(stream) ftello(stream)
 #define fopen64(_a, _b) fopen(_a, _b)
