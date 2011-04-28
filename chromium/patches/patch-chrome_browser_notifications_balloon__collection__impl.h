$NetBSD$

--- chrome/browser/notifications/balloon_collection_impl.h.orig	2011-04-13 08:01:44.000000000 +0000
+++ chrome/browser/notifications/balloon_collection_impl.h
@@ -57,7 +57,7 @@ class BalloonCollectionImpl : public Bal
   virtual void WillProcessMessage(const MSG& event) {}
   virtual void DidProcessMessage(const MSG& event);
 #endif
-#if defined(OS_LINUX)
+#if defined(TOOLKIT_USES_GTK)
   virtual void WillProcessEvent(GdkEvent* event) {}
   virtual void DidProcessEvent(GdkEvent* event);
 #endif
