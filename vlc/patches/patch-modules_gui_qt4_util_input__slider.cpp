$NetBSD$

--- modules/gui/qt4/util/input_slider.cpp.orig	2014-08-14 07:20:12.000000000 +0000
+++ modules/gui/qt4/util/input_slider.cpp
@@ -164,7 +164,7 @@ void SeekSlider::setChapters( SeekPoints
  * \param time Elapsed time. Unused
  * \param legnth Duration time.
  ***/
-void SeekSlider::setPosition( float pos, int64_t time, int length )
+void SeekSlider::setPosition( float pos, putime_t time, int length )
 {
     VLC_UNUSED(time);
     if( pos == -1.0 )
