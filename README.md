# NV-updatedb
Script for fast update the databases used from Nmap NSE Vulscan 2.0

This script checks if the local database is updated, if isnt, update it, otherwise go to the next.

# CONFIGURE:
If your path of vulscan.nse is different of /usr/share/nmap/scripts/vulscan/
Edit NV-updatedb.sh and change your path.

NMAPPATH=/usr/share/nmap/scripts/vulscan/

# USE:
bar@kali:~$ sudo ./NV-updatedb.sh
[+] Updatedb... (/usr/share/nmap/scripts/vulscan/)

[1 of 8] cve.csv Remote DB last update: 14 Aug 2013 09:30:11
######################################################################## 100.0%
[2 of 8] exploitdb.csv Remote DB last update: 24 Jan 2014 11:56:54
######################################################################## 100.0%
[3 of 8] openvas.csv Remote DB last update: 14 Aug 2013 09:18:05
######################################################################## 100.0%
[4 of 8] osvdb.csv Remote DB last update: 14 Aug 2013 09:04:41
######################################################################## 100.0%
[5 of 8] scipvuldb.csv Remote DB last update: 22 Dec 2016 11:23:15
######################################################################## 100.0%
[6 of 8] securityfocus.csv Remote DB last update: 10 Mar 2014 22:03:30
######################################################################## 100.0%
[7 of 8] securitytracker.csv Remote DB last update: 14 Aug 2013 09:04:41
######################################################################## 100.0%
[8 of 8] xforce.csv Remote DB last update: 14 Aug 2013 09:04:52
######################################################################## 100.0%

[+] The databaseS is update!

bar@kali:~$

