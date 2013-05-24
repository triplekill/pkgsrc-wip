$NetBSD: patch-media_webrtc_trunk_webrtc_system__wrappers_source_trace__posix.cc,v 1.1 2013/05/23 13:12:13 ryoon Exp $

--- media/webrtc/trunk/webrtc/system_wrappers/source/trace_posix.cc.orig	2013-05-11 19:19:46.000000000 +0000
+++ media/webrtc/trunk/webrtc/system_wrappers/source/trace_posix.cc
@@ -54,7 +54,7 @@ WebRtc_Word32 TracePosix::AddTime(char* 
   }
   struct tm buffer;
   const struct tm* system_time =
-    localtime_r(&system_time_high_res.tv_sec, &buffer);
+    localtime_r((const time_t *)(&system_time_high_res.tv_sec), &buffer);
 
   const WebRtc_UWord32 ms_time = system_time_high_res.tv_usec / 1000;
   WebRtc_UWord32 prev_tickCount = 0;
