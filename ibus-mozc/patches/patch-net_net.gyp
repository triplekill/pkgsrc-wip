$NetBSD$

--- net/net.gyp.orig	2012-08-31 05:36:44.000000000 +0000
+++ net/net.gyp
@@ -61,7 +61,7 @@
                 },
               },
             }],
-            ['target_platform=="Linux"', {
+            ['target_platform=="Linux" or OS=="netbsd"', {
               # Enable libcurl
               'cflags': [
                 '<!@(<(pkg_config_command) --cflags libcurl)',
