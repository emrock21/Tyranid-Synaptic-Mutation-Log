# Tyranid Synaptic Mutation Log

A simple on-chain record of Tyranid synaptic mutations.  
Users document mutated nodes, triggering stimuli, resulting adaptations, and new functions gained.  
The community votes each mutation as **favorable** or **degenerate**, reflecting the Hive Mind’s evaluation.

Fully text-based, permissionless, and built for creative Warhammer 40K world-building on Base.

---

## Contract

Deployed on Base:  
`0xba76574b83a3c7b52c49a17eaf93e974b3cdd227`  
https://basescan.org/address/0xba76574b83a3c7b52c49a17eaf93e974b3cdd227#code

Main file: `contracts/TyranidSynapticMutationLog.sol`

---

## How it works

Each mutation entry stores:

- `node` – Synaptic node or organism  
- `stimulus` – Environmental or combat trigger  
- `adaptation` – Mutation or adaptation observed  
- `functionGained` – New biological function  
- `remark` – Short hive-mind observation  
- `favorable` / `degenerate` – Community votes  

Entry **0** is a built-in example.

---

## Example

```solidity
recordMutation(
  "Synapse Node L‑12",
  "High-pressure aquatic environment",
  "Dense carapace layering",
  "Improved depth resistance",
  "Adaptation stable"
);

Closing Note
A fragment of the Hive Mind etched onto the chain —
a living record of mutation, adaptation, and evolution.
Every entry strengthens the swarm.
