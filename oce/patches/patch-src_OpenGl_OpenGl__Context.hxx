$NetBSD$

We need alloca.h.
--- src/OpenGl/OpenGl_Context.hxx.orig	2014-02-12 20:06:33.000000000 +0000
+++ src/OpenGl/OpenGl_Context.hxx
@@ -34,6 +34,10 @@
 #include <Handle_OpenGl_Context.hxx>
 #include <OpenGl_Clipping.hxx>
 
+#if defined(__sun) 
+#include <alloca.h>
+#endif
+
 //! Forward declarations
 struct OpenGl_GlCore12;
 struct OpenGl_GlCore13;
