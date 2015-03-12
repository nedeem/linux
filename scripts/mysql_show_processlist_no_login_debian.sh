#!/bin/bash
Log=/var/log/mysql-proc-list.log
date >> $Log
/usr/bin/mysql -u `grep user /etc/mysql/debian.cnf | tail -n 1 | cut -d"=" -f2 | awk '{print $1}'` -p`grep password /etc/mysql/debian.cnf | tail -n 1 | cut -d"=" -f2 | awk '{print $1}'` -e "show processlist;" >> $Log
/usr/bin/mysql -u `grep user /etc/mysql/debian.cnf | tail -n 1 | cut -d"=" -f2 | awk '{print $1}'` -p`grep password /etc/mysql/debian.cnf | tail -n 1 | cut -d"=" -f2 | awk '{print $1}'` -e "show processlist;"
