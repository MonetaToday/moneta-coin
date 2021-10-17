export BC_SRC=$1

export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta

export CHAIN_NAME=moneta
export ACCOUNT_NAME=$2
export NODE_NAME=$3

mkdir -p $BC_SRC/private
mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
cp $BC_SRC/build/$DAEMON_NAME $DAEMON_HOME/cosmovisor/genesis/bin

$BC_SRC/build/$DAEMON_NAME init $NODE_NAME --chain-id $CHAIN_NAME
cp $BC_SRC/initial_configs/testnet-config.toml $DAEMON_HOME/config/config.toml
cp $BC_SRC/initial_configs/testnet-genesis.json $DAEMON_HOME/config/genesis.json