# $NetBSD$

#
# Can't figure out why the kruler build is prefering the below file
# rather than the one generated in _KDE_build/kruler so for the 
# time being just get rid of it.
#

post-configure:
	rm ${BUILDLINK_DIR}/include/kruler.h
