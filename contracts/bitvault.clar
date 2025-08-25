;; Title: BitVault Pro - Enterprise Bitcoin Stacking & Yield Protocol
;;
;; Summary: An institutional-grade liquid stacking solution that maximizes 
;; Bitcoin yield through strategic STX delegation while maintaining full 
;; custody and liquidity for sophisticated Bitcoin holders.
;;
;; Description: 
;; BitVault Pro transforms how Bitcoin holders approach yield generation by
;; providing a battle-tested, audited protocol for enterprise stacking on
;; Bitcoin's most secure Layer 2. Our innovative approach combines the
;; security of Bitcoin's base layer with Stacks' proven stacking mechanism,
;; delivering consistent yield while preserving the self-sovereign principles
;; that make Bitcoin the world's premier store of value.
;;
;; Built for institutional investors, family offices, and sophisticated retail
;; participants who demand maximum security, transparency, and control over
;; their Bitcoin exposure. Every aspect has been designed with Bitcoin's
;; ethos of trustlessness and verifiability at its core.

;; TOKEN DEFINITION
(define-fungible-token BITVAULT-TOKEN u0)

;; CONSTANTS & ERROR CODES

;; Contract Authority
(define-constant CONTRACT-OWNER tx-sender)

;; Error Codes - Standardized for enterprise integration
(define-constant ERR-NOT-AUTHORIZED (err u1000))
(define-constant ERR-INVALID-PROTOCOL (err u1001))
(define-constant ERR-INVALID-AMOUNT (err u1002))
(define-constant ERR-INSUFFICIENT-STX (err u1003))
(define-constant ERR-COOLDOWN-ACTIVE (err u1004))
(define-constant ERR-NO-STAKE (err u1005))
(define-constant ERR-BELOW-MINIMUM (err u1006))
(define-constant ERR-PAUSED (err u1007))

;; STATE VARIABLES  

;; Contract Control States
(define-data-var contract-paused bool false)
(define-data-var emergency-mode bool false)
(define-data-var stx-pool uint u0)

;; Stacking Configuration Parameters - Optimized for Bitcoin economics
(define-data-var base-reward-rate uint u500) ;; 5% annual base rate (100 = 1%)
(define-data-var bonus-rate uint u100) ;; 1% additional bonus for time-locks
(define-data-var minimum-stake uint u1000000) ;; 1 STX minimum stake (1,000,000 uSTX)
(define-data-var cooldown-period uint u1440) ;; 24 hour unstaking cooldown (blocks)
(define-data-var proposal-count uint u0) ;; Total governance proposals created

;; DATA STRUCTURES

;; Governance Proposal Structure - Enterprise-grade decision making
(define-map Proposals
  { proposal-id: uint }
  {
    creator: principal,
    description: (string-utf8 256),
    start-block: uint,
    end-block: uint,
    executed: bool,
    votes-for: uint,
    votes-against: uint,
    minimum-votes: uint,
  }
)

;; User Account Comprehensive Data - Institutional portfolio tracking
(define-map UserPositions
  principal
  {
    total-collateral: uint,
    total-debt: uint,
    health-factor: uint,
    last-updated: uint,
    stx-staked: uint,
    analytics-tokens: uint,
    voting-power: uint,
    tier-level: uint,
    rewards-multiplier: uint,
  }
)

;; Individual Stacking Position Details - Granular position management
(define-map StakingPositions
  principal
  {
    amount: uint,
    start-block: uint,
    last-claim: uint,
    lock-period: uint,
    cooldown-start: (optional uint),
    accumulated-rewards: uint,
  }
)

;; Tier System Configuration Matrix - Scalable reward optimization
(define-map TierLevels
  uint
  {
    minimum-stake: uint,
    reward-multiplier: uint,
    features-enabled: (list 10 bool),
  }
)