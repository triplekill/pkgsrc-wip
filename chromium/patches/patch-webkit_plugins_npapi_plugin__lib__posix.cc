$NetBSD$

--- webkit/plugins/npapi/plugin_lib_posix.cc.orig	2011-04-13 08:01:07.000000000 +0000
+++ webkit/plugins/npapi/plugin_lib_posix.cc
@@ -9,8 +9,8 @@
 #include <sys/exec_elf.h>
 #else
 #include <elf.h>
-#include <fcntl.h>
 #endif
+#include <fcntl.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <unistd.h>
