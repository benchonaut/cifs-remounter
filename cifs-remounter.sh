count=0;
tryagain=yes ;
while [[ "$tryagain" == "yes" ]];
  do  tryagain=no;
  grep cifs /etc/fstab |sed 's/\t/ /g;s/ \+/ /g'|while read Mount;do dest=$(echo $Mount|cut -d" " -f2);
  server=$(echo $Mount|cut -d"/" -f3);
  ping $server -c3 -i 2 &>/dev/null && (echo reachable $server $dest;count=$(ls -lh1 "$dest" |grep -v ^total |wc -l) ;
                                        if [[ "$count" -eq 0 ]] ; 
                                            then umount "$dest";
                                            mount "$dest";
                                            count=$(ls -lh1 "$dest" |grep -v ^total |wc -l);
                                         fi ; 
                                         if [[ "$count" -eq 0 ]] ; 
                                              then tryagain=yes;
                                         fi; echo $count $tryagain ) || tryagain=yes; done;
 sleep 3;done
