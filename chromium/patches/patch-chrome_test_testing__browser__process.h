$NetBSD$

--- chrome/test/testing_browser_process.h.orig	2011-04-13 08:01:56.000000000 +0000
+++ chrome/test/testing_browser_process.h
@@ -57,7 +57,7 @@ class TestingBrowserProcess : public Bro
     return NULL;
   }
 
-#if defined(OS_LINUX)
+#if defined(USE_X11)
   virtual base::Thread* background_x11_thread() {
     return NULL;
   }
