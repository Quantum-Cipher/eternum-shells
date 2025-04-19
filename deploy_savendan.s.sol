// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../deploy_savendan.s.sol";

contract DeploySAVEDAN is Script {
    function run() external {
        vm.broadcast();
        new SAVEDAN();
    }
}
