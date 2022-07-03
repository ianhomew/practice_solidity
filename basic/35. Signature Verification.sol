pragma solidity ^0.5.0;


/*
How to sign and verify messages?

# Signing
1. Create message to sign
2. Hash the message
3. Sign the hash (off chain, keep your private key secret)

# Verify
1. Recreate hash from the original message
2. Recover signer from signature and hash
3. Compare recovered signer to claimed signer
*/

contract VerifySignature {
    
    // hash original message
    function getMessageHash(
        address _to, 
        uint _amount, string memory _message, uint _nonce
    ) 
        public pure returns (bytes32) 
    {
        // 以太坊直接對公鑰做keccak256哈希 得到32bytes 取前20bytes 加上0x 即為地址
        return keccak256(abi.encodePacked(_to, _amount, _message, _nonce));
    }

    /*
    Signature is produced by signing a keccak256 hash with the following format:
    "\x19Ethereum Signed Message\n" + len(msg) + msg
    sign 樣式:
        \x19Ethereum Signed Message\n32...message hash goes here...
    */

    // hash the hashed message 這邊是最後簽名(signature))的值
    function getEthSignedMessageHash(bytes32 _messageHash)
        public pure returns (bytes32)
    {
        return keccak256(abi.encodePacked(
            "\x19Ethereum Signed Message\n32",
            _messageHash
        ));
    }
    




    function verify (
        address _signer,
        address _to, uint _amount, string memory _message, uint _nonce,
        bytes memory _signature
    ) 
        public pure returns (bool)
    {

// 1. Recreate hash from the original message
// 2. Recover signer from signature and hash
// 3. Compare recovered signer to claimed signer
        bytes32 messageHash = getMessageHash(_to, _amount, _message, _nonce);
        bytes32 ehtSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recoverSigner(ehtSignedMessageHash, _signature) == _signer;
    }

    function recoverSigner(
        bytes32 _ehtSignedMessageHash, bytes memory _signature
    ) 
        public pure returns (address)
    {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);

        return ecrecover(_ehtSignedMessageHash, v, r, s);
    }

    function splitSignature(bytes memory _sig) 
        public pure returns (bytes32 r, bytes32 s, uint8 v)
    {
        require(_sig.length == 65, "invalid sugnature length");

        assembly {
            r := mload(add(_sig, 32))
            // add(x ,y) -> x + y
            // add(_sig, 32) -> skips first 32 bytes
            // mload(p)   loads next 32 bytes starting at the memory address p
            s := mload(add(_sig, 64))
            v := byte(0, mload(add(_sig, 96)))
        }
    }




}