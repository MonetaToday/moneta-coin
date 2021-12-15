export BC_SRC=$1

export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta

cp $BC_SRC/initial_configs/mainnet-config.toml $DAEMON_HOME/config/config.toml
cp $BC_SRC/initial_configs/mainnet-genesis.json $DAEMON_HOME/config/genesis.json