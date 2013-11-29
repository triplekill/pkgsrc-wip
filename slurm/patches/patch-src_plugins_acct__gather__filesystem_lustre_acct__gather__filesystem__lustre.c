$NetBSD$

--- src/plugins/acct_gather_filesystem/lustre/acct_gather_filesystem_lustre.c.orig	2013-11-04 21:19:15.000000000 +0000
+++ src/plugins/acct_gather_filesystem/lustre/acct_gather_filesystem_lustre.c
@@ -49,6 +49,9 @@
 #include <getopt.h>
 #include <netinet/in.h>
 
+#if defined(__NetBSD__)
+#include <limits.h>	/* PATH_MAX */
+#endif
 
 #include "src/common/slurm_xlator.h"
 #include "src/common/slurm_acct_gather_filesystem.h"
