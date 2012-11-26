$NetBSD$

Fix toolchain debug adapter building by using gnu make.

--- src/plugins/qt4projectmanager/qt4buildconfiguration.cpp.orig	2012-08-08 13:47:06.000000000 +0000
+++ src/plugins/qt4projectmanager/qt4buildconfiguration.cpp
@@ -308,7 +308,7 @@ void Qt4BuildConfiguration::setShadowBui
 QString Qt4BuildConfiguration::makeCommand() const
 {
     ToolChain *tc = toolChain();
-    return tc ? tc->makeCommand() : QLatin1String("make");
+    return tc ? tc->makeCommand() : QLatin1String("gmake");
 }
 
 static inline QString symbianMakeTarget(QtSupport::BaseQtVersion::QmakeBuildConfigs buildConfig,
