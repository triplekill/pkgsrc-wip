$NetBSD$

--- modules/gui/qt4/input_manager.cpp.orig	2015-04-12 21:29:20.000000000 +0000
+++ modules/gui/qt4/input_manager.cpp
@@ -446,7 +446,7 @@ void InputManager::UpdatePosition()
 {
     /* Update position */
     int i_length;
-    int64_t i_time;
+    putime_t i_time;
     float f_pos;
     i_length = var_GetTime(  p_input , "length" ) / CLOCK_FREQ;
     i_time = var_GetTime(  p_input , "time");
@@ -981,21 +981,21 @@ void InputManager::setAtoB()
     {
         timeB = var_GetTime( THEMIM->getInput(), "time"  );
         var_SetTime( THEMIM->getInput(), "time" , timeA );
-        CONNECT( this, positionUpdated( float, int64_t, int ),
-                 this, AtoBLoop( float, int64_t, int ) );
+        CONNECT( this, positionUpdated( float, putime_t, int ),
+                 this, AtoBLoop( float, putime_t, int ) );
     }
     else
     {
         timeA = 0;
         timeB = 0;
-        disconnect( this, SIGNAL( positionUpdated( float, int64_t, int ) ),
-                    this, SLOT( AtoBLoop( float, int64_t, int ) ) );
+        disconnect( this, SIGNAL( positionUpdated( float, putime_t, int ) ),
+                    this, SLOT( AtoBLoop( float, putime_t, int ) ) );
     }
     emit AtoBchanged( (timeA != 0 ), (timeB != 0 ) );
 }
 
 /* Function called regularly when in an AtoB loop */
-void InputManager::AtoBLoop( float, int64_t i_time, int )
+void InputManager::AtoBLoop( float, putime_t i_time, int )
 {
     if( timeB && i_time >= timeB )
         var_SetTime( THEMIM->getInput(), "time" , timeA );
