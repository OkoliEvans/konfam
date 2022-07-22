//SPDX-License-Identifier: MIT

/*
Konfam is a test smart contract that was created to help combat the menace of fake products. 
The contract takes in product name and batch number as input, and upon calling the batch number
returns the name of the product. If a product name is returned by a particular batch number, 
then the product is genuine. More work still to be done though.
*/
pragma solidity >= 0.5.0 <0.9.0;

contract Konfam {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(uint32 => string) public ConfirmQuality;

    modifier onlyAdmin {
        require(owner == msg.sender, "Unauthorized account");
        _;
    }


    function addProduct (string memory _product, uint32 _batchNumber) public onlyAdmin{
        require(_batchNumber >= 1e5, "Enter 6 numbers and above, but not greater than 16");
        ConfirmQuality[_batchNumber] = _product ;
    }

    function confirmProduct(uint32 _batchNumber) public view returns (string memory _product) {
            return ConfirmQuality[_batchNumber];
        }
    }
