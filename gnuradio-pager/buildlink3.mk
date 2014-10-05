# $NetBSD: buildlink3.mk,v 1.25 2013/11/20 20:04:35 adam Exp $

BUILDLINK_TREE+=	gnuradio-pager

.if !defined(GNURADIO_PAGER_BUILDLINK3_MK)
GNURADIO_PAGER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gnuradio-pager+=	gnuradio-pager>=3.7.5
BUILDLINK_ABI_DEPENDS.gnuradio-pager+=	gnuradio-pager>=3.7.5
BUILDLINK_PKGSRCDIR.gnuradio-pager?=	../../wip/gnuradio-pager

#.include "../../devel/boost-headers/buildlink3.mk"
#.include "../../devel/boost-libs/buildlink3.mk"
#.include "../../devel/cppunit/buildlink3.mk"
#.include "../../devel/swig2/buildlink3.mk"
#.include "../../lang/python/application.mk"
#.include "../../lang/python/extension.mk"
#.include "../../lang/python/pyversion.mk"
#.include "../../math/fftwf/buildlink3.mk"
#.include "../../math/gsl/buildlink3.mk"
.endif # GNURADIO_PAGER_BUILDLINK3_MK

BUILDLINK_TREE+=	-gnuradio-pager
