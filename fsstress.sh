#! /bin/sh

umount -f /mnt/cephfs/
tfs-fuse /mnt/cephfs/

/home/ltp/testcases/bin/fsstress -d /mnt/cephfs/fsstress 10000 -n 1000 -p 300 -v -c



