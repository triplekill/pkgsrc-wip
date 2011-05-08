#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD$
#
# PROVIDE: quickml
# REQUIRE: LOGIN
#
# Add the following lines to /etc/rc.conf to enable this service:
#
# quickml=YES

. /etc/rc.subr

name="quickml"
rcvar=$name
command="@PREFIX@/sbin/${name}"
command_interpreter="@RUBY@"
pidfile="@VARBASE@/run/${name}.pid"

load_rc_config ${name}
run_rc_command "$1"
