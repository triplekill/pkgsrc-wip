$NetBSD: patch-ipc_chromium_src_base_platform__thread__posix.cc,v 1.6 2014/05/30 03:03:36 pho Exp $

--- ipc/chromium/src/base/platform_thread_posix.cc.orig	2014-05-06 22:55:41.000000000 +0000
+++ ipc/chromium/src/base/platform_thread_posix.cc
@@ -9,8 +9,12 @@
 
 #if defined(OS_MACOSX)
 #include <mach/mach.h>
+#include <dlfcn.h>
+#include <string>
 #elif defined(OS_NETBSD)
+_Pragma("GCC visibility push(default)")
 #include <lwp.h>
+_Pragma("GCC visibility pop")
 #elif defined(OS_LINUX)
 #include <sys/syscall.h>
 #include <sys/prctl.h>
@@ -114,19 +116,20 @@ void PlatformThread::SetName(const char*
   pthread_setname_np(pthread_self(), "%s", (void *)name);
 #elif defined(OS_BSD) && !defined(__GLIBC__)
   pthread_set_name_np(pthread_self(), name);
-#else
+#elif !defined(OS_SOLARIS)
+  prctl(PR_SET_NAME, reinterpret_cast<uintptr_t>(name), 0, 0, 0);
 #endif
 }
 #endif // !OS_MACOSX
 
 namespace {
 
 bool CreateThread(size_t stack_size, bool joinable,
                   PlatformThread::Delegate* delegate,
                   PlatformThreadHandle* thread_handle) {
 #if defined(OS_MACOSX)
   base::InitThreading();
 #endif  // OS_MACOSX
 
   bool success = false;
   pthread_attr_t attributes;
