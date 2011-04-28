$NetBSD$

--- skia/ext/bitmap_platform_device_data.h.orig	2011-04-13 08:01:18.000000000 +0000
+++ skia/ext/bitmap_platform_device_data.h
@@ -12,7 +12,8 @@ namespace skia {
 class BitmapPlatformDevice::BitmapPlatformDeviceData :
 #if defined(WIN32) || defined(__APPLE__)
     public SkRefCnt {
-#elif defined(__linux__) || defined(__FreeBSD__) || defined(__OpenBSD__)
+#elif defined(__linux__) || defined(__DragonFly__) || defined(__FreeBSD__) || \
+      defined(__NetBSD__) || defined(__OpenBSD__)
     // These objects are reference counted and own a Cairo surface. The surface
     // is the backing store for a Skia bitmap and we reference count it so that
     // we can copy BitmapPlatformDevice objects without having to copy all the
@@ -25,13 +26,15 @@ class BitmapPlatformDevice::BitmapPlatfo
   typedef HBITMAP PlatformContext;
 #elif defined(__APPLE__)
   typedef CGContextRef PlatformContext;
-#elif defined(__linux__) || defined(__FreeBSD__) || defined(__OpenBSD__)
+#elif defined(__linux__) || defined(__DragonFly__) || defined(__FreeBSD__) || \
+      defined(__NetBSD__) || defined(__OpenBSD__)
   typedef cairo_t* PlatformContext;
 #endif
 
 #if defined(WIN32) || defined(__APPLE__)
   explicit BitmapPlatformDeviceData(PlatformContext bitmap);
-#elif defined(__linux__) || defined(__FreeBSD__) || defined(__OpenBSD__)
+#elif defined(__linux__) || defined(__DragonFly__) || defined(__FreeBSD__) || \
+      defined(__NetBSD__) || defined(__OpenBSD__)
   explicit BitmapPlatformDeviceData(cairo_surface_t* surface);
 #endif
 
@@ -68,7 +71,8 @@ class BitmapPlatformDevice::BitmapPlatfo
   }
 
  private:
-#if defined(__linux__) || defined(__FreeBSD__) || defined(__OpenBSD__)
+#if defined(__linux__) || defined(__DragonFly__) || defined(__FreeBSD__) || \
+    defined(__NetBSD__) || defined(__OpenBSD__)
   friend class base::RefCounted<BitmapPlatformDeviceData>;
 #endif
   virtual ~BitmapPlatformDeviceData();
@@ -79,7 +83,8 @@ class BitmapPlatformDevice::BitmapPlatfo
 #if defined(WIN32)
   // Lazily-created DC used to draw into the bitmap, see GetBitmapDC().
   HDC hdc_;
-#elif defined(__linux__) || defined(__FreeBSD__) || defined(__OpenBSD__)
+#elif defined(__linux__) || defined(__DragonFly__) || defined(__FreeBSD__) || \
+      defined(__NetBSD__) || defined(__OpenBSD__)
   cairo_surface_t *const surface_;
 #endif
 
