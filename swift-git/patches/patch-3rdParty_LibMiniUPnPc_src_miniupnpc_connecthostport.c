$NetBSD$

Include missing header for struct timeval.

--- 3rdParty/LibMiniUPnPc/src/miniupnpc/connecthostport.c.orig	2014-08-18 06:33:47.000000000 +0000
+++ 3rdParty/LibMiniUPnPc/src/miniupnpc/connecthostport.c
@@ -33,6 +33,7 @@
 #ifndef USE_GETHOSTBYNAME
 #include <sys/types.h>
 #include <sys/socket.h>
+#include <sys/select.h>
 #endif /* #ifndef USE_GETHOSTBYNAME */
 #endif /* #else WIN32 */
 
