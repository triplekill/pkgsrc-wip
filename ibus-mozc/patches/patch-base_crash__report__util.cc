$NetBSD$

--- base/crash_report_util.cc.orig	2012-08-31 05:37:06.000000000 +0000
+++ base/crash_report_util.cc
@@ -51,9 +51,9 @@ namespace mozc {
 
 void CrashReportUtil::InstallBreakpad() {
   // TODO(nona): Support breakpad for official branding build on Linux.
-#if defined(GOOGLE_JAPANESE_INPUT_BUILD) && !defined(OS_LINUX)
+#if defined(GOOGLE_JAPANESE_INPUT_BUILD) && (!defined(OS_LINUX) || !defined(OS_NETBSD))
   CrashReportHandler::Initialize(false);
-#endif  // GOOGLE_JAPANESE_INPUT_BUILD && !OS_LINUX
+#endif  // GOOGLE_JAPANESE_INPUT_BUILD && (!OS_LINUX || !OS_NETBSD)
 }
 
 string CrashReportUtil::GetCrashReportDirectory() {
