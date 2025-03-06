// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//lib/openzeppelin-contracts/contracts/finance/VestingWallet.sol

import "lib/forge-std/src/Script.sol";
import "../src/Lender.sol";
import "../src/Staking.sol";
import "../src/Beedle.sol";

import {WETH} from "lib/solady/src/tokens/WETH.sol";
import {VestingWallet} from "lib/openzeppelin-contracts/contracts/finance/VestingWallet.sol";

contract LenderScript is Script {
    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        new Lender();
        address beedle = address(new Beedle());
        address weth = address(new WETH());
        address staking = address(new Staking(beedle, weth));

        vm.stopBroadcast();
    }
}
