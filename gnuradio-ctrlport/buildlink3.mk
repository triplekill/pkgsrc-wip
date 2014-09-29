# $NetBSD$

BUILDLINK_TREE+=	gnuradio-dtv

.if !defined(GNURADIO_DTV_BUILDLINK3_MK)
GNURADIO_DTV_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gnuradio-dtv+=	gnuradio-dtv>=3.7.5
BUILDLINK_ABI_DEPENDS.gnuradio-dtv+=	gnuradio-dtv>=3.7.5
BUILDLINK_PKGSRCDIR.gnuradio-dtv?=	../../wip/gnuradio-dtv
.endif # GNURADIO_DTV_BUILDLINK3_MK

BUILDLINK_TREE+=	-gnuradio-dtv
