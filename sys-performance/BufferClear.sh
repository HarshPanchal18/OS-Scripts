echo "sync"
sudo sync
echo "1/5 sync over"

echo "drop cahches, innodes and denteriews"
sudo exho 3 > /proc/sys/vm/drop_caches
echo "2/5 proc file over"

echo "SwappOFf"
sudo swapoff -av
echo "3/5 swapoff over"

echo "sleep 30 sec"
sleep 30s
echo "sleep done"
echo "swapon"
sudo swapon -av
echo "4/5 swapon over"

echo "status"
sudo free -h
echo "5/5 done"
