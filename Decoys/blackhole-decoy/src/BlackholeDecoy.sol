// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract BlackholeDecoy {
    event UnauthorizedAccessLogged(address indexed intruder, string message, uint256 timestamp);

    mapping(address => bool) private whitelist;

    modifier onlyWhitelisted() {
        if (!whitelist[msg.sender]) {
            emit UnauthorizedAccessLogged(msg.sender, "⚠️ Unauthorized access detected", block.timestamp);
            revert("Access denied.");
        }
        _;
    }

    constructor() {
        whitelist[msg.sender] = true;
    }

    function fakeWithdraw() public onlyWhitelisted {
        revert("Funds unavailable. Exit code 31337.");
    }

    function markAccess() public {
        emit UnauthorizedAccessLogged(msg.sender, "🕳️ Decoy interaction logged", block.timestamp);
    }

    function isWhitelisted(address user) public view returns (bool) {
        return whitelist[user];
    }

    function baitFunction() external payable {
        emit UnauthorizedAccessLogged(msg.sender, "🚨 Bait activated", block.timestamp);
        revert("Blackhole activated.");
    }
}
