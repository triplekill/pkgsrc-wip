$NetBSD: patch-solenv_gbuild_Module.mk,v 1.1 2012/08/12 07:09:20 marino Exp $

Disable unit testing

Some of the libreoffice unit tests, for example system fonts, require
additional and currently unidentified dependencies to run.  As a
result, Libreoffice will build outside a clean environment but fails
to build in pbulk chroot or Tinderbox.

--- solenv/gbuild/Module.mk.orig	2012-08-07 13:32:53.000000000 +0000
+++ solenv/gbuild/Module.mk
@@ -119,7 +119,7 @@ gb_Module_DEVINSTALLHINT=
 debugrun :| build
 endif
 
-all : build unitcheck
+all : build
 	$(info $(gb_Module_BUILDHINT))
 
 build : 
