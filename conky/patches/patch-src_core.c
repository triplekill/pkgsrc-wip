$NetBSD$

NetBSD's curses are good enough, use portable header file name.

--- src/core.c.orig	2010-10-05 21:29:36.000000000 +0000
+++ src/core.c
@@ -65,7 +65,7 @@
 #include "top.h"
 
 #ifdef NCURSES
-#include <ncurses.h>
+#include <curses.h>
 #endif
 
 /* check for OS and include appropriate headers */
