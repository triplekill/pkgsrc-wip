$NetBSD$

Do not try to include alloca.h if it doesn't exist

--- bridges/source/cpp_uno/gcc3_linux_x86-64/uno2cpp.cxx.orig	2012-07-03 11:01:28.000000000 +0000
+++ bridges/source/cpp_uno/gcc3_linux_x86-64/uno2cpp.cxx
@@ -26,7 +26,9 @@
  *
  ************************************************************************/
 
+#ifdef HAVE_ALLOCA_H
 #include <alloca.h>
+#endif
 #include <exception>
 #include <typeinfo>
 
