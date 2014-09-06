$NetBSD$

Add NetBSD support.

--- server/scsynth/SC_ComPort.cpp.orig	2013-11-27 12:54:02.000000000 +0000
+++ server/scsynth/SC_ComPort.cpp
@@ -38,7 +38,7 @@
 	#include <netinet/tcp.h>
 #endif
 
-#if defined(__linux__) || defined(__FreeBSD__)
+#if defined(__linux__) || defined(__FreeBSD__) || defined(__NetBSD__)
 	#include <errno.h>
 	#include <unistd.h>
 #endif
