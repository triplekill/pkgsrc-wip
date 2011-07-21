$NetBSD$

--- j2se/src/solaris/native/java/net/NetworkInterface.c.orig	2011-07-21 11:32:53 +0000
+++ j2se/src/solaris/native/java/net/NetworkInterface.c
@@ -35,7 +35,7 @@
 #if defined(_ALLBSD_SOURCE)
 #include <sys/param.h>
 #include <sys/ioctl.h>
-#if defined(__FreeBSD__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__APPLE__) || defined(__DragonFly__)
 #include <net/ethernet.h>
 #include <net/if_var.h>
 #elif defined(__OpenBSD__)
