$NetBSD$

--- src/bundles.cpp.orig	2014-05-29 14:45:27.000000000 +0000
+++ src/bundles.cpp
@@ -698,7 +698,7 @@ double BundleFactory::next_valid_alignme
         if (!_hit_fac->get_hit_from_buf(hit_buf, tmp, false))
             continue;
         
-		if (tmp.ref_id() == 12638153115695167477)  // corresponds to SAM "*" under FNV hash. unaligned read record 
+		if (tmp.ref_id() == 12638153115695167477ULL)  // corresponds to SAM "*" under FNV hash. unaligned read record 
             continue;
         
 		raw_mass += tmp.mass();
