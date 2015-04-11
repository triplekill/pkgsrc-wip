$NetBSD$

Try to fix broken X_BYTE_ORDER handling for big endian.
Probably broken here:
http://cgit.freedesktop.org/xorg/xserver/commit/?id=4302484ef2e67b2e05756c7ee0834dce938f1b44

--- include/servermd.h.orig	2015-01-17 23:42:52.000000000 +0000
+++ include/servermd.h
@@ -52,10 +52,10 @@ SOFTWARE.
 #error xserver code must include dix-config.h before any other headers
 #endif
 
-#if X_BYTE_ORDER == X_LITTLE_ENDIAN
+#if X_BYTE_ORDER == X_LITTLE_ENDIAN && defined(X_LITTLE_ENDIAN)
 #define IMAGE_BYTE_ORDER        LSBFirst
 #define BITMAP_BIT_ORDER        LSBFirst
-#elif X_BYTE_ORDER == X_BIG_ENDIAN
+#elif X_BYTE_ORDER == X_BIG_ENDIAN && defined(X_BIG_ENDIAN)
 #define IMAGE_BYTE_ORDER        MSBFirst
 #define BITMAP_BIT_ORDER        MSBFirst
 #else
