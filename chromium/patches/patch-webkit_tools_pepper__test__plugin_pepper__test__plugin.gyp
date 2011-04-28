$NetBSD$

--- webkit/tools/pepper_test_plugin/pepper_test_plugin.gyp.orig	2011-04-13 08:01:08.000000000 +0000
+++ webkit/tools/pepper_test_plugin/pepper_test_plugin.gyp
@@ -47,11 +47,11 @@
             ],
           },
         }],
-        ['OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris"', {
+        ['OS=="linux" or OS=="dragonfly" or OS=="freebsd" or OS=="netbsd" or OS=="openbsd" or OS=="solaris"', {
           'type': 'shared_library',
           'cflags': ['-fvisibility=hidden'],
         }],
-        ['OS=="linux" or OS=="openbsd" or OS=="freebsd" and (target_arch=="x64" or target_arch=="arm") and linux_fpic!=1', {
+        ['(OS=="linux" or OS=="dragonfly" or OS=="freebsd" or OS=="netbsd" or OS=="openbsd") and (target_arch=="x64" or target_arch=="arm") and linux_fpic!=1', {
           'product_name': 'pepper_test_plugin',
           # Shared libraries need -fPIC on x86-64
           'cflags': ['-fPIC'],
