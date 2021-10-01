export DAEMON_NAME=simd 
export DAEMON_HOME=$HOME/.earth
export NODE_NAME=node_earth
$BC_SRC/cosmovisor/cosmovisor unsafe-reset-all --home $DAEMON_HOME