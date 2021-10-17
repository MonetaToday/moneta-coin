export BC_SRC=$1

export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta_testnet

$BC_SRC/cosmovisor/cosmovisor start