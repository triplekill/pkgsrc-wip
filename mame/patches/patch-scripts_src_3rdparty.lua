$NetBSD$

Add NetBSD "support" for portmidi.

--- scripts/src/3rdparty.lua.orig	2015-06-24 09:53:30.000000000 +0000
+++ scripts/src/3rdparty.lua
@@ -534,6 +534,13 @@ project "portmidi"
 			MAME_DIR .. "3rdparty/portmidi/porttime/ptlinux.c",
 		}
 	end
+	if _OPTIONS["targetos"]=="netbsd" then
+		files {
+			MAME_DIR .. "3rdparty/portmidi/pm_linux/pmlinux.c",
+			MAME_DIR .. "3rdparty/portmidi/pm_linux/finddefault.c",
+			MAME_DIR .. "3rdparty/portmidi/porttime/ptlinux.c",
+		}
+	end
 	if _OPTIONS["targetos"]=="macosx" then
 		files {
 			MAME_DIR .. "3rdparty/portmidi/pm_mac/pmmac.c",
