$NetBSD$

--- net/base/listen_socket.cc.orig	2011-04-13 08:01:17.000000000 +0000
+++ net/base/listen_socket.cc
@@ -10,6 +10,7 @@
 #include <winsock2.h>
 #elif defined(OS_POSIX)
 #include <errno.h>
+#include <sys/types.h>
 #include <netinet/in.h>
 #include <sys/socket.h>
 #include <arpa/inet.h>
