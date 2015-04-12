$NetBSD$

Fix --enable-glx-tls with clang. From FreeBSD.

--- src/mapi/entry_x86-64_tls.h.orig	2015-03-28 18:20:39.000000000 +0000
+++ src/mapi/entry_x86-64_tls.h
@@ -62,8 +62,8 @@ entry_patch_public(void)
 {
 }
 
-static char
-x86_64_entry_start[];
+extern char
+x86_64_entry_start[] __attribute__((visibility("hidden")));
 
 mapi_func
 entry_get_public(int slot)
