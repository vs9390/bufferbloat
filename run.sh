#!/bin/bash
echo "start cs144 buffer bloat experiment"
sudo sysctl -w net.ipv4.tcp_congestion_control=reno
sudo sysctl -w net.ipv4.tcp_min_tso_segs=1
python bufferbloat.py --bw-host 1000 \
                --bw-net 1.5 \
                --delay 10 \
                --dir ./ \
                --nflows 1 \
                --maxq 200 \
                -n 6 \

echo "cleaning up..."
killall -9 iperf ping
mn -c > /dev/null 2>&1
echo "end"
