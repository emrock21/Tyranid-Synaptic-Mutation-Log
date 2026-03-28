// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Tyranid Synaptic Mutation Log
/// @notice Record synaptic mutations within Tyranid nodes and vote if they are favorable or degenerate.
/// @dev Simple, safe, text-only contract.

contract TyranidSynapticMutationLog {

    struct Mutation {
        string node;        // Synaptic node or organism
        string stimulus;    // Environmental or combat stimulus
        string adaptation;  // Mutation or adaptation observed
        string functionGained; // New function or capability
        string remark;      // Short hive-mind observation
        address creator;    // Who recorded it
        uint256 favorable;  // Favorable votes
        uint256 degenerate; // Degenerate votes
        uint256 createdAt;  // Timestamp
    }

    Mutation[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event MutationRecorded(uint256 indexed id, string node, string adaptation, address indexed creator);
    event MutationVoted(uint256 indexed id, bool favorable, uint256 favorableVotes, uint256 degenerateVotes);

    constructor() {
        logs.push(
            Mutation({
                node: "Example Node (Fill your own below)",
                stimulus: "Describe stimulus",
                adaptation: "Describe adaptation",
                functionGained: "Describe new function",
                remark: "Short hive-mind remark",
                creator: address(0),
                favorable: 0,
                degenerate: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordMutation(
        string calldata node,
        string calldata stimulus,
        string calldata adaptation,
        string calldata functionGained,
        string calldata remark
    ) external {
        require(bytes(node).length > 0, "Node required");

        logs.push(
            Mutation({
                node: node,
                stimulus: stimulus,
                adaptation: adaptation,
                functionGained: functionGained,
                remark: remark,
                creator: msg.sender,
                favorable: 0,
                degenerate: 0,
                createdAt: block.timestamp
            })
        );

        emit MutationRecorded(logs.length - 1, node, adaptation, msg.sender);
    }

    function voteMutation(uint256 id, bool favorable) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Mutation storage m = logs[id];

        if (favorable) {
            m.favorable += 1;
        } else {
            m.degenerate += 1;
        }

        emit MutationVoted(id, favorable, m.favorable, m.degenerate);
    }

    function totalMutations() external view returns (uint256) {
        return logs.length;
    }
}
