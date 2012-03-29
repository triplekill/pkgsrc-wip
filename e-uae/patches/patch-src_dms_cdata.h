$NetBSD$

Fix build with clang, which understands inline as C99 inline.

--- src/dms/cdata.h.orig	2004-05-19 01:22:12.000000000 +0000
+++ src/dms/cdata.h
@@ -31,7 +31,7 @@
 		#define INLINE inline
 	#else
 		#ifdef __GNUC__
-			#define INLINE inline
+			#define INLINE static inline
 		#else
 			#ifdef __SASC
 				#define INLINE __inline
