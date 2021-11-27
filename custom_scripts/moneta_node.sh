export BC_SRC=~/files/repos/moneta-coin

export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta

export CHAIN_NAME=moneta_testnet
export VALIDATOR_NAME=validator1
export NODE_NAME=node_moneta

export ADDRESS="tcp://0.0.0.0:26658"
export GRPC_ADDRESS="0.0.0.0:9090"
export P2P_ADDRESS="tcp://0.0.0.0:26656"
export PROXY_ADDRESS="tcp://127.0.0.1:26658"
export RPC_ADDRESS="tcp://127.0.0.1:26657"

# $BC_SRC/cosmovisor/cosmovisor --home $DAEMON_HOME --node $RPC_ADDRESS --keyring-backend test --chain-id $CHAIN_NAME $@
$BC_SRC/build/$DAEMON_NAME --home $DAEMON_HOME --node $RPC_ADDRESS --chain-id $CHAIN_NAME $@