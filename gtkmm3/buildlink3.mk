# $NetBSD$

BUILDLINK_TREE+=	gtkmm3

.if !defined(GTKMM3_BUILDLINK3_MK)
GTKMM3_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gtkmm3+=	gtkmm3>=3.4.2
BUILDLINK_PKGSRCDIR.gtkmm3?=	../../wip/gtkmm3

.include "../../textproc/libxslt/buildlink3.mk"
.include "../../devel/atkmm/buildlink3.mk"
.include "../../graphics/cairomm/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../devel/pangomm/buildlink3.mk"
.include "../../devel/glibmm/buildlink3.mk"
.endif	# GTKMM3_BUILDLINK3_MK

BUILDLINK_TREE+=	-gtkmm3
