$NetBSD$

* XXX: no fgetgrent(3)

--- test/mocklibc/src/grp.c.orig	2013-02-02 03:22:52.000000000 +0000
+++ test/mocklibc/src/grp.c
@@ -27,6 +27,12 @@
 
 static FILE *global_stream = NULL;
 
+#ifdef __NetBSD__
+static struct group *fgetgrent(FILE *stream) {
+  return NULL;
+}
+#endif
+
 void setgrent(void) {
   if (global_stream)
     endgrent();
