# cifs-remounter
script to get cifs mounted @ boot time when _netdev fails 


### It's an endless Loop !!!

you may use it in /etc/rc.local or cron like 
/usr/bin/nohup /bin/bash /etc/custom/cifs-remounter/cifs-remounter.sh >/tmp/cifs-remount.log

