$NetBSD: patch-src_pkcs11_pkcs11-global.c,v 1.2 2012/11/30 14:44:35 gdt Exp $

Use correct size for malloc.

Not yet reported upstream.

--- src/pkcs11/pkcs11-global.c.orig	2014-02-21 12:09:57.000000000 +0000
+++ src/pkcs11/pkcs11-global.c
@@ -42,7 +42,7 @@ extern CK_FUNCTION_LIST pkcs11_function_
 #include <pthread.h>
 CK_RV mutex_create(void **mutex)
 {
-	pthread_mutex_t *m = calloc(1, sizeof(*mutex));
+	pthread_mutex_t *m = calloc(1, sizeof(*m));
 	if (m == NULL)
 		return CKR_GENERAL_ERROR;;
 	pthread_mutex_init(m, NULL);
