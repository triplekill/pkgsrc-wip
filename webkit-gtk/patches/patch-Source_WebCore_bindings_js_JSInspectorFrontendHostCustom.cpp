$NetBSD: patch-Source_WebCore_bindings_js_JSInspectorFrontendHostCustom.cpp,v 1.2 2014/08/03 22:30:05 wiz Exp $

--- Source/WebCore/bindings/js/JSInspectorFrontendHostCustom.cpp.orig	2015-01-15 09:40:35.000000000 +0000
+++ Source/WebCore/bindings/js/JSInspectorFrontendHostCustom.cpp
@@ -62,6 +62,8 @@ JSValue JSInspectorFrontendHost::platfor
     DEPRECATED_DEFINE_STATIC_LOCAL(const String, platform, (ASCIILiteral("linux")));
 #elif OS(FREEBSD)
     DEPRECATED_DEFINE_STATIC_LOCAL(const String, platform, (ASCIILiteral("freebsd")));
+#elif OS(NETBSD)
+    DEPRECATED_DEFINE_STATIC_LOCAL(const String, platform, (ASCIILiteral("netbsd")));
 #elif OS(OPENBSD)
     DEPRECATED_DEFINE_STATIC_LOCAL(const String, platform, (ASCIILiteral("openbsd")));
 #elif OS(SOLARIS)
