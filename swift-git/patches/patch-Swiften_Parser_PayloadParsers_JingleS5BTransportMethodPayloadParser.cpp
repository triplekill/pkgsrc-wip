$NetBSD$

Make cerr a member of std.

--- Swiften/Parser/PayloadParsers/JingleS5BTransportMethodPayloadParser.cpp.orig	2014-08-18 06:33:47.000000000 +0000
+++ Swiften/Parser/PayloadParsers/JingleS5BTransportMethodPayloadParser.cpp
@@ -7,6 +7,8 @@
 #include <boost/lexical_cast.hpp>
 #include <boost/optional.hpp>
 
+#include <iostream>
+
 #include "JingleS5BTransportMethodPayloadParser.h"
 
 #include <Swiften/Base/Log.h>
