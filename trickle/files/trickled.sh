#!/bin/sh
# $Id$
# $NetBSD$
#

# PROVIDE: trickled
# REQUIRE: DAEMON

. /etc/rc.subr

name="trickled"
rcvar=$name
command="@PREFIX@/sbin/${name}"
pidfile="/var/run/${name}.pid"
required_files="@PKG_SYSCONFDIR@/trickled.conf"

load_rc_config $name
run_rc_command "$1"
