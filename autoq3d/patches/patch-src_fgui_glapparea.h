$NetBSD$

Needs gluPickMatrix.

--- src/fgui/glapparea.h.orig	2010-06-06 19:52:28.000000000 +0000
+++ src/fgui/glapparea.h
@@ -22,6 +22,7 @@
 
 #ifndef GLAPPAREA_H
 #define GLAPPAREA_H
+#include <GL/glu.h>
 #include <QLayout>
 #include <QGLWidget>
 #include <QMouseEvent>
