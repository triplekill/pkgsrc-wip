$NetBSD$

--- tools/gyp/test/library/src/library.gyp.orig	2011-04-13 08:13:19.000000000 +0000
+++ tools/gyp/test/library/src/library.gyp
@@ -48,7 +48,7 @@
     },
   ],
   'conditions': [
-    ['OS=="linux"', {
+    ['OS=="linux" or OS=="dragonfly" or OS=="freebsd" or OS=="netbsd" or OS=="openbsd"', {
       'target_defaults': {
         # Support 64-bit shared libs (also works fine for 32-bit).
         'cflags': ['-fPIC'],
