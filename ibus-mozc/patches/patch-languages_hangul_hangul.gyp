$NetBSD$

--- languages/hangul/hangul.gyp.orig	2012-08-31 05:36:42.000000000 +0000
+++ languages/hangul/hangul.gyp
@@ -59,7 +59,7 @@
     },
   ],
   'conditions': [
-    ['OS=="linux"', {
+    ['OS=="linux" or OS=="netbsd"', {
       'targets': [
         {
           'target_name': 'ibus_mozc_hangul',
