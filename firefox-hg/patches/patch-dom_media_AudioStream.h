$NetBSD$

--- dom/media/AudioStream.h.orig	2014-10-27 20:46:32.000000000 +0000
+++ dom/media/AudioStream.h
@@ -15,10 +15,7 @@
 #include "mozilla/RefPtr.h"
 #include "mozilla/UniquePtr.h"
 #include "CubebUtils.h"
-
-namespace soundtouch {
-class SoundTouch;
-}
+#include "soundtouch/SoundTouch.h"
 
 namespace mozilla {
 
