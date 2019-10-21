#!/bin/bash

if [ -f /.root_pw_set ]; then
    echo "Root password already set!"
    exit 0
fi

if [[ -n $ROOT_PASS ]]; then
    PASS=${ROOT_PASS}
    echo "root:$PASS" | chpasswd
    touch /.root_pw_set
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
fi
