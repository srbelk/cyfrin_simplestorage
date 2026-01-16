// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18; //this is the version of solidity we are using

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    // Variable visability options "internal" (default), "public", "private"
    uint256 public myfavoriteNumber; // uint ==uint256, uint is 0 if unassigned

    // struct used to group data into a new type
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // Use [] to create an array.
    // Empty brackets [] == dynamic. Size can change
    // Brackets with a number [3] == static. Size is limited
    Person[] public listOfPeople; 

    // A Mapping is a group of key value pairs, simillar to a dictionary
    mapping (string => uint256) public nameToFavoriteNumber;


    // Function visability options "public" (default), "internal", "external" (functions only), "private"
    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }

    // Function modifiers options "view", "pure"
    function retrieve() public view returns (uint256) {
        return myfavoriteNumber;
    }

    // The EVM can read from calldata, memory, storage
    // The EVM can write to memory and storage
    // calldata and memory variables only last for the duration of the function call
    // calldata and memory are typically for reading the data only
    // Inside of functions most variables default to memory
    // strings are an array of bytes. arrays are a special type and must specify
    // memory variables are temporary and can be modified, 
    // calldata variables are temporary and cannot be modified
    // storage variables are permanent and can be modified
    // storage variables update the state
    function addPerson (uint256 _favoriteNumber , string memory _name) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;    
   }

   
}