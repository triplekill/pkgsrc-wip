$NetBSD$

--- programs/dtcm/dtcm/dnd.c.orig	2012-09-28 21:20:45.000000000 +0000
+++ programs/dtcm/dtcm/dnd.c
@@ -72,7 +72,7 @@
 
 static Bool lookForButton(Display *, XEvent *, XPointer);
 
-#if !defined(linux) && !defined(__FreeBSD__)
+#if !defined(linux) && !defined(CSRG_BASED)
 extern char	*sys_errlist[];
 #endif
 
