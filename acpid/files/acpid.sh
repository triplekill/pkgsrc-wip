#!/bin/sh
#
# $NetBSD$
#

# PROVIDE: acpid
# REQUIRE: DAEMON

. /etc/rc.subr

name="acpid"
rcvar=$name
command="@PREFIX@/sbin/${name}"
command_args="-c @PKG_SYSCONFDIR@/acpid/"

load_rc_config $name
run_rc_command "$1"
