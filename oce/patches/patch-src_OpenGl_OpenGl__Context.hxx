$NetBSD$

We need alloca.h.
--- src/OpenGl/OpenGl_Context.hxx.orig	2015-03-08 22:19:42.000000000 +0000
+++ src/OpenGl/OpenGl_Context.hxx
@@ -39,6 +39,10 @@
 #include <OpenGl_GlCore11.hxx>
 #include <OpenGl_Utils.hxx>
 
+#if defined(__sun)
+#include <alloca.h>
+#endif
+
 //! Forward declarations
 struct OpenGl_GlFunctions;
 struct OpenGl_ArbTBO;
