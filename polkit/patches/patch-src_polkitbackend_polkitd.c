$NetBSD$

polkitd: Fix problem with removing non-existent source

--- src/polkitbackend/polkitd.c.orig	2013-04-29 17:28:57.000000000 +0000
+++ src/polkitbackend/polkitd.c
@@ -92,7 +92,7 @@ on_sigint (gpointer user_data)
 {
   g_print ("Handling SIGINT\n");
   g_main_loop_quit (loop);
-  return FALSE;
+  return TRUE;
 }
 
 static gboolean
