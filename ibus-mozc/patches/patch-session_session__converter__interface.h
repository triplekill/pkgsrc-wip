$NetBSD$

--- session/session_converter_interface.h.orig	2012-08-31 05:36:43.000000000 +0000
+++ session/session_converter_interface.h
@@ -68,7 +68,7 @@ struct OperationPreferences {
   bool use_cascading_window;
   string candidate_shortcuts;
   OperationPreferences() {
-#ifdef OS_LINUX
+#if defined(OS_LINUX) || defined(OS_NETBSD)
     // TODO(komatsu): Move this logic to the client code.
     use_cascading_window = false;
 #else
