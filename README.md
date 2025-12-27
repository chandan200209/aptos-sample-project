## Installation & Deployment

### Prerequisites

- Aptos CLI installed
- Aptos wallet configured
- Sufficient APT tokens for gas fees

### Deployment Steps

```bash
# Initialize Aptos project
aptos init

# Compile the contract
aptos move compile

# Deploy the contract
aptos move publish

# Initialize your donation pool
aptos move run --function-id 'YOUR_ADDRESS::SendMessage::initialize_pool'

Usage Example
bash
# Donate to a pool
aptos move run \
  --function-id 'YOUR_ADDRESS::SendMessage::donate' \
  --args address:POOL_OWNER_ADDRESS u64:AMOUNT
Security Considerations
Always verify the pool owner's address before donating

Ensure you have sufficient balance before initiating donations

Test on testnet before deploying to mainnet

Donations are irreversible once confirmed

License
This project is open-source and available under the MIT License.
```
