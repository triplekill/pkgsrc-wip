$NetBSD$

--- content/browser/renderer_host/p2p_socket_host_posix.cc.orig	2011-05-24 08:01:07.000000000 +0000
+++ content/browser/renderer_host/p2p_socket_host_posix.cc
@@ -50,7 +50,7 @@ bool GetLocalAddress(sockaddr_in* addr) 
 
   struct ifreq* ptr = reinterpret_cast<struct ifreq*>(ifc.ifc_buf);
   struct ifreq* end =
-      reinterpret_cast<struct ifreq*>(ifc.ifc_buf + ifc.ifc_len);
+      reinterpret_cast<struct ifreq*>((char *)ifc.ifc_buf + ifc.ifc_len);
 
   bool found = false;
   while (ptr < end) {
