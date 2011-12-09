$NetBSD$

To avoid redifintion of T1_EncodingType_ by:
.include "../../fonts/fontconfig/buildlink3.mk"
|
v
.include "../../graphics/freetype2/buildlink3.mk"

--- freetype/include/freetype/internal/t1types.h.orig	2011-08-05 20:12:21.000000000 +0900
+++ freetype/include/freetype/internal/t1types.h	2011-12-09 21:24:06.000000000 +0900
@@ -78,6 +78,7 @@
   } T1_EncodingRec, *T1_Encoding;
 
 
+#ifndef  __T1TABLES_H__
   typedef enum  T1_EncodingType_
   {
     T1_ENCODING_TYPE_NONE = 0,
@@ -87,6 +88,7 @@
     T1_ENCODING_TYPE_EXPERT
 
   } T1_EncodingType;
+#endif
 
 
   /* used to hold extra data of PS_FontInfoRec that
