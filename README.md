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