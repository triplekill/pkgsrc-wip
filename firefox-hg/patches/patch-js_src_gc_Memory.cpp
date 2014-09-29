$NetBSD: patch-js_src_gc_Memory.cpp,v 1.1 2014/04/10 07:33:59 martin Exp $

Make sure mmap() delivers memory with upper 17 bits clear on sparc64 on NetBSD:
with topdown-vm we would map in the last 4 gig of the address space (past
the VA hole) otherwise by default, thus busting the JSValue restrictions.

https://bugzilla.mozilla.org/show_bug.cgi?id=994133


--- js/src/gc/Memory.cpp.orig	2014-09-28 08:30:06.000000000 +0000
+++ js/src/gc/Memory.cpp
@@ -406,7 +406,7 @@ static inline void *
 MapMemory(size_t length, int prot = PROT_READ | PROT_WRITE,
           int flags = MAP_PRIVATE | MAP_ANON, int fd = -1, off_t offset = 0)
 {
-#if defined(__ia64__)
+#if defined(__ia64__) || (defined(__sparc64__) && defined(__NetBSD__))
     /*
      * The JS engine assumes that all allocated pointers have their high 17 bits clear,
      * which ia64's mmap doesn't support directly. However, we can emulate it by passing
