$NetBSD$

--- languages/chewing/chewing.gyp.orig	2012-08-31 05:36:42.000000000 +0000
+++ languages/chewing/chewing.gyp
@@ -55,7 +55,7 @@
     },
   ],
   'conditions': [
-    ['OS=="linux"', {
+    ['OS=="linux" or OS=="netbsd"', {
       'targets': [
         {
           'target_name': 'ibus_mozc_chewing',
