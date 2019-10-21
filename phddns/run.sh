#!/bin/bash

/usr/bin/oraynewph -s 0.0.0.0 > /dev/null 2>&1 &
sleep 1
/usr/bin/oraysl  -a 127.0.0.1 -p 16062 -s phsle02.oray.net:6061