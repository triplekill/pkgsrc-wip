$NetBSD$

NetBSD's curses are good enough, use portable header file name.

--- src/conky.c.orig	2010-10-05 21:29:36.000000000 +0000
+++ src/conky.c
@@ -65,7 +65,7 @@
 #include <fcntl.h>
 #include <getopt.h>
 #ifdef NCURSES
-#include <ncurses.h>
+#include <curses.h>
 #endif
 #ifdef XOAP
 #include <libxml/parser.h>
