#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: dhclient,v 1.8 2002/03/22 04:33:58 thorpej Exp $
# $Id: isc_dhclient.sh,v 1.3 2005/03/03 11:02:26 hfath Exp $

# PROVIDE: dhclient
# REQUIRE: network mountcritlocal
# BEFORE:  NETWORKING
#
#	Note that there no syslog logging of dhclient messages at boot because
#	dhclient needs to start before services that syslog depends upon do.
#

if [ -f /etc/rc.subr ]; then
        . /etc/rc.subr
fi

name="dhclient"
rcvar="isc_dhclient"
command="@PREFIX@/sbin/${name}"
pidfile="@VARBASE@/run/${name}.pid"

if [ -f /etc/rc.subr -a -f /etc/rc.conf -a -f /etc/rc.d/DAEMON ]
then
	load_rc_config $name
	run_rc_command "$1"
else
	case ${1:-start} in
	start)
		if [ -x ${command} ]
		then
			@ECHO@ "Starting ${name}."
			eval ${start_precmd}
			eval ${command} ${isc_dhclient_flags} ${command_args}
		fi
		;;
	stop)
		if [ -f ${pidfile} ]; then
			pid=`@HEAD@ -1 ${pidfile}`
			@ECHO@ "Stopping ${name}."
			kill -TERM ${pid}
			@RM@ -f ${pidfile}
		else
			@ECHO@ "${name} not running?"
		fi
		;;
	restart)
		( $0 stop )
		sleep 1
		$0 start
		;;
	status)
		if [ -f ${pidfile} ]; then
			pid=`@HEAD@ -1 ${pidfile}`
			@ECHO@ "${name} is running as pid ${pid}."
		else
			@ECHO@ "${name} is not running."
		fi
		;;
	esac
fi
