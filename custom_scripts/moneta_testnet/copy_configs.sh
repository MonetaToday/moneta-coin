export BC_SRC=$1

export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta_testnet

cp $BC_SRC/initial_configs/config.toml $DAEMON_HOME/config/config.toml
cp $BC_SRC/initial_configs/app.toml $DAEMON_HOME/config/app.toml