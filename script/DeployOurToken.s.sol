// SPDX-Licence-Identifier: MIT

pragma solidity ^0.8.18;

import{Script} from "forge-std/Script.sol";
import{OurToken} from "../src/OurToken.sol";
import {console} from "forge-std/console.sol";

contract DeployOurToken is Script {

    uint256 constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns(OurToken) {
        vm.startBroadcast();
        OurToken ot = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        console.log("address of ot : ", address(ot));
        return ot;
    }

}