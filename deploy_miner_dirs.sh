GIVER_ADDRESS_=$1
USER_WALLET_=$2
GPU_COUNT_=$3
#наполняем 0 директорию
#копируем управление майнера

mv tonlib-*-cli miner0 &&echo "cli moved"&&rm -f tonlib-*-cli && echo "temp cli removed"
mv pow***  miner0 && echo "miner moved"&& rm -f pow*** && echo "temp miner removed"
mv global.config.json miner0 && echo "config.json moved"

echo "creating $GPU_COUNT_ dirs for miners"
#генерация конфигов CLI для 0 карты
touch miner0/start_cli.sh
chmod +777 miner0/start_cli.sh
echo "./miner0/tonlib-cuda-cli -v 3  -C ./miner0/global.config.json -e 'pminer start $GIVER_ADDRESS_ $USER_WALLET_ 0 512'" >> mine

for ((GPU_NUMBER_=1; GPU_NUMBER_< GPU_COUNT_; GPU_NUMBER_++))
do
	mkdir miner$GPU_NUMBER_
	echo "creating dir $GPU_NUMBER_"
	cp miner0/tonlib* miner$GPU_NUMBER_/ && echo "CLI copyed to $GPU_NUMBER_"
	cp miner0/pow* miner$GPU_NUMBER_/ && echo "MINER copyed to $GPU_NUMBER_"
	cp miner0/global.config.json miner$GPU_NUMBER_/ && echo "CONFIG copyed to $GPU_NUMBER_"
	cd miner$GPU_NUMBER_
	touch start_cli.sh && echo "created"
	chmod +777 start_cli.sh
	echo "./miner$GPU_NUMBER_/tonlib-cuda-cli -v 3  -C ./miner$GPU_NUMBER_/global.config.json -e 'pminer start $GIVER_ADDRESS_ $US
	cd ../
done
