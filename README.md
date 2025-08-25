# BitVault Pro - Enterprise Bitcoin Stacking & Yield Protocol

[![Clarity](https://img.shields.io/badge/Clarity-3.0-blue)](https://docs.stacks.co/clarity)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Tests](https://img.shields.io/badge/Tests-Vitest-brightgreen)](package.json)

## Overview

BitVault Pro is an institutional-grade liquid stacking solution that maximizes Bitcoin yield through strategic STX delegation while maintaining full custody and liquidity for sophisticated Bitcoin holders. Built on Stacks' Layer 2, our protocol combines the security of Bitcoin's base layer with Stacks' proven stacking mechanism.

### Key Features

- **Enterprise-Grade Security**: Battle-tested protocol with comprehensive security measures
- **Liquid Stacking**: Maintain liquidity while earning yield on your STX holdings
- **Tiered Rewards System**: Bronze, Silver, and Gold tiers with escalating benefits
- **Governance Integration**: Decentralized decision-making for protocol evolution
- **Risk Management**: Built-in cooldown periods and emergency controls

## System Overview

BitVault Pro operates as a sophisticated yield generation protocol that allows users to stake STX tokens and earn rewards based on their staking tier and lock period. The system is designed for institutional investors, family offices, and sophisticated retail participants who demand maximum security, transparency, and control.

### Core Components

1. **Staking Engine**: Manages STX deposits, withdrawals, and position tracking
2. **Reward System**: Calculates and distributes yield based on tier and time-lock multipliers
3. **Governance Module**: Enables community-driven protocol decisions
4. **Risk Management**: Implements security controls and emergency procedures

## Contract Architecture

### Data Structures

#### User Positions

```clarity
{
  total-collateral: uint,
  total-debt: uint,
  health-factor: uint,
  last-updated: uint,
  stx-staked: uint,
  analytics-tokens: uint,
  voting-power: uint,
  tier-level: uint,
  rewards-multiplier: uint
}
```

#### Staking Positions

```clarity
{
  amount: uint,
  start-block: uint,
  last-claim: uint,
  lock-period: uint,
  cooldown-start: (optional uint),
  accumulated-rewards: uint
}
```

#### Tier System

| Tier | Minimum Stake | Reward Multiplier | Features |
|------|---------------|------------------|----------|
| Bronze | 1 STX | 1.0x | Basic staking |
| Silver | 5 STX | 1.5x | Enhanced features |
| Gold | 10 STX | 2.0x | Full feature access |

### Core Functions

#### Public Functions

- `initialize-contract()` - Deploy and configure tier system
- `stake-stx(amount, lock-period)` - Stake STX tokens with optional time-lock
- `initiate-unstake(amount)` - Begin unstaking process with cooldown
- `complete-unstake()` - Complete withdrawal after cooldown period
- `create-proposal(description, voting-period)` - Create governance proposals
- `vote-on-proposal(proposal-id, vote-for)` - Vote on active proposals
- `pause-contract()` / `resume-contract()` - Emergency controls

#### Read-Only Functions

- `get-user-position(user)` - Retrieve user's complete position data
- `get-staking-position(user)` - Get specific staking details
- `get-proposal-details(proposal-id)` - Fetch governance proposal information
- `get-stx-pool()` - Total STX locked in protocol
- `is-contract-paused()` - Check contract operational status

## Data Flow

### Staking Flow

```mermaid
User → stake-stx() → STX Transfer → Position Creation → Tier Assignment → Reward Calculation
```

### Unstaking Flow

```mermaid
User → initiate-unstake() → Cooldown Period → complete-unstake() → STX Return → Position Cleanup
```

### Governance Flow

```mermaid
User → create-proposal() → Community Voting → Execution → Protocol Update
```

## Installation & Setup

### Prerequisites

- [Clarinet](https://docs.hiro.so/clarinet) - Stacks development environment
- [Node.js](https://nodejs.org/) v18 or higher
- [Git](https://git-scm.com/)

### Clone Repository

```bash
git clone https://github.com/eddie-cynthia/bitvault.git
cd bitvault
```

### Install Dependencies

```bash
npm install
```

### Development Commands

#### Contract Validation

```bash
clarinet check
```

#### Run Tests

```bash
npm test
```

#### Test with Coverage

```bash
npm run test:report
```

#### Watch Mode

```bash
npm run test:watch
```

## Testing Strategy

The protocol includes comprehensive test coverage using Vitest and Clarinet SDK:

- **Unit Tests**: Individual function validation
- **Integration Tests**: Multi-function workflows
- **Edge Cases**: Boundary condition testing
- **Security Tests**: Access control and validation
- **Gas Optimization**: Cost analysis and optimization

## Security Considerations

### Access Controls

- Contract owner privileges for emergency functions
- User-specific position access restrictions
- Validation of all user inputs

### Economic Security

- Minimum stake requirements prevent spam attacks
- Cooldown periods protect against flash loan attacks
- Tier-based rewards incentivize long-term participation

### Emergency Procedures

- Contract pause functionality for critical issues
- Emergency mode for extreme circumstances
- Governance override capabilities

## Configuration

### Network Settings

- **Devnet**: Development and testing environment
- **Testnet**: Pre-production validation
- **Mainnet**: Production deployment

### Key Parameters

- Base reward rate: 5% annual
- Minimum stake: 1 STX
- Cooldown period: 24 hours (1,440 blocks)
- Lock period options: 0, 30, 60 days

## API Reference

### Staking Operations

#### stake-stx

Stakes STX tokens with optional time-lock for enhanced rewards.

**Parameters:**

- `amount` (uint): Amount to stake in microSTX
- `lock-period` (uint): Lock duration (0, 4320, or 8640 blocks)

**Returns:** `(response bool uint)`

#### initiate-unstake

Begins the unstaking process with mandatory cooldown period.

**Parameters:**

- `amount` (uint): Amount to unstake in microSTX

**Returns:** `(response bool uint)`

### Governance Operations

#### create-proposal

Creates a new governance proposal for community voting.

**Parameters:**

- `description` (string-utf8 256): Proposal description
- `voting-period` (uint): Duration for voting (100-2880 blocks)

**Returns:** `(response uint uint)`

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow Clarity best practices
- Maintain comprehensive test coverage
- Document all public functions
- Ensure security considerations are addressed

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Roadmap

### Phase 1: Core Protocol ✅

- [x] Basic staking functionality
- [x] Tier system implementation
- [x] Governance framework
- [x] Security controls

### Phase 2: Advanced Features 🚧

- [ ] Automated compounding
- [ ] Cross-chain integration
- [ ] Advanced analytics dashboard
- [ ] Insurance mechanisms

### Phase 3: Institutional Features 📋

- [ ] Multi-signature support
- [ ] Institutional custody integration
- [ ] Advanced reporting tools
- [ ] Compliance frameworks
