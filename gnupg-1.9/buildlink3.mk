# $NetBSD$
#
# This Makefile fragment is included by packages that use libgcrypt.
#
# This file was created automatically using createbuildlink-3.1.
#
BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH}+
GNUPG-1.9_BUILDLINK3_MK:=   ${GNUPG-1.9_BUILDLINK3_MK}+
 
.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=   gnupg-1.9
.endif
 
.if !empty(GNUPG-1.9_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.gnupg-1.9?=       gnupg-1.9-lib>=1.9.5
BUILDLINK_RECOMMENDED.gnupg-1.9?=   gnupg-1.9-lib>=1.9.5
BUILDLINK_PKGSRCDIR.gnupg-1.9?=     ../../wip/gnupg-1.9
BUILDLINK_PACKAGES+=          gnupg-1.9
 
.  include "../../security/libgcrypt/buildlink3.mk"
.  include "../libassuan/buildlink3.mk"
.  include "../../security/libksba/buildlink3.mk"
.  include "../../security/libgpg-error/buildlink3.mk"
.endif # GNUPG-1.9_BUILDLINK3_MK
 
BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
