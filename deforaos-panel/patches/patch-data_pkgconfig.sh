$NetBSD: patch-data_pkgconfig.sh,v 1.1 2014/03/21 14:38:01 jperkin Exp $

Use correct rpath flag on SunOS.

--- data/pkgconfig.sh.orig	2014-04-23 15:37:45.000000000 +0000
+++ data/pkgconfig.sh
@@ -129,9 +129,12 @@ while [ $# -gt 0 ]; do
 	if [ "$PREFIX" != "/usr" ]; then
 		RPATH="-Wl,-rpath-link,\${libdir} -Wl,-rpath,\${libdir}"
 		case $(uname -s) in
-			Darwin|SunOS)
+			Darwin)
 				RPATH="-Wl,-rpath,\${libdir}"
 				;;
+			SunOS)
+				RPATH="-Wl,-R\${libdir}"
+				;;
 		esac
 	fi
 
