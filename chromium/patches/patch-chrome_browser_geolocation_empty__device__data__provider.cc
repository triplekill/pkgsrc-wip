$NetBSD$

--- chrome/browser/geolocation/empty_device_data_provider.cc.orig	2011-04-13 08:01:43.000000000 +0000
+++ chrome/browser/geolocation/empty_device_data_provider.cc
@@ -12,7 +12,7 @@ RadioDataProviderImplBase* RadioDataProv
 }
 
 // Only define for platforms that lack a real wifi data provider.
-#if !defined(OS_WIN) && !defined(OS_MACOSX) && !defined(OS_LINUX)
+#if !defined(OS_WIN) && !defined(OS_MACOSX) && !defined(OS_LINUX) && !defined(OS_BSD)
 // static
 template<>
 WifiDataProviderImplBase* WifiDataProvider::DefaultFactoryFunction() {
