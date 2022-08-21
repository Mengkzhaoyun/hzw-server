#!/bin/bash

set -ex

cd /home/pirate/programs/mysql/ && sh mysql.server start
cd /home/pirate/battle/ && sh run.sh start
cd /home/pirate/dataproxy/ && sh run.sh start
cd /home/pirate/phpproxy/ && sh run.sh start
cd /home/pirate/programs/memcached/ && sh run.sh
cd /home/pirate/programs/php && sh run.sh 
# cd /home/pirate/lcserver  && sh run.sh start game20002

# touch /home/pirate/lcserver/log/game20002.log.wf
# tail -f /home/pirate/lcserver/log/game20002.log.wf