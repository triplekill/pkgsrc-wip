# $NetBSD: buildlink3.mk,v 1.1.1.1 2010/03/15 18:34:37 asau Exp $

BUILDLINK_TREE+=	avr-binutils

.if !defined(AVR_BINUTILS_BUILDLINK3_MK)
AVR_BINUTILS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.avr-binutils+=	avr-binutils>=2.22
BUILDLINK_PKGSRCDIR.avr-binutils?=		../../wip/avr-binutils
#BUILDLINK_FNAME_TRANSFORM.avr-binutils+=	-e "s,${AVR_TARGET}/lib,lib/,g"

.endif # AVR_BINUTILS_BUILDLINK3_MK

BUILDLINK_TREE+=	-avr-binutils
