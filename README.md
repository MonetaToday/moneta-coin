This network is managed by community voting.

The coins which are deposited to a proposal will burn either:
1) MinDeposit has't been reached by the end of deposit period;
2) VetoThreshold votes count is greater than 0.334% of voting power.


## Take part in the consensus

Firstly install Go:
```sh
  https://golang.org/doc/install
```

Secondly clone the repository:
```sh
  git clone https://github.com/MonetaToday/moneta-coin.git -b monetacoin-develop
```

In Ubuntu please install:
```sh
  apt update
  apt install make gcc
```

And make the build:
```sh
  make build; make cosmovisor
```

Run:
```sh
  export PATH_TO_MONETA_COIN_REPOSITORY=PATH
  sh ./custom_scripts/moneta_testnet/init.sh $PATH_TO_MONETA_COIN_REPOSITORY account_name node_name
  sh ./custom_scripts/moneta_testnet/copy_configs.sh $PATH_TO_MONETA_COIN_REPOSITORY
  sh ./custom_scripts/moneta_testnet/moneta_up.sh $PATH_TO_MONETA_COIN_REPOSITORY
```

## Creating daemon service

Make systemd service:
```sh
  mkdir -p /var/log/monetad
  touch /var/log/monetad/monetad.log
  touch /var/log/monetad/monetad_error.log
  touch /etc/systemd/system/monetad.service
```

Then provide the service:
```sh
  nano /etc/systemd/system/monetad.service
```

with:
```sh
  [Unit]
  Description=moneta daemon
  After=network-online.target
  [Service]
  Environment="DAEMON_NAME=monetad"
  Environment="DAEMON_HOME=/root/.moneta"
  User=root
  ExecStart={RENAME-THIS-TO-PATH-TO-MONETA-COIN-REPOSITORY}/cosmovisor/cosmovisor start
  WorkingDirectory={RENAME-THIS-TO-PATH-TO-MONETA-COIN-REPOSITORY}/custom_scripts/moneta_testnet
  StandardOutput=file:/var/log/monetad/monetad.log
  StandardError=file:/var/log/monetad/monetad_error.log
  Restart=always
  RestartSec=3
  LimitNOFILE=4096
  [Install]
  WantedBy=multi-user.target
```

And enable the service:
```sh
  systemctl enable monetad.service
```

Then start it:
```sh
  systemctl start monetad.service
```

You can see logs:
```sh
  journalctl -u monetad -f
```

Or:
```sh
  tail -n 100 /var/log/monetad/monetad_error.log
```

## Security settings

Config your firewall:
```sh
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
  sudo ufw allow OpenSSH
  sudo ufw allow 80/tcp
  sudo ufw allow 443/tcp
  sudo ufw allow 60000:61000/udp
  sudo ufw allow 26656/tcp
  sudo ufw allow 26657/tcp
  sudo ufw allow 1317/tcp
  sudo ufw allow 8080/tcp
  sudo ufw --force enable
```

## Nginx settings

```sh
apt install nginx
nano /etc/nginx/sites-available/node.moneta.coin
rm /etc/nginx/sites-enabled/default
```

Insert into config:
```sh
server {
        listen 80;
        listen [::]:80;

        server_name node.moneta.coin;
        
        location /health {
               proxy_pass http://localhost:26657/health;
        }

        location /status {
               proxy_pass http://localhost:26657/status;
        }
}
```

```sh
ln -s /etc/nginx/sites-available/node.moneta.coin /etc/nginx/sites-enabled/
systemctl restart nginx
```