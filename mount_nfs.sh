umount -f /mnt/nfs-1/
umount -f /mnt/nfs-2/
umount -f /mnt/nfs-3/

mount -t nfs -o rw,sec=sys,proto=tcp,nolock,nfsvers=3,noac,lookupcache=none 192.168.44.121:/ /mnt/nfs-1/
mount -t nfs -o rw,sec=sys,proto=tcp,nolock,nfsvers=3,noac,lookupcache=none 192.168.44.121:/ /mnt/nfs-2/
mount -t nfs -o rw,sec=sys,proto=tcp,nolock,nfsvers=3,noac,lookupcache=none 192.168.44.121:/ /mnt/nfs-3/
