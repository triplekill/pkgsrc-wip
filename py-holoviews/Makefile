# $NetBSD$

DISTNAME=	holoviews-1.3.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	cad
MASTER_SITES=	https://pypi.python.org/packages/source/h/holoviews/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://ioam.github.com/holoviews/
COMMENT=	Declarative data structures for building complex visualizations
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-param>=1.3.2:../../wip/py-param

USE_LANGUAGES=	# none

PYTHON_VERSIONS_ACCEPTED= 34 33 27

.include "../../lang/python/egg.mk"
.include "../../math/py-numpy/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
