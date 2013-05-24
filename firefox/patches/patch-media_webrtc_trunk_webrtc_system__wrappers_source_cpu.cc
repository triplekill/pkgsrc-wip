$NetBSD: patch-media_webrtc_trunk_webrtc_system__wrappers_source_cpu.cc,v 1.1 2013/05/23 13:12:13 ryoon Exp $

--- media/webrtc/trunk/webrtc/system_wrappers/source/cpu.cc.orig	2013-05-11 19:19:46.000000000 +0000
+++ media/webrtc/trunk/webrtc/system_wrappers/source/cpu.cc
@@ -14,7 +14,7 @@
 #include "cpu_win.h"
 #elif defined(WEBRTC_MAC)
 #include "cpu_mac.h"
-#elif defined(WEBRTC_ANDROID)
+#elif defined(WEBRTC_ANDROID) || defined(WEBRTC_BSD)
 // Not implemented yet, might be possible to use Linux implementation
 #else // defined(WEBRTC_LINUX)
 #include "cpu_linux.h"
@@ -26,7 +26,7 @@ CpuWrapper* CpuWrapper::CreateCpu() {
   return new CpuWindows();
 #elif defined(WEBRTC_MAC)
   return new CpuWrapperMac();
-#elif defined(WEBRTC_ANDROID)
+#elif defined(WEBRTC_ANDROID) || defined(WEBRTC_BSD)
   return 0;
 #else
   return new CpuLinux();
