$NetBSD$

--- memory.c.orig	2012-06-01 09:13:13.000000000 +0000
+++ memory.c
@@ -311,7 +311,7 @@ static void memory_region_read_accessor(
     MemoryRegion *mr = opaque;
     uint64_t tmp;
 
-    tmp = mr->ops->read(mr->opaque, addr, size);
+    tmp = (*mr->ops->read)(mr->opaque, addr, size);
     *value |= (tmp & mask) << shift;
 }
 
@@ -393,12 +393,12 @@ static void memory_region_iorange_read(I
 
         *data = ((uint64_t)1 << (width * 8)) - 1;
         if (mrp) {
-            *data = mrp->read(mr->opaque, offset);
+            *data = (*mrp->read)(mr->opaque, offset);
         } else if (width == 2) {
             mrp = find_portio(mr, offset - mrio->offset, 1, false);
             assert(mrp);
-            *data = mrp->read(mr->opaque, offset) |
-                    (mrp->read(mr->opaque, offset + 1) << 8);
+            *data = (*mrp->read)(mr->opaque, offset) |
+                    ((*mrp->read)(mr->opaque, offset + 1) << 8);
         }
         return;
     }
