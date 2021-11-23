GPU_COUNT_=$1
MINING_MODE_=$2

for ((GPU_NUMBER_=0; GPU_NUMBER_ < GPU_COUNT_; GPU_NUMBER_++))
do
	#main mode
	if [ "$MINING_MODE_" -eq "0" ]
	then
		echo "starting miner for GPU $GPU_NUMBER_"
		sleep 1
		echo 'starting mining in screen ' $GPU_NUMBER
		screen -AmdS TONMINER$GPU_NUMBER_ ./miner$GPU_NUMBER_/start_cli.sh
	fi
	
	#thank dev mode
	if [ "$MINING_MODE_" -eq "1" ]
	then
		echo "starting miner for GPU $GPU_NUMBER_"
		echo 'starting mining in screen ' $GPU_NUMBER
		screen -AmdS TONMINER$GPU_NUMBER_ ./miner$GPU_NUMBER_/thank_Qwerter2.sh
	fi
done
