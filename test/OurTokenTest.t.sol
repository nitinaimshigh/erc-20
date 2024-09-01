// SPDX-Licence-Identifier: MIT

pragma solidity ^0.8.18;

import{Test} from "forge-std/Test.sol";
import{DeployOurToken} from "../script/DeployOurToken.s.sol";
import{OurToken} from "../src/OurToken.sol";
import{console} from "forge-std/console.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    uint256 public  constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        console.log("address of deployer : ",address(deployer));
        ourToken = deployer.run();
        console.log("address of ourToken : ", address(ourToken));

        vm.prank(msg.sender);
        ourToken.transfer(payable(bob), STARTING_BALANCE);
}

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    }

    function testAliceBalance() public {}
}