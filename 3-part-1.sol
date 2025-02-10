// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MyToken is ERC20 {
    // The ERC20 token with a name, symbol, and 2000 pre-mined tokens
    constructor() ERC20("AstanaIT_2326", "MTK") {
        _mint(msg.sender, 2000 * 10 ** decimals()); // Mint 2000 tokens to the deploying address
    }
    // Function to return the block timestamp of the latest transaction in a human-readable format
    function getLatestTransactionTimestamp() public view returns (string memory) {
        return _formatTimestamp(block.timestamp);
    }
    // Helper function to format the timestamp in a human-readable format
    function _formatTimestamp(uint256 timestamp) internal pure returns (string memory) {
        return string(abi.encodePacked(
            uint2str((timestamp / 60 / 60 / 24) + 1), " days since Unix epoch"
        ));
    }
    // Function to retrieve the address of the sender of the transaction
    function getTransactionSender() public view returns (address) {
        return msg.sender;
    }
    // Function to retrieve the address of the receiver of the transaction
    function getTransactionReceiver(address receiver) public pure returns (address) {
        return receiver;
    }
    // Helper function to convert uint to string (used in timestamp formatting)
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}