$NetBSD$

--- remoting/base/compound_buffer.cc.orig	2011-04-13 08:01:07.000000000 +0000
+++ remoting/base/compound_buffer.cc
@@ -270,7 +270,7 @@ bool CompoundBufferInputStream::Skip(int
   return count == 0;
 }
 
-int64 CompoundBufferInputStream::ByteCount() const {
+int64_t CompoundBufferInputStream::ByteCount() const {
   return position_;
 }
 
