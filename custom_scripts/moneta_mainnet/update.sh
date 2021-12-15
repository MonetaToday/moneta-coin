export BC_SRC=$1
export DAEMON_NAME=monetad
export DAEMON_HOME=$HOME/.moneta
export PATH=$PATH:/usr/local/go/bin

git pull
make build
make cosmovisor

systemctl stop monetad.service
echo "Service monetad.service stopped"

rm /var/log/monetad/monetad_error.log

cp $BC_SRC/build/$DAEMON_NAME $DAEMON_HOME/cosmovisor/genesis/bin
echo "Build bin copied"

touch /var/log/monetad/monetad_error.log

systemctl start monetad.service
echo "Service monetad.service started"