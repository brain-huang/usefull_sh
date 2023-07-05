#! /bin/sh

for ((;;))
do
   pkill -15 tfs-mds
   sleep 10
   /usr/bin/tfs-mds -i a -c /etc/ceph/ceph.conf --cluster ceph
   sleep 200
done

