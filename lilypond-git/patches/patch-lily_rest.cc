$NetBSD$

--- lily/rest.cc.orig	2013-11-12 11:12:50.000000000 +0000
+++ lily/rest.cc
@@ -217,7 +217,7 @@ Rest::glyph_name (Grob *me, int durlog, 
       actual_style = "";
     }
 
-  return ("rests." + to_string (durlog) + (is_ledgered ? "o" : "")
+  return ("rests." + ::to_string (durlog) + (is_ledgered ? "o" : "")
           + actual_style);
 }
 
