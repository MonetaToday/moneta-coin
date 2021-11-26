# Cosmos SDK v0.44.4 Release Notes

Recently, the Cosmos-SDK team became aware of a high-severity security vulnerability that impacts Cosmos-SDK v0.43.x and v0.44.x and can result in a consensus halt. User funds are NOT at risk; however, the vulnerability can result in a chain halt. This vulnerability does not impact the current Cosmos Hub, though other Cosmos-SDK based blockchains using v0.43.x or v0.44.x may be affected and are advised to update to v0.44.2 immediately.


SDK v0.44.0-v0.44.3 x/auth migration have a **vesting account bug**, which vanishes `delegated_vesting` field from `BaseVestingAccount`. Recovery, unfortunately, is complicated and either involves manually overwriting it or querying an old state.
We had to change the order of module migration by pushing x/auth to the end. Auth module state depends on x/stake and should be run last. We have updated the documentation to provide more details how to change module migration order. This is technically a breaking change, but only impacts updates between the major version change, hence migrating from the previous patch release (0.44.x) doesn't cause new migration and doesn't break the state.

Other bug fixes:
+ grpc-gateway query account balance by IBC denom had an incorrect endpoint (correct one is `"/cosmos/bank/v1beta1/balances/{address}/by_denom"`)
+ use `sdk.GetConfig().GetFullBIP44Path()` instead `sdk.FullFundraiserPath` to generate key - this correctly resets hdpath when running `app testnet`.

This release enables Auto Download feature to Cosmovisor >= v1.0.0. Now, you will be able to use Auto Download with the latest Cosmovisor when you will plan the next upgrade to the next major release (v0.45.0),

Finally, we updated the IAVL to it's latest version and take a benefit of the new IAVL iterator, which improves the iteration performance.

See the [Cosmos SDK v0.44.4 Changelog](https://github.com/cosmos/cosmos-sdk/blob/v0.44.4/CHANGELOG.md) for the exhaustive list of all changes.
