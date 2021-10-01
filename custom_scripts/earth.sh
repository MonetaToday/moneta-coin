export BC_SRC=~/files/repos/moneta-coin

export DAEMON_NAME=simd
export DAEMON_HOME=$HOME/.earth

export CHAIN_NAME=earth
export VALIDATOR_NAME=validator1
export NODE_NAME=node_earth

export ADDRESS="tcp://0.0.0.0:26658"
export GRPC_ADDRESS="0.0.0.0:9090"
export P2P_ADDRESS="tcp://0.0.0.0:26656"
export PROXY_ADDRESS="tcp://127.0.0.1:26658"
export RPC_ADDRESS="tcp://127.0.0.1:26657"

rm -R $DAEMON_HOME
sh $BC_SRC/custom_scripts/init.sh
# sh $BC_SRC/custom_scripts/up.sh