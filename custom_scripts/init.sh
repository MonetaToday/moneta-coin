mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
cp $BC_SRC/build/$DAEMON_NAME $DAEMON_HOME/cosmovisor/genesis/bin

$BC_SRC/build/$DAEMON_NAME init $NODE_NAME --chain-id $CHAIN_NAME
$BC_SRC/build/$DAEMON_NAME keys add $VALIDATOR_NAME > $BC_SRC/private/$VALIDATOR_NAME.keys
$BC_SRC/build/$DAEMON_NAME add-genesis-account $($BC_SRC/build/$DAEMON_NAME keys show $VALIDATOR_NAME -a) 10000000000000000micromoneta
$BC_SRC/build/$DAEMON_NAME gentx --chain-id $CHAIN_NAME $VALIDATOR_NAME 100000000micromoneta
$BC_SRC/build/$DAEMON_NAME collect-gentxs