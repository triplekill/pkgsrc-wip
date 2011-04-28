$NetBSD$

--- third_party/cld/base/build_config.h.orig	2011-04-13 08:01:31.000000000 +0000
+++ third_party/cld/base/build_config.h
@@ -26,9 +26,15 @@
 #elif defined(_WIN32)
 #define OS_WIN 1
 #define TOOLKIT_VIEWS 1
+#elif defined(__DragonFly__)
+#define OS_DRAGONFLY 1
+#define TOOLKIT_GTK
 #elif defined(__FreeBSD__)
 #define OS_FREEBSD 1
 #define TOOLKIT_GTK
+#elif defined(__NetBSD__)
+#define OS_NETBSD 1
+#define TOOLKIT_GTK
 #elif defined(__OpenBSD__)
 #define OS_OPENBSD 1
 #define TOOLKIT_GTK
@@ -42,14 +48,16 @@
 #define TOOLKIT_USES_GTK 1
 #endif
 
-#if defined(OS_LINUX) || defined(OS_FREEBSD) || defined(OS_OPENBSD)
+#if defined(OS_LINUX) || defined(OS_DRAGONFLY) || defined(OS_FREEBSD) || \
+    defined(OS_NETBSD) || defined(OS_OPENBSD)
 #define USE_NSS 1  // Use NSS for crypto.
 #define USE_X11 1  // Use X for graphics.
 #endif
 
 // For access to standard POSIXish features, use OS_POSIX instead of a
 // more specific macro.
-#if defined(OS_MACOSX) || defined(OS_LINUX) || defined(OS_FREEBSD) || defined(OS_OPENBSD)
+#if defined(OS_MACOSX) || defined(OS_LINUX) || defined(OS_DRAGONFLY) || \
+    defined(OS_FREEBSD) || defined(OS_NETBSD) || defined(OS_OPENBSD)
 #define OS_POSIX 1
 // Use base::DataPack for name/value pairs.
 #define USE_BASE_DATA_PACK 1
