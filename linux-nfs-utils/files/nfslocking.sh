#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: nfslocking,v 1.6 2002/03/24 15:52:41 lukem Exp $
#

# todo: not tested yet

# PROVIDE: nfslocking
# REQUIRE: nfsd
# BEFORE:  DAEMON

. /etc/rc.subr

arg=$1

start_precmd='checkyesno nfs_server || checkyesno nfs_client ||
		[ -n "$rc_force" ]'
stop_precmd=$start_precmd
status_precmd=$start_precmd

name="statd"
rcvar=$name
command="@PREFIX@/sbin/rpc.${name}"
load_rc_config $name
run_rc_command "$arg"

name="lockd"
rcvar=$name
command="@PREFIX@/rpc.${name}"
load_rc_config $name
run_rc_command "$arg"
