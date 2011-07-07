$NetBSD$

--- ipc/chromium/src/base/debug_util_posix.cc.orig	2011-06-15 21:57:27.000000000 +0000
+++ ipc/chromium/src/base/debug_util_posix.cc
@@ -11,10 +11,10 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <unistd.h>
-#ifndef ANDROID
+#ifdef __linux__
 #include <execinfo.h>
-#include <sys/sysctl.h>
 #endif
+#include <sys/sysctl.h>
 
 #include "base/basictypes.h"
 #include "base/eintr_wrapper.h"
@@ -119,7 +119,7 @@ StackTrace::StackTrace() {
   const int kMaxCallers = 256;
 
   void* callers[kMaxCallers];
-#ifndef ANDROID
+#ifdef __GLIBC__
   int count = backtrace(callers, kMaxCallers);
 #else
   int count = 0;
@@ -138,7 +138,7 @@ StackTrace::StackTrace() {
 
 void StackTrace::PrintBacktrace() {
   fflush(stderr);
-#ifndef ANDROID
+#ifdef __GLIBC__
   backtrace_symbols_fd(&trace_[0], trace_.size(), STDERR_FILENO);
 #endif
 }
