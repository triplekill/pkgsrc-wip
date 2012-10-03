$NetBSD$

Adds NetBSD support.

--- src/SFML/Window/VideoModeSupport.hpp.orig	2010-01-27 14:00:37.000000000 +0000
+++ src/SFML/Window/VideoModeSupport.hpp
@@ -35,7 +35,7 @@
 
     #include <SFML/Window/Win32/VideoModeSupport.hpp>
 
-#elif defined(SFML_SYSTEM_LINUX) || defined(SFML_SYSTEM_FREEBSD)
+#elif defined(SFML_SYSTEM_LINUX) || defined(SFML_SYSTEM_FREEBSD) || defined(SFML_SYSTEM_NETBSD)
 
     #include <SFML/Window/Linux/VideoModeSupport.hpp>
 
