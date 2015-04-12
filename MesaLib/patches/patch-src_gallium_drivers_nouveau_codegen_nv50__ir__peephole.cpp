$NetBSD$

The C99 "restrict" keyword is not valid in C++, but most compilers will
understand __restrict.

--- src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp.orig	2015-03-28 18:20:39.000000000 +0000
+++ src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -1530,7 +1530,7 @@ private:
 
    bool replaceLdFromLd(Instruction *ld, Record *ldRec);
    bool replaceLdFromSt(Instruction *ld, Record *stRec);
-   bool replaceStFromSt(Instruction *restrict st, Record *stRec);
+   bool replaceStFromSt(Instruction *__restrict st, Record *stRec);
 
    void addRecord(Instruction *ldst);
    void purgeRecords(Instruction *const st, DataFile);
@@ -1817,7 +1817,7 @@ MemoryOpt::replaceLdFromLd(Instruction *
 }
 
 bool
-MemoryOpt::replaceStFromSt(Instruction *restrict st, Record *rec)
+MemoryOpt::replaceStFromSt(Instruction *__restrict st, Record *rec)
 {
    const Instruction *const ri = rec->insn;
    Value *extra[3];
