#!/bin/bash

#######################################################
# $Name: mysql_per_mon.sh
# $Version: v1.0
# $Author: bisal
# $Create Date: 2017-08-25
# $Descriptino: MySQL Performance Monitor
#######################################################

mysqladmin --defaults-extra-file=/DATA/mysql/my.cnf ext -i1 | awk 'BEGIN{lswitch=0;
print "|QPS        |Commit     |Rollback   |TPS        |Threads_con  |Threads_run |";
print "------------------------------------------------------------------------------";}

$2 ~ /Queries$/ {q=$4-lq; lq=$4;}
$2 ~ /Com_commit$/ {c=$4-lc; lc=$4;}
$2 ~ /Com_rollback$/ {r=$4-lr; lr=$4;}
$2 ~ /Threads_connected$/ {tc=$4;}
$2 ~ /Threads_running$/ {tr=$4;

if (lswitch==0)
{
  lswitch=1;
  count=0;
} else {
  if (count>10) {
    count=0;
    print "------------------------------------------------------------------------------";
    print "|QPS        |Commit     |Rollback   |TPS        |Threads_con  |Threads_run |";
    print "------------------------------------------------------------------------------";
  } else {
    count+=1;
    printf "|%-10d |%-10d |%-10d |%-10d |%-12d |%-12d|", q,c,r,c+r,tc,tr;
  }
}
}'
