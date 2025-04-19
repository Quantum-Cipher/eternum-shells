// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../deploy_mycelium_engine.s.sol";

contract DeployMyceliumEngine is Script {
    function run() external {
        vm.broadcast();
        new MyceliumEternumEngine();
    }
}
