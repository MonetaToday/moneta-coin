export BC_SRC=$1
export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta
export PATH=$PATH:/usr/local/go/bin

git pull
make build

systemctl stop monetad.service
echo "Service monetad.service restarted"

cp $BC_SRC/build/$DAEMON_NAME $DAEMON_HOME/cosmovisor/genesis/bin
echo "Build bin copied"

systemctl start monetad.service
echo "Service monetad.service started"