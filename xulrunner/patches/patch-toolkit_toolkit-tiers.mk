$NetBSD$

--- toolkit/toolkit-tiers.mk.orig	2011-06-15 21:57:56.000000000 +0000
+++ toolkit/toolkit-tiers.mk
@@ -90,7 +90,7 @@ ifndef MOZ_NATIVE_BZ2
 tier_platform_dirs += modules/libbz2
 endif
 tier_platform_dirs += modules/libmar
-tier_platform_dirs += other-licenses/bsdiff
+#tier_platform_dirs += other-licenses/bsdiff
 endif
 
 tier_platform_dirs	+= gfx/qcms
