// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
//import code from another file
//use {} to specify what you want to import from the source file
//"name of source file" in quotes
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        //"new" keyword lets the EVM know to deploy a contract 
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newsimpleStorageNumber) public {
        // To interact with a contract you need the Address and ABI
        //ABI is Application Binary Interface
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newsimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}