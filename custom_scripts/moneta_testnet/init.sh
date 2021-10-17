export BC_SRC=$1

export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta-testnet

export CHAIN_NAME=moneta-testnet
export ACCOUNT_NAME=$2
export NODE_NAME=$3

mkdir -p $BC_SRC/private
mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
cp $BC_SRC/build/$DAEMON_NAME $DAEMON_HOME/cosmovisor/genesis/bin

$BC_SRC/build/$DAEMON_NAME init $NODE_NAME --chain-id $CHAIN_NAME
$BC_SRC/build/$DAEMON_NAME keys add $ACCOUNT_NAME > $BC_SRC/private/$ACCOUNT_NAME.keys
$BC_SRC/build/$DAEMON_NAME tendermint show-node-id > $BC_SRC/private/$ACCOUNT_NAME.node
$BC_SRC/build/$DAEMON_NAME add-genesis-account $($BC_SRC/build/$DAEMON_NAME keys show $ACCOUNT_NAME -a) $4
$BC_SRC/build/$DAEMON_NAME gentx --chain-id $CHAIN_NAME $ACCOUNT_NAME $5