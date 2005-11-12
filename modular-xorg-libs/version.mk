# $NetBSD: version.mk,v 1.2 2005/06/20 22:13:10 jlam Exp $
#
# This Makefile fragment is included by Makefiles that need to access
# the X11_TYPE and version number of a "modular" X.org distribution.
#
# The following variables are provided by this file:
#
#    BUILTIN_X11_TYPE.modular-xorg is the X11_TYPE of the modular X.org
#	distribution and is "modular-xorg".
#
#    BUILTIN_X11_VERSION.modular-xorg is the version number of the
#	modular X.org distribution detected on the system.
#

BUILTIN_X11_TYPE.modular-xorg=	modular-xorg
BUILTIN_X11_VERSION.modular-xorg=	7.0  ## need to do this
