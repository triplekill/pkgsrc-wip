$NetBSD$

Use pkgsrc databases/db4.

--- src/db.h.orig	2014-04-16 19:46:36.000000000 +0000
+++ src/db.h
@@ -11,7 +11,7 @@
 #include <string>
 #include <vector>
 
-#include <db_cxx.h>
+#include <db4/db_cxx.h>
 
 class CAddress;
 class CAddrMan;
