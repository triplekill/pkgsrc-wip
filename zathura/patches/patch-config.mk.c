$NetBSD$

--- config.mk.orig	2011-07-12 22:09:25.000000000 +0000
+++ config.mk
@@ -4,7 +4,7 @@
 VERSION = 0.0.8.4
 
 # paths
-PREFIX ?= /usr
+PREFIX ?= ${PREFIX}
-MANPREFIX ?= ${PREFIX}/share/man
+MANPREFIX ?= ${PREFIX}/man
 DESKTOPPREFIX ?= ${PREFIX}/share/applications
