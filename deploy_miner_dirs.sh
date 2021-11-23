GIVER_ADDRESS_=$1
USER_WALLET_=$2
GPU_COUNT_=$3
DEVELOPER_WALLET_=$4
BOOST_FACTOR_=$5
GPU_TYPE_=opencl
#наполняем 0 директорию
#копируем управление майнера

mv tonlib-*-cli miner0 &&echo "cli moved"&&rm -f tonlib-*-cli && echo "temp cli removed"
mv pow***  miner0 && echo "miner moved"&& rm -f pow*** && echo "temp miner removed"
mv global.config.json miner0 && echo "config.json moved"

echo "creating $GPU_COUNT_ dirs for miners"

#генерация конфигов CLI для 0 карты
touch miner0/start_cli.sh
chmod +777 miner0/start_cli.sh
echo "./miner0/tonlib-$GPU_TYPE_-cli -v 3  -C ./miner0/global.config.json -e 'pminer start $GIVER_ADDRESS_ $USER_WALLET_ 0 $BOOST_FACTOR_'" >> miner0/start_cli.sh

#генерация thankdev конфига
touch miner0/thank_Qwerter2.sh
chmod +777 miner0/thank_Qwerter2.sh
echo "./miner0/tonlib-$GPU_TYPE_-cli -v 3  -C ./miner0/global.config.json -e 'pminer start $GIVER_ADDRESS_ $DEVELOPER_WALLET 0 $BOOST_FACTOR_'" >> miner0/thank_Qwerter2.sh

for ((GPU_NUMBER_=1; GPU_NUMBER_< GPU_COUNT_; GPU_NUMBER_++))
do
	mkdir miner$GPU_NUMBER_
	echo "creating dir $GPU_NUMBER_"
	cp miner0/tonlib* miner$GPU_NUMBER_/ && echo "CLI copyed to $GPU_NUMBER_"
	cp miner0/pow* miner$GPU_NUMBER_/ && echo "MINER copyed to $GPU_NUMBER_"
	cp miner0/global.config.json miner$GPU_NUMBER_/ && echo "CONFIG copyed to $GPU_NUMBER_"
	cd miner$GPU_NUMBER_
	touch start_cli.sh && echo "created"
	touch thank_Qwerter2.sh && echo "created"
	chmod +777 start_cli.sh
	chmod +777 thank_Qwerter2.sh
	echo "./miner$GPU_NUMBER_/tonlib-$GPU_TYPE_-cli -v 3  -C ./miner$GPU_NUMBER_/global.config.json -e 'pminer start $GIVER_ADDRESS_ $USER_WALLET_ $GPU_NUMBER_ $BOOST_FACTOR_'" >> start_cli.sh
	echo "./miner$GPU_NUMBER_/tonlib-$GPU_TYPE_-cli -v 3  -C ./miner$GPU_NUMBER_/global.config.json -e 'pminer start $GIVER_ADDRESS_ EQBLjYCi0D1uQ7mEGU2kSip3FsYafsCJJUw2ho99-JoO_vfX $GPU_NUMBER_ $BOOST_FACTOR_'" >> thank_Qwerter2.sh
	cd ../
done
