# $NetBSD: dist.mk,v 1.1.1.1 2011/06/17 00:10:19 reed Exp $

PY_DISTVERSION=	3.2.3
DISTNAME=	Python-${PY_DISTVERSION}
EXTRACT_SUFX=	.tar.bz2
DISTINFO_FILE=	${.CURDIR}/../../wip/python32/distinfo
PATCHDIR=	${.CURDIR}/../../wip/python32/patches
MASTER_SITES=	http://www.python.org/ftp/python/${PY_DISTVERSION:C/rc[0-9]*$//}/
