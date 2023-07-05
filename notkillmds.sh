ceph daemon mds.a config set mds_laggy_assert_interval 999999999999
ceph daemon mon.a config set mds_beacon_grace 99999999999999
ceph daemon mds.b config set mds_laggy_assert_interval 999999999999
ceph daemon mds.c config set mds_laggy_assert_interval 999999999999
ceph daemon mds.a config set tfs_heartbeat_timeout_interval 0
ceph daemon mds.b config set tfs_heartbeat_timeout_interval 0
ceph daemon mds.c config set tfs_heartbeat_timeout_interval 0
