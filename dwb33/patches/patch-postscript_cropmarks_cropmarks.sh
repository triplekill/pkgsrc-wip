$NetBSD$

Make executeable

--- postscript/cropmarks/cropmarks.sh.orig	2015-05-19 16:13:55.000000000 +0200
+++ postscript/cropmarks/cropmarks.sh	2015-05-19 16:14:06.000000000 +0200
@@ -1,3 +1,4 @@
+#!/bin/sh
 #
 # Center pages and put cropmarks at each corner. Physical page size
 # is set with -w and -h. The default is 8.5 by 11.0 inches. Device
