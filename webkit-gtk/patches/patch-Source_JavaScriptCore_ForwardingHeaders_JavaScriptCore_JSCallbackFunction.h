$NetBSD: patch-Source_JavaScriptCore_ForwardingHeaders_JavaScriptCore_JSCallbackFunction.h,v 1.1 2014/08/21 04:51:08 dbj Exp $

--- Source/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JSCallbackFunction.h.orig	2015-01-23 17:43:40.000000000 +0000
+++ Source/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JSCallbackFunction.h
@@ -0,0 +1 @@
+#include <JavaScriptCore/API/JSCallbackFunction.h>
