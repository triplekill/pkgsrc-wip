$NetBSD$

--- src/osdep/byteorder.h.orig	2013-03-04 17:32:55.000000000 +0000
+++ src/osdep/byteorder.h
@@ -222,7 +222,7 @@
 
 
 	// FreeBSD
-	#ifdef __FreeBSD__
+	#if defined(__FreeBSD__) || defined(__NetBSD__)
 		#include <machine/endian.h>
 	#endif
 
