#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD$
#

# PROVIDE: jabberd
# REQUIRE: DAEMON LOGIN

. /etc/rc.subr

name="jabberd"
rcvar=$name
command="@PREFIX@/bin/${name}"
command_args="-D"
required_files="@PKG_SYSCONFDIR@/jabberd.cfg"
jabberd_user="@JABBERD_USER@"

load_rc_config $name
run_rc_command "$1"
