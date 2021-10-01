mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
cp $BC_SRC/build/simd $DAEMON_HOME/cosmovisor/genesis/bin

$BC_SRC/build/simd init $NODE_NAME --chain-id $CHAIN_NAME --home $DAEMON_HOME
$BC_SRC/build/simd keys --home $DAEMON_HOME add $VALIDATOR_NAME > $BC_SRC/private/$VALIDATOR_NAME.keys
$BC_SRC/build/simd add-genesis-account --home $DAEMON_HOME $($BC_SRC/build/simd keys --home $DAEMON_HOME show $VALIDATOR_NAME -a) 10000000000000000micromoneta
$BC_SRC/build/simd gentx --home $DAEMON_HOME --chain-id $CHAIN_NAME $VALIDATOR_NAME 100000000micromoneta
$BC_SRC/build/simd collect-gentxs --home $DAEMON_HOME
# $BC_SRC/build/simd start --home $DAEMON_HOME --address $ADDRESS --grpc.address $GRPC_ADDRESS --p2p.laddr $P2P_ADDRESS --proxy_app $PROXY_ADDRESS --rpc.laddr $RPC_ADDRESS