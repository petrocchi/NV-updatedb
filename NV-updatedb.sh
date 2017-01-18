#!/bin/bash

# NV-updatedb.sh
#
# DATE:		21/12/2016
# AUTHOR:	Luca Petrocchi
# EMAIL:	petrocchi@myoffset.me
# WEBSITE	https://myoffset.me/
# URL:		https://github.com/petrocchi
#
# DESCRIPTION:
# Script for fast update the databases used from Nmap NSE Vulscan 2.0
#
# CONFIGURE:
# Configure your nmap path in NMAPPATH
#
# USAGE:
# ./NV-updatedb.sh


# PATH NMAP
NMAPPATH=/usr/share/nmap/scripts/vulscan/

DBSITE[0]="http://www.computec.ch/projekte/vulscan/download/cve.csv"
DBSITE[1]="http://www.computec.ch/projekte/vulscan/download/exploitdb.csv"
DBSITE[2]="http://www.computec.ch/projekte/vulscan/download/openvas.csv"
DBSITE[3]="http://www.computec.ch/projekte/vulscan/download/osvdb.csv"
DBSITE[4]="http://www.computec.ch/projekte/vulscan/download/scipvuldb.csv"
DBSITE[5]="http://www.computec.ch/projekte/vulscan/download/securityfocus.csv"
DBSITE[6]="http://www.computec.ch/projekte/vulscan/download/securitytracker.csv"
DBSITE[7]="http://www.computec.ch/projekte/vulscan/download/xforce.csv"

echo -en "[+] Updatedb... ($NMAPPATH)\n\n"

CONT=0

# Did you have the permission for write in this path?
if [ ! -w $NMAPPATH ]; then
	echo -en "[!] cannot write '$NMAPPATH': Permission denied\n[!] The databaseS is NOT update!\n\n"
	exit 1
fi

until [ $CONT -eq ${#DBSITE[*]} ]; do

	DBNAME=$(basename ${DBSITE[$CONT]})
	DBPATH=$NMAPPATH$DBNAME

	LASTUPDATE=$(curl -sI ${DBSITE[$CONT]} | grep Last-Modified | awk '{ print $3, $4, $5, $6 }')
	echo -en "[$(( $CONT + 1 )) of ${#DBSITE[*]}] $DBNAME Remote DB last update: $LASTUPDATE\n"

	# if fileDB don't exist, I create it.
	if [ ! -e $DBPATH ]; then
		curl -# ${DBSITE[$CONT]} > $DBPATH
	else
		DBR=$(curl -sI ${DBSITE[$CONT]} | grep Content-Length | awk '{print $2}')
		DBL=$(stat -c%s $DBPATH)

		if [ ${DBR:0:-1} -ne $DBL ]; then
			curl -# ${DBSITE[$CONT]} > $DBPATH
		else
			LOCALLASTUPDATE=$(stat -c%y $DBPATH | awk -F '[.]' '{ print $1 }')
			echo -en "[+] $DBNAME is already updated from $LOCALLASTUPDATE\n"
		fi
	fi

	(( CONT++ ))
done

echo -en "\n[+] The databaseS is update!\n\n"

