$NetBSD$

--- chrome/browser/renderer_host/browser_render_process_host.cc.orig	2011-05-24 08:01:42.000000000 +0000
+++ chrome/browser/renderer_host/browser_render_process_host.cc
@@ -903,7 +903,7 @@ TransportDIB* BrowserRenderProcessHost::
   HANDLE section = chrome::GetSectionFromProcess(
       dib_id.handle, GetHandle(), false /* read write */);
   return TransportDIB::Map(section);
-#elif defined(OS_MACOSX)
+#elif defined(OS_MACOSX) || defined(OS_BSD)
   // On OSX, the browser allocates all DIBs and keeps a file descriptor around
   // for each.
   return widget_helper_->MapTransportDIB(dib_id);
