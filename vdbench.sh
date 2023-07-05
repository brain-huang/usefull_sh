#! /bin/sh
umount -f /mnt/vdbench/
tfs-fuse /mnt/vdbench/
/home/vdbench/vdbench -f /home/vdbench/conf/100w_small_file.conf

