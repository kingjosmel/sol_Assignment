# SimplePayable Contract


## Features

- Sets the contract deployer as the owner.
- Accepts ETH through both `receive` and `fallback` functions.
- Restricts certain actions to the owner using a custom modifier.
- Allows the owner to withdraw all ETH from the contract.
- Allows the owner to send a specific amount to any valid address.
- Includes checks to prevent invalid withdrawals (zero address, zero amount, not enough balance).
