// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

error Raffle_NotETHEnough();

contract Raffle {
    unit256 private immutable i_entranceFee;
    address payable[] private s_players;

    event RaffleEner(address indexed player)

    construct(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }
    
    function enterRaffle () public payable {
        if(msg.value < i_entranceFee) {
            revert Raffle_NotETHEnough();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEner(msg.sender);
    }

    //function pickRandomWinner () {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayers(uint256 _index) public view returns (address) {
        return s_players[_index];
    }
}