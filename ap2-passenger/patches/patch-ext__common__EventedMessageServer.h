$NetBSD$

Typo in macro.
--- ext/common/EventedMessageServer.h.orig	2011-11-28 11:51:11.000000000 +0000
+++ ext/common/EventedMessageServer.h
@@ -29,7 +29,7 @@
 #include <ev++.h>
 #include <cstdarg>
 #include <cstdlib>
-#ifdef HAS_ALLOCA_H_
+#ifdef HAS_ALLOCA_H
 	#include <alloca.h>
 #endif
 #include "EventedServer.h"
