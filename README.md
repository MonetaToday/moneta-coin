This network is managed by community voting.

The coins which are deposited to a proposal will burn either:
1) MinDeposit has't been reached by the end of deposit period;
2) VetoThreshold votes count is greater than 0.334% of voting power.



Firstly install Go:
  https://golang.org/doc/install

Secondly clone the repository:
  git clone https://github.com/MonetaToday/moneta-coin.git -b monetacoin-develop

In Ubuntu please install:
  apt install make gcc

And make the build:
  make build; make cosmovisor

Make systemd service:
  mkdir -p /var/log/monetad
  touch /var/log/monetad/monetad.log
  touch /var/log/monetad/monetad_error.log
  touch /etc/systemd/system/monetad.service

Then provide the service:
  nano /etc/systemd/system/monetad.service

with:
  [Unit]
  Description=moneta daemon
  After=network-online.target
  [Service]
  Environment="DAEMON_NAME=monetad"
  Environment="DAEMON_HOME=/root/.moneta"
  User=root
  ExecStart={PATH-TO-MONETA-COIN-REPOSITORY}/cosmovisor/cosmovisor start
  WorkingDirectory={PATH-TO-MONETA-COIN-REPOSITORY}/custom_scripts/moneta_testnet
  StandardOutput=file:/var/log/monetad/monetad.log
  StandardError=file:/var/log/monetad/monetad_error.log
  Restart=always
  RestartSec=3
  LimitNOFILE=4096
  [Install]
  WantedBy=multi-user.target

And enable the service:
  systemctl enable monetad.service

Then start it:
  systemctl start monetad.service

You can see logs:
  journalctl -u digitaloceand -f
Or:
  tail -n 100 /var/log/monetad/monetad_error.log

Config your firewall:
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
  sudo ufw allow OpenSSH
  sudo ufw allow 80/tcp
  sudo ufw allow 443/tcp
  sudo ufw allow 60000:61000/udp
  sudo ufw allow 26657/tcp
  sudo ufw allow 1317/tcp
  sudo ufw allow 8080/tcp
  sudo ufw --force enable