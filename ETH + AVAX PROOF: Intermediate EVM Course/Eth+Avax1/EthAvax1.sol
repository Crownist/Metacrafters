// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EthAvax1 {
    address private creator;
    uint256 public currentOffer;
    address public topCandidate;
    bool public biddingProcess;

    constructor() {
        creator = msg.sender;
        currentOffer = 0;
        biddingProcess = true;
    }

    function submitOffer(uint256 amount) public {
        require(biddingProcess, "Bidding process has already ended");
        require(amount > currentOffer, "Offer must be higher than current top offer");

        currentOffer = amount;
        topCandidate = msg.sender;
    }

    function finalizeBidding() public {
        require(biddingProcess, "Bidding process has already ended");
        assert(currentOffer > 0);
        biddingProcess = false;
    }

    function retrieveWinner() public view returns (address) {
        require(biddingProcess == false, "Bidding process is still active");
        return topCandidate;
    }

    function cancelBidding() public {
        if (msg.sender != creator) {
            revert("Only the creator can cancel the bidding");
        }
        if (!biddingProcess) {
            revert("Bidding process has already ended");
        }
        biddingProcess = false;
        currentOffer = 0;
        topCandidate = address(0);
    }
}


