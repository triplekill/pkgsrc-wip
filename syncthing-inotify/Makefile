# $NetBSD$

DISTNAME=	syncthing-inotify-0.6
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=syncthing/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/syncthing/syncthing-inotify
COMMENT=	Inotify file watcher intended for use with Syncthing
LICENSE=	mpl-2.0

BUILD_DEPENDS+=	go-[0-9]*:../../lang/go

DEPENDS+=	syncthing>=0.11.0:../../wip/syncthing

MAKE_ENV+=	GOPATH=${PREFIX}/gopkg

INSTALLATION_DIRS=	bin

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${PREFIX}/bin/go build

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${DISTNAME}\
		${DESTDIR}${PREFIX}/bin/${PKGBASE}

.include "../../wip/go-backoff/buildlink3.mk"
.include "../../wip/go-notify/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
