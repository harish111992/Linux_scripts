for pid in $(ls /proc | grep -E '^[0-9]+$'); do
  awk -v pid=$pid '/VmSwap/ {if ($2 > 0) print $2 " KB\t" pid}' /proc/$pid/status 2>/dev/null
done | sort -n | tail -10

#######
# Last line has the highest number
# sort -n
#1
#2
#10
########
#awk -v pid=$pid '/VmSwap/ {if ($2 > 0) print $2 " KB\t" pid}' /proc/$pid/status 2>/dev/null
#-v = pass shell variables to the awk, beacuse awk runs out of the shell
#so -v pid=$pid which means we are informing the same to awk
# /vmSwap/ => Looks for the line and prints secons coloumn
# pid of the shell passes to the awk
