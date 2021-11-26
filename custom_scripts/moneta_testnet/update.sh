export BC_SRC=$1
export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta
export PATH=$PATH:/usr/local/go/bin

git pull
make build
make cosmovisor
cp $BC_SRC/initial_configs/testnet-config.toml $DAEMON_HOME/config/config.toml
cp $BC_SRC/initial_configs/testnet-genesis.json $DAEMON_HOME/config/genesis.json

systemctl stop monetad.service
echo "Service monetad.service stopped"

cp $BC_SRC/build/$DAEMON_NAME $DAEMON_HOME/cosmovisor/genesis/bin
echo "Build bin copied"

systemctl start monetad.service
echo "Service monetad.service started"