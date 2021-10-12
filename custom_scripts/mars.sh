export BC_SRC=~/files/repos/moneta-coin

export DAEMON_NAME=monetad 
export CHAIN_NAME=moneta

export DAEMON_HOME=$HOME/.moneta_2
export NODE_NAME=node_moneta_2

export ADDRESS="tcp://0.0.0.0:27658"
export GRPC_ADDRESS="0.0.0.0:9790"
export P2P_ADDRESS="tcp://0.0.0.0:27656"
export PROXY_ADDRESS="tcp://127.0.0.1:27658"
export RPC_ADDRESS="tcp://127.0.0.1:27657"

rm -R $DAEMON_HOME

mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
cp $BC_SRC/build/$DAEMON_NAME $DAEMON_HOME/cosmovisor/genesis/bin
$BC_SRC/build/$DAEMON_NAME init $NODE_NAME --home $DAEMON_HOME --chain-id $CHAIN_NAME
cp $BC_SRC/initial_configs/node_2_config.toml $DAEMON_HOME/config/config.toml
cp $BC_SRC/initial_configs/node_2_app.toml $DAEMON_HOME/config/app.toml
cp ~/.moneta/config/genesis.json $DAEMON_HOME/config/genesis.json
$BC_SRC/cosmovisor/cosmovisor start --home $DAEMON_HOME --address $ADDRESS --grpc.address $GRPC_ADDRESS --p2p.laddr $P2P_ADDRESS --proxy_app $PROXY_ADDRESS --rpc.laddr $RPC_ADDRESS --minimum-gas-prices 1micromoneta