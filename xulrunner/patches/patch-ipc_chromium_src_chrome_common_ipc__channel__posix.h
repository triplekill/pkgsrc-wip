$NetBSD$

--- ipc/chromium/src/chrome/common/ipc_channel_posix.h.orig	2011-06-15 21:57:27.000000000 +0000
+++ ipc/chromium/src/chrome/common/ipc_channel_posix.h
@@ -92,7 +92,7 @@ class Channel::ChannelImpl : public Mess
   };
 
   // This is a control message buffer large enough to hold kMaxReadFDs
-#if defined(OS_MACOSX)
+#if defined(OS_MACOSX) || defined(OS_NETBSD)
   // TODO(agl): OSX appears to have non-constant CMSG macros!
   char input_cmsg_buf_[1024];
 #else
