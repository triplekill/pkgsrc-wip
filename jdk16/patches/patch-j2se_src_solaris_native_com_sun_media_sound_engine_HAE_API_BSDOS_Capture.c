$NetBSD$

--- j2se/src/solaris/native/com/sun/media/sound/engine/HAE_API_BSDOS_Capture.c.orig	2011-07-21 13:25:19 +0000
+++ j2se/src/solaris/native/com/sun/media/sound/engine/HAE_API_BSDOS_Capture.c
@@ -43,7 +43,7 @@
 #include <sys/wait.h>
 #include <errno.h>
 
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__DragonFly__)
 #include <sys/soundcard.h>
 #endif
 #if defined(__NetBSD__) || defined(__OpenBSD__)
