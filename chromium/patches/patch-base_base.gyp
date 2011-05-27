$NetBSD$

--- base/base.gyp.orig	2011-05-24 08:01:33.000000000 +0000
+++ base/base.gyp
@@ -20,7 +20,7 @@
         '../third_party/icu/icu.gyp:icuuc',
       ],
       'conditions': [
-        ['OS=="linux" or OS=="freebsd" or OS=="openbsd"', {
+        ['OS=="linux" or OS=="dragonfly" or OS=="freebsd" or OS=="netbsd" or OS=="openbsd"', {
           'dependencies': [
             # i18n/rtl.cc uses gtk
             '../build/linux/system.gyp:gtk',
@@ -69,7 +69,7 @@
         'bits_unittest.cc',
         'callback_unittest.cc',
         'command_line_unittest.cc',
-        'cpu_unittest.cc',
+        #'cpu_unittest.cc',
         'crypto/encryptor_unittest.cc',
         'crypto/rsa_private_key_unittest.cc',
         'crypto/rsa_private_key_nss_unittest.cc',
@@ -188,7 +188,7 @@
         '../testing/gtest.gyp:gtest',
       ],
       'conditions': [
-        ['OS == "linux" or OS == "freebsd" or OS == "openbsd" or OS == "solaris"', {
+        ['OS == "linux" or OS == "dragonfly" or OS == "freebsd" or OS == "netbsd" or OS == "openbsd" or OS == "solaris"', {
           'sources!': [
             'file_version_info_unittest.cc',
           ],
@@ -253,7 +253,7 @@
         '../testing/gtest.gyp:gtest',
       ],
       'conditions': [
-        ['OS=="linux" or OS=="freebsd" or OS=="openbsd"', {
+        ['OS=="linux" or OS=="dragonfly" or OS=="freebsd" or OS=="netbsd" or OS=="openbsd"', {
           'dependencies': [
             # test_suite initializes GTK.
             '../build/linux/system.gyp:gtk',
@@ -298,7 +298,7 @@
         ],
       },
       'conditions': [
-        ['OS == "linux" or OS == "freebsd" or OS == "openbsd" or OS == "solaris"', {
+        ['OS == "linux" or OS == "dragonfly" or OS == "freebsd" or OS == "netbsd" or OS == "openbsd" or OS == "solaris"', {
           'dependencies': [
             # Needed to handle the #include chain:
             #   base/test/perf_test_suite.h
