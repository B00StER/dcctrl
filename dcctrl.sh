#!/bin/bash
DAEMON=/usr/bin/dogecoind
NAME=dogecoin
DESC=dogecoin
DATADIR=/usr/share/dogecoin

case "$1" in
    start)
	$DAEMON --datadir=$DATADIR -daemon
	;;	
    generate-true)
	$DAEMON --datadir=$DATADIR setgenerate true
	;;
    generate-false)
	$DAEMON --datadir=$DATADIR setgenerate false
	;;
    getinfo)
	$DAEMON --datadir=$DATADIR getinfo
	;;
    getaddress)
	$DAEMON --datadir=$DATADIR getaccountaddress ""
	;;
    send)
	$DAEMON --datadir=$DATADIR sendtoaddress $2 $3
	;;
    stop)
	$DAEMON --datadir=$DATADIR stop
	;;
	*)
        echo "Usage: $NAME {start|stop|generate-true|generate-false|getaddress|getinfo|send}" >&2
        exit 1
        ;;
esac
exit 0


