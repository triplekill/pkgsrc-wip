$NetBSD$

--- third_party/WebKit/Source/JavaScriptCore/JavaScriptCore.gyp/JavaScriptCore.gyp.orig	2011-04-13 08:12:05.000000000 +0000
+++ third_party/WebKit/Source/JavaScriptCore/JavaScriptCore.gyp/JavaScriptCore.gyp
@@ -83,7 +83,7 @@
               'WTF_USE_NEW_THEME=1',
             ],
           }],
-          ['OS=="linux" or OS=="freebsd"', {
+          ['OS=="linux" or OS=="dragonfly" or OS=="freebsd" or OS=="netbsd" or OS=="openbsd"', {
             'defines': [
               'WTF_USE_PTHREADS=1',
             ],
