$NetBSD$

--- base/util_test.cc.orig	2012-08-31 05:37:06.000000000 +0000
+++ base/util_test.cc
@@ -2210,7 +2210,7 @@ TEST(UtilTest, MacMaybeMLockTest) {
 TEST(UtilTest, LinuxMaybeMLockTest) {
   size_t data_len = 32;
   void *addr = malloc(data_len);
-#ifdef OS_LINUX
+#if defined(OS_LINUX) || defined(OS_NETBSD)
 #if defined(OS_ANDROID) || defined(__native_client__)
   EXPECT_EQ(-1, Util::MaybeMLock(addr, data_len));
   EXPECT_EQ(-1, Util::MaybeMUnlock(addr, data_len));
