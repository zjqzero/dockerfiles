#!/bin/bash

if [ ! -f /.root_pw_set ]; then
    /set_root_pass.sh
fi

exec /usr/sbin/sshd -D