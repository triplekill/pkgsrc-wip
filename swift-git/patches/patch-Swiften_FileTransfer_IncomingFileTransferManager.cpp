$NetBSD$

Make cerr a member of std.

--- Swiften/FileTransfer/IncomingFileTransferManager.cpp.orig	2014-08-18 06:33:47.000000000 +0000
+++ Swiften/FileTransfer/IncomingFileTransferManager.cpp
@@ -16,6 +16,8 @@
 #include <Swiften/Jingle/Jingle.h>
 #include <Swiften/FileTransfer/IncomingJingleFileTransfer.h>
 
+#include <iostream>
+
 namespace Swift {
 
 IncomingFileTransferManager::IncomingFileTransferManager(
