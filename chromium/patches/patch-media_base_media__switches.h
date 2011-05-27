$NetBSD$

--- media/base/media_switches.h.orig	2011-05-24 08:01:03.000000000 +0000
+++ media/base/media_switches.h
@@ -11,7 +11,7 @@
 
 namespace switches {
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_FREEBSD) || defined(OS_DRAGONFLY)
 extern const char kAlsaOutputDevice[];
 extern const char kAlsaInputDevice[];
 #endif
