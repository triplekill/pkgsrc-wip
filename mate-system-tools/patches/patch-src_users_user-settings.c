$NetBSD$

* treat NetBSD same as FreeBSD

--- src/users/user-settings.c.orig	2013-08-02 21:10:56.000000000 +0000
+++ src/users/user-settings.c
@@ -267,7 +267,7 @@ static void
 set_login_length (GtkWidget *entry)
 {
 	gint max_len;
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__NetBSD__)
 	max_len = UT_NAMESIZE;
 #else
 	struct utmp ut;
