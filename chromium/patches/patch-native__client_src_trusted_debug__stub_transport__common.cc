$NetBSD$

--- native_client/src/trusted/debug_stub/transport_common.cc.orig	2011-05-24 08:19:25.000000000 +0000
+++ native_client/src/trusted/debug_stub/transport_common.cc
@@ -14,6 +14,7 @@
 
 #include <arpa/inet.h>
 #include <netdb.h>
+#include <netinet/in.h>
 #include <sys/select.h>
 #include <sys/socket.h>
 #include <sys/types.h>
