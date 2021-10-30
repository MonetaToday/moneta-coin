export BC_SRC=$1
export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta
export PATH=$PATH:/usr/local/go/bin

git pull
make build
cp $BC_SRC/build/$DAEMON_NAME $DAEMON_HOME/cosmovisor/genesis/bin

systemctl restart monetad.service
