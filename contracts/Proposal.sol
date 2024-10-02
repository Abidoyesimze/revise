// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Proposals {
    struct Voter {
        bool voted;
        uint vote;
    }

    struct Proposal {
        string name;
        uint voteCount;
    }

    mapping(address => Voter) public voters;
    Proposal[] public proposals;

    constructor() {
        // Initialize with some default proposals
        proposals.push(Proposal("Proposal 1", 0));
        proposals.push(Proposal("Proposal 2", 0));
        proposals.push(Proposal("Proposal 3", 0));
    }

    function vote(uint proposalIndex) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "Already voted.");
        require(proposalIndex < proposals.length, "Invalid proposal index.");

        sender.voted = true;
        sender.vote = proposalIndex;

        proposals[proposalIndex].voteCount += 1;
    }

    function winningProposal() public view returns (uint winningProposal_) {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }

    function winnerName() public view returns (string memory winnerName_) {
        winnerName_ = proposals[winningProposal()].name;
    }
}