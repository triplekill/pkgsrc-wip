$NetBSD$

--- chrome/browser/ui/views/notifications/balloon_view.cc.orig	2011-04-13 08:01:42.000000000 +0000
+++ chrome/browser/ui/views/notifications/balloon_view.cc
@@ -39,7 +39,7 @@
 #if defined(OS_WIN)
 #include "views/widget/widget_win.h"
 #endif
-#if defined(OS_LINUX)
+#if defined(TOOLKIT_GTK)
 #include "views/widget/widget_gtk.h"
 #endif
 
