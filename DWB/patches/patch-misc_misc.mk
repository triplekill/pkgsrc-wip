$NetBSD$

Propagate make error

--- misc/misc.mk.orig	2015-05-18 16:19:28.000000000 +0200
+++ misc/misc.mk	2015-05-18 16:19:39.000000000 +0200
@@ -85,7 +85,7 @@
 	if [ -d $@ -a -f $@/$@.mk ]; then \
 	    cd $@; \
 	    echo "---- Making $(ACTION) in directory $(CURRENTDIR)/$@ ----"; \
-	    $(MAKE) -e -f $@.mk MAKE=$(MAKE) $(ACTION); \
+	    $(MAKE) -e -f $@.mk MAKE=$(MAKE) $(ACTION) && \
 	    echo; \
 	fi
 
