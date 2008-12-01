#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD$
#
# PROVIDE: sidfilter
# REQUIRE: DAEMON

if [ -f /etc/rc.subr ]; then
	. /etc/rc.subr
fi

name="sidfilter"
rcvar=$name
command="@PREFIX@/bin/sid-filter"
pidfile="/var/run/sid-filter.pid"
command_args="-l -P ${pidfile}"

if [ -f /etc/rc.subr ]; then
        load_rc_config $name
	run_rc_command "$1"
else
	echo -n " ${name}"
	${command} ${sidfilter_flags} ${command_args}
fi
