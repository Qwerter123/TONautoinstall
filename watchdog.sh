#!/bin/bash

TIME_RESTART_LOOP_=360
CARDS_TO_START_COUNT_=12
COUNTER_LOOPS_=0
COUNTER_LOOPS_MOD=0
#равнозначно 2%
DEVELOPER_THANKS_=0


while :
do
  if [ "$COUNTER_LOOPS_MOD" -eq "$DEVELOPER_THANKS_" ]
    echo "starting developer thanks"
    echo "starting miners"
    ./start_mining.sh $CARDS_TO_START_COUNT_ 1 && echo "miner started"
    sleep $TIME_RESTART_LOOP_
    echo "stopping miner"
    ./stop_mining.sh&&echo "miner stopped"
  fi

echo "starting miners"
./start_mining.sh $CARDS_TO_START_COUNT_ 0 && echo "miner started"
sleep $TIME_RESTART_LOOP_
echo "stopping miner"
./stop_mining.sh&&echo "miner stopped"

COUNTER_LOOPS_++
COUNTER_LOOPS_MOD=$(($COUNTER_LOOPS_%50))

done
