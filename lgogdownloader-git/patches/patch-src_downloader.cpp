$NetBSD$

Fix path to jsoncpp headers.

--- src/downloader.cpp.orig	2014-06-11 17:49:36.000000000 +0000
+++ src/downloader.cpp
@@ -20,7 +20,7 @@
 #include <boost/regex.hpp>
 #include <boost/date_time/posix_time/posix_time_types.hpp>
 #include <tinyxml.h>
-#include <jsoncpp/json/json.h>
+#include <json/json.h>
 #include <htmlcxx/html/ParserDom.h>
 #include <htmlcxx/html/Uri.h>
 
