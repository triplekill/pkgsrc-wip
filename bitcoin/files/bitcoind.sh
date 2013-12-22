#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD$
#

# PROVIDE: bitcoind
# REQUIRE: DAEMON LOGIN wscons
# KEYWORD: shutdown

if [ -f /etc/rc.subr ]; then
	. /etc/rc.subr
fi

name="bitcoind"
rcvar=$name
command="@PREFIX@/sbin/bitcoind"
pidfile="@VARBASE@/run/bitcoind.pid"
required_directory="@VARBASE@/bitcoin"
command_args="-daemon -conf=@PREFIX@/etc/bitcoin.conf -pid=${pidfile} -datadir=${required_directory}"

if [ -f /etc/rc.subr ]; then
	load_rc_config $name
	run_rc_command "$1"
else
	echo -n " ${name}"
	${command} ${bitcoin_flags} ${command_args}
fi
