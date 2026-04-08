for pid in $(ls /proc | grep -E '^[0-9]+$'); do
  awk -v pid=$pid '/VmSwap/ {if ($2 > 0) print $2 " KB\t" pid}' /proc/$pid/status 2>/dev/null
done | sort -n | tail -10

