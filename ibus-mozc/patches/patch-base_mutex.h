$NetBSD$

* I am not sure.

--- base/mutex.h.orig	2012-08-31 05:37:06.000000000 +0000
+++ base/mutex.h
@@ -56,6 +56,10 @@ namespace mozc {
 #define MOZC_RW_MUTEX_PTR_ARRAYSIZE 10
 #endif
 
+#if defined(__FreeBSD__) || defined(__NetBSD__)
+#define PTHREAD_MUTEX_RECURSIVE_VALUE PTHREAD_MUTEX_RECURSIVE
+#endif
+
 class LOCKABLE Mutex {
  public:
   Mutex();
