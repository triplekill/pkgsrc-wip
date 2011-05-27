$NetBSD$

--- chrome/browser/memory_details.cc.orig	2011-05-24 08:01:43.000000000 +0000
+++ chrome/browser/memory_details.cc
@@ -25,7 +25,7 @@
 #include "grit/generated_resources.h"
 #include "ui/base/l10n/l10n_util.h"
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
 #include "content/browser/zygote_host_linux.h"
 #include "content/browser/renderer_host/render_sandbox_host_linux.h"
 #endif
@@ -109,7 +109,7 @@ void MemoryDetails::CollectChildInfoOnIO
 void MemoryDetails::CollectChildInfoOnUIThread() {
   DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
   const pid_t zygote_pid = ZygoteHost::GetInstance()->pid();
   const pid_t sandbox_helper_pid = RenderSandboxHostLinux::GetInstance()->pid();
 #endif
@@ -236,7 +236,7 @@ void MemoryDetails::CollectChildInfoOnUI
       }
     }
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
     if (process.pid == zygote_pid) {
       process.type = ChildProcessInfo::ZYGOTE_PROCESS;
     } else if (process.pid == sandbox_helper_pid) {
