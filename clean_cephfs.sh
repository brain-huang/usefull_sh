#! /bin/sh

killall -9 ceph-fuse
killall -9 ceph-mds
killall -9 tfs-fuse
killall -9 tfs-mds
umount /mnt/cephfs/

CEPH=/bin/ceph
RBD=/bin/rbd

$CEPH tfs fail tfs
$CEPH tfs rm tfs --yes-i-really-mean-it
$CEPH osd pool rm cephfs.a.data cephfs.a.data --yes-i-really-really-mean-it
$CEPH osd pool rm tfs tfs --yes-i-really-really-mean-it

for((i=0; i<128; i++))
do
    $RBD rm tfs-meta$i -p tfs
done

/etc/init.d/ceph -a -c /etc/ceph/ceph.conf stop

> /var/log/ceph/mds.a.log
