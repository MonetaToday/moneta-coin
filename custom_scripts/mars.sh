export BC_SRC=~/files/repos/moneta-coin

export DAEMON_NAME=simd 
export CHAIN_NAME=mars
export VALIDATOR_NAME=validator2

export DAEMON_HOME=$HOME/.mars
export NODE_NAME=node_mars

export ADDRESS="tcp://0.0.0.0:27658"
export GRPC_ADDRESS="0.0.0.0:9790"
export P2P_ADDRESS="tcp://0.0.0.0:27656"
export PROXY_ADDRESS="tcp://127.0.0.1:27658"
export RPC_ADDRESS="tcp://127.0.0.1:27657"

rm -R $DAEMON_HOME
sh $BC_SRC/custom_scripts/init.sh
sh $BC_SRC/custom_scripts/up.sh