#! /bin/sh
cp -f /etc/ceph/ceph.conf.ut /etc/ceph/ceph.conf

> /var/log/ceph/osd.0.log
rm -f /var/log/ceph/mds.*.log
> /var/log/ceph/ceph.log
> /var/log/ceph/ceph.client.log
> /var/log/ceph/mon.a.log
> /var/log/ceph/mgr.a.log
killall -9 ceph-fuse
killall -9 ceph-mds
killall -9 tfs-fuse
killall -9 tfs-mds
umount -f /mnt/cephfs/
umount -f /mnt/cephfs/
umount -f /mnt/test/
umount -f /mnt/test/

CEPH=/home/code/ceph2.0_noasan/thinkfs/build/bin/ceph
RBD=/home/code/ceph2.0_noasan/thinkfs/build/bin/rbd
TFS=tfs

#for((i=0; i<8; i++))
#do
#  $RBD rm tfs-meta$i -p $TFS
#done

#$RBD rm tfs-meta -p $TFS
#$CEPH tfs fail tfs
#$CEPH tfs rm tfs --yes-i-really-mean-it
#$CEPH osd pool rm cephfs.a.data cephfs.a.data --yes-i-really-really-mean-it
#$CEPH osd pool rm $TFS $TFS --yes-i-really-really-mean-it

#killall -9 ceph-mon

python3 /etc/ceph/scripts/bluestore_mgr.py -c /etc/ceph/scripts/disklist.yaml -g -r -M
/etc/init.d/ceph -a -c /etc/ceph/ceph.conf start mon
/etc/init.d/ceph -a -c /etc/ceph/ceph.conf start

$CEPH osd pool create cephfs.a.data 200 200
$CEPH osd pool create $TFS 200 200


for((i=0; i<20; i++))
do
        #echo tfs-meta$i
        #$RBD rm tfs-meta$i -p $TFS
        $RBD create -s 4G tfs-meta$i -p $TFS
done

/home/code/ceph2.0_noasan/thinkfs/build/bin/tfs-mds -i a  -c /etc/ceph/ceph.conf
#/home/code/ceph2.0_noasan/thinkfs/build/bin/tfs-mds -i b  -c /etc/ceph/ceph.conf

#$RBD rm tfs-meta -p $TFS
#$RBD create -s 4G tfs-meta -p $TFS
#$RBD create -s 10M tfs-meta -p $TFS
#$RBD create -s 1G tfs-meta -p $TFS --stripe-unit 4K --stripe-count 8

$CEPH osd lspools
$RBD -p $TFS ls

$CEPH tfs new tfs $TFS cephfs.a.data --force

