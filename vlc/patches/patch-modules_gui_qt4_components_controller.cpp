$NetBSD$

--- modules/gui/qt4/components/controller.cpp.orig	2015-01-28 16:37:58.000000000 +0000
+++ modules/gui/qt4/components/controller.cpp
@@ -353,8 +353,8 @@ QWidget *AbstractController::createWidge
         slider->setChapters( chapters );
 
         /* Update the position when the IM has changed */
-        CONNECT( THEMIM->getIM(), positionUpdated( float, int64_t, int ),
-                slider, setPosition( float, int64_t, int ) );
+        CONNECT( THEMIM->getIM(), positionUpdated( float, putime_t, int ),
+                slider, setPosition( float, putime_t, int ) );
         /* And update the IM, when the position has changed */
         CONNECT( slider, sliderDragged( float ),
                  THEMIM->getIM(), sliderUpdate( float ) );
