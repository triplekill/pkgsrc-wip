$NetBSD$

isnan() and isinf() are macros on NetBSD (C99 conformant).
Use same workaround as for Mac OS X and Cygwin.

--- 3rdparty/kdchart/kdablibfakes/src/KDABLibFakes.h.orig	2013-10-12 08:17:41.000000000 +0000
+++ 3rdparty/kdchart/kdablibfakes/src/KDABLibFakes.h
@@ -52,7 +52,7 @@
 #include <float.h>
 #define ISNAN(x ) _isnan(x )
 #define ISINF(x ) (!(_finite(x ) + _isnan(x ) ) )
-#elif defined (Q_OS_DARWIN) || defined (Q_OS_CYGWIN)
+#elif defined (Q_OS_DARWIN) || defined (Q_OS_CYGWIN) || defined (Q_OS_NETBSD)
 #define ISNAN(x) std::isnan(x)
 #define ISINF(x) std::isinf(x)
 #else
