$NetBSD$

Make cerr a member of std.

--- Swiften/FileTransfer/IBBReceiveSession.cpp.orig	2014-08-18 06:33:47.000000000 +0000
+++ Swiften/FileTransfer/IBBReceiveSession.cpp
@@ -15,6 +15,7 @@
 #include <Swiften/Queries/SetResponder.h>
 
 #include <cassert>
+#include <iostream>
 
 namespace Swift {
 
