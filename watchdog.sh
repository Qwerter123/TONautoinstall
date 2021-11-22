#!/bin/bash

TIME_RESTART_LOOP_=360
CARDS_TO_START_COUNT_=12
#равнозначно 2%
USER_OWN_MINING_LOOP_COUNT=50
GPU_RESTART_TIME_=360

while :
do
#бесконечный цикл для автоматического перезапуска майнера
#основной майнинг на пользователя
for ((USER_OWN_ROW_=0; USER_OWN_ROW_ < USER_OWN_MINING_LOOP_COUNT; USER_OWN_ROW_++))
do
	echo "starting own user miners"
	#здесь 0 - майнинг на пользователя, 1 - режим благодарности
	./start_mining.sh $CARDS_TO_START_COUNT_ 0 && echo "miner started"
	sleep $GPU_RESTART_TIME_
	echo "stopping miner"
	./stop_mining.sh && echo "miner own user stopped"
done

 #режим благодарности
echo "starting developer thanks mining"
./start_mining.sh $CARDS_TO_START_COUNT_ 1 && echo "miner started"
sleep $GPU_RESTART_TIME_
echo "stopping miner"
./stop_mining.sh && echo "miner stopped"
sleep 1

done
