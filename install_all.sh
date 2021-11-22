GIVER_ADDRESS_=$1
USER_WALLET_=$2
GPU_COUNT_=$3
DEVELOPER_WALLET_=EQDVwXI699aq287YkKAUpZGOyc1osydH6BFt6K7EgVUDim4P
BOOT_FACTOR_=512
MINER_LINK_=https://github.com/tontechio/pow-miner-gpu/releases/download/20211116-1/minertools-cuda-ubuntu-18.04-x86-64.tar.gz
#MINER_LINK_=https://github.com/tontechio/pow-miner-gpu/releases/download/20211119-4/minertools-opencl-ubuntu-18.04-x86-64.tar.gz

./rm_all_miners.sh

mkdir miner0 && echo "miner 0 directory created"
echo "downloading miner archive from  $MINER_LINK_"
wget -O miner_archive.tar.gz $MINER_LINK_ && echo "miner archive downloaded"
echo "unpacking miner achive"
tar -xvf miner_archive.tar.gz && echo "miner archive unpacked"
wget https://newton-blockchain.github.io/global.config.json && echo "config downloaded"
#создаём директории для майнеров по количеству видеокарт
deploy_miner_dirs.sh $GIVER_ADDRESS_ $USER_WALLET_ $GPU_COUNT_ $DEVELOPER_WALLET_ $BOOST_FACTOR_
