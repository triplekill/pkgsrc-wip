$NetBSD$

--- native_client/src/trusted/debug_stub/posix/platform_impl.cc.orig	2011-05-24 08:19:25.000000000 +0000
+++ native_client/src/trusted/debug_stub/posix/platform_impl.cc
@@ -11,6 +11,9 @@
 #include <sys/types.h>
 #include <sys/syscall.h>
 #include <pthread.h>
+#if defined(__NetBSD__)
+#include <lwp.h>
+#endif
 
 #include <map>
 #include <vector>
@@ -49,13 +52,25 @@ struct StartInfo_t {
 
 // Get the OS id of this thread
 uint32_t IPlatform::GetCurrentThread() {
+#if defined(__NetBSD__)
+  return static_cast<uint32_t>(_lwp_self());
+#elif defined(__DragonFly__)
+  return static_cast<uint32_t>(lwp_gettid());
+#else
   return static_cast<uint32_t>(syscall(SYS_gettid));
+#endif
 }
 
 // Use start stub, to record thread id, and signal launcher
 static void *StartFunc(void* cookie) {
   StartInfo_t* info = reinterpret_cast<StartInfo_t*>(cookie);
+#if defined(__NetBSD__)
+  info->id_ = (uint32_t) _lwp_self();
+#elif defined(__DragonFly__)
+  info->id_ = (uint32_t) lwp_gettid();
+#else
   info->id_ = (uint32_t) syscall(SYS_gettid);
+#endif
 
   printf("Started thread...\n");
   GetLaunchEvent()->Signal();
