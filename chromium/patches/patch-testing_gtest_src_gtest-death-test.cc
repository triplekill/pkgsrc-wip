$NetBSD$

--- testing/gtest/src/gtest-death-test.cc.orig	2011-04-13 08:14:20.000000000 +0000
+++ testing/gtest/src/gtest-death-test.cc
@@ -50,6 +50,7 @@
 #else
 #include <sys/mman.h>
 #include <sys/wait.h>
+#include <sys/signal.h>
 #endif  // GTEST_OS_WINDOWS
 
 #endif  // GTEST_HAS_DEATH_TEST
