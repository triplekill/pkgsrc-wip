$NetBSD$

 Don't install bash completion files since they install outside 
 localbase. 

--- src/install.pri.orig	2014-04-18 14:12:04.000000000 +0000
+++ src/install.pri
@@ -41,11 +41,11 @@ mac {
     ico256.files = $$PWD/../linux/hicolor/256x256/apps/qupzilla.png
     ico256.path = $$hicolor_folder/256x256/apps
 
-    bashcompletion.files = $$PWD/../linux/completion/qupzilla
-    bashcompletion.path = /usr/share/bash-completion/completions
+#    bashcompletion.files = $$PWD/../linux/completion/qupzilla
+#    bashcompletion.path = /usr/share/bash-completion/completions
 
 
     INSTALLS += target target1 target2 target3
     INSTALLS += ico16 ico32 ico48 ico64 ico128 ico256
-    INSTALLS += bashcompletion
+#    INSTALLS += bashcompletion
 }
