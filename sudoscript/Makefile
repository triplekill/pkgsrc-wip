# New ports collection makefile for:   sudoscript
# Date created:        17 June, 2003
# Whom:                hbo
# $Id: Makefile-in,v 1.2 2003/06/23 19:25:24 hbo Exp $
# $OpenBSD$

COMMENT=	"Audited shells with sudo(8) and script(1)"
DISTNAME=	sudoscript-2.1.1
CATEGORIES=	security

MAINTAINER=	hbo@egbok.com
HOMEPAGE=	http://www.egbok.com/sudoscript

MESSAGE_SUBST+=	DISTNAME=${DISTNAME}
MESSAGE_SUBST+=	PREFIX=${PREFIX}

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=sudoscript/} \
		http://egbok.com/sudoscript

NO_BUILD=		Yes
NO_REGRESS=		Yes
USE_GMAKE=		Yes

.include "../../mk/bsd.pkg.mk"
