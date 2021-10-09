mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
cp $BC_SRC/build/simd $DAEMON_HOME/cosmovisor/genesis/bin

$BC_SRC/build/simd init $NODE_NAME --chain-id $CHAIN_NAME
$BC_SRC/build/simd keys add $VALIDATOR_NAME > $BC_SRC/private/$VALIDATOR_NAME.keys
$BC_SRC/build/simd add-genesis-account $($BC_SRC/build/simd keys show $VALIDATOR_NAME -a) 10000000000000000micromoneta
$BC_SRC/build/simd gentx --chain-id $CHAIN_NAME $VALIDATOR_NAME 100000000micromoneta
$BC_SRC/build/simd collect-gentxs
# $BC_SRC/build/simd start --address $ADDRESS --grpc.address $GRPC_ADDRESS --p2p.laddr $P2P_ADDRESS --proxy_app $PROXY_ADDRESS --rpc.laddr $RPC_ADDRESS