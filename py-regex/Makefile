# $NetBSD$

DISTNAME=	regex-2015.06.14
PKGNAME=	${PYPKGPREFIX}-regex-20150614
CATEGORIES=	textproc
MASTER_SITES=	https://pypi.python.org/packages/source/r/regex/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://code.google.com/p/mrab-regex-hg
COMMENT=	Alternative regular expression module, to replace re
LICENSE=	python-software-foundation

PYTHON_VERSIONS_ACCEPTED= 34 33 27
PYDISTUTILSPKG=	yes

do-test:
	${RUN} cd ${WRKSRC}/Python2; ${SETENV} ${TEST_ENV} ${PYTHONBIN} test_regex.py

.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
