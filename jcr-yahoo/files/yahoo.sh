#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: muc.sh,v 1.2 2004/07/08 22:26:04 abs Exp $
#
# PROVIDE: muc
# REQUIRE: DAEMON

if [ -f /etc/rc.subr ]; then
	. /etc/rc.subr
fi

name="yahoo"
rcvar=$name
command="@PREFIX@/bin/yahoo-transport"
required_files="@PKG_SYSCONFDIR@/${name}-jcr.xml"
extra_commands="reload"
yahoo_user="@JABBERD_USER@"
command_args="-c ${required_files} > /dev/null 2>&1 &"
pidfile="@JABBERD_PIDDIR@/`basename ${command}`.pid"
stop_postcmd="remove_pidfile"
start_precmd="ensure_piddir"

ensure_piddir()
{
	mkdir -p @JABBERD_PIDDIR@
	chown @JABBERD_USER@ @JABBERD_PIDDIR@
}

remove_pidfile()
{
        if [ -f $pidfile ]; then
            rm -f $pidfile
        fi
}

if [ -f /etc/rc.subr ]; then
	load_rc_config $name
	run_rc_command "$1"
else
	@ECHO@ -n " ${name}"
	${command} ${yahoo_flags} ${command_args}
fi
