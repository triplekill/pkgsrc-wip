$NetBSD$

--- v8/tools/gyp/v8.gyp.orig	2011-04-13 08:24:41.000000000 +0000
+++ v8/tools/gyp/v8.gyp
@@ -109,7 +109,7 @@
           },
           'Release': {
             'conditions': [
-              ['OS=="linux" or OS=="freebsd" or OS=="openbsd"', {
+              ['OS=="linux" or OS=="dragonfly" or OS=="freebsd" or OS=="netbsd" or OS=="openbsd"', {
                 'cflags!': [
                   '-O2',
                   '-Os',
@@ -717,7 +717,7 @@
                 ],
               }
             ],
-            ['OS=="freebsd"', {
+            ['OS=="freebsd" or OS=="dragonfly"', {
                 'link_settings': {
                   'libraries': [
                     '-L/usr/local/lib -lexecinfo',
@@ -728,6 +728,12 @@
                 ],
               }
             ],
+            ['OS=="netbsd"', {
+                'sources': [
+                  '../../src/platform-netbsd.cc',
+                  '../../src/platform-posix.cc'
+                ],
+            }],
             ['OS=="openbsd"', {
                 'link_settings': {
                   'libraries': [
