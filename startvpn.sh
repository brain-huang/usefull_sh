#!/bin/bash
echo "58WSAxeh" | /usr/sbin/openconnect --protocol=gp 106.37.170.2:9000 --script '/usr/local/bin/vpn-slice 10.128.0.0/16 gitlab.ln.ad=10.128.132.126 confluence.ln.ad=10.128.106.117 jira.ln.ad=10.128.106.111' -u weijiang -b --passwd-on-stdin --servercert pin-sha256:J7jTZKw9eAhOaL1ifZ+j7/w9w7p0BxWO3e67kei3HiM= > /dev/null 2>&1

