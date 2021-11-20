#!/bin/bash

TIME_RESTART_LOOP_=360

while :
do
echo "starting miners"
./start_mining.sh 4 && echo "miner started"
sleep $TIME_RESTART_LOOP_
echo "stopping miner"
./stop_mining.sh&&echo "miner stopped"
done
