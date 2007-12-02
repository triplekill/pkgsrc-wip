#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD$
#

# PROVIDE: dhcpd
# REQUIRE: DAEMON
# BEFORE:  LOGIN

if [ -f /etc/rc.subr ]; then
        . /etc/rc.subr
fi

name="dhcpd"
rcvar="isc_dhcpd"
command="@PREFIX@/sbin/${name}"
pidfile="@VARBASE@/run/isc-dhcp/${name}.pid"
required_files="@PKG_SYSCONFDIR@/${name}.conf @DHCP_HOME@/${name}.leases"
start_precmd="isc_dhcpd_precmd"

isc_dhcpd_precmd()
{
	if [ ! -d @VARBASE@/run/isc-dhcp ]; then
		@MKDIR@ @VARBASE@/run/isc-dhcp
		@CHMOD@ 0770 @VARBASE@/run/isc-dhcp
	fi

	if [ ! -f @DHCP_HOME@/dhcpd.leases ]; then
		@TOUCH@ @DHCP_HOME@/dhcpd.leases
		@CHMOD@ 0640 @DHCP_HOME@/dhcpd.leases
	fi
}

load_rc_config $name
run_rc_command "$1"
