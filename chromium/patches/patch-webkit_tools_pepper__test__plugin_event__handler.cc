$NetBSD$

--- webkit/tools/pepper_test_plugin/event_handler.cc.orig	2011-04-13 08:01:08.000000000 +0000
+++ webkit/tools/pepper_test_plugin/event_handler.cc
@@ -55,7 +55,7 @@ void EventHandler::addText(const char* c
 }
 
 std::string EventHandler::EventName(double timestamp, int32 type) {
-#if !defined(OS_LINUX)
+#if !defined(OS_LINUX) && !defined(OS_BSD)
   std::stringstream strstr;
   strstr.setf(std::ios::fixed, std::ios::floatfield);
   strstr << timestamp << ": ";
