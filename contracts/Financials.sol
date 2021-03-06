pragma solidity ^0.6.0;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.6/ChainlinkClient.sol";

contract AuditYearAPIConsumer is ChainlinkClient {
  
    string public auditYear;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    /**
     Oracle on Kovan for Get request bytes32
     */
    constructor() public {
        setPublicChainlinkToken();
        oracle = 0x56dd6586DB0D08c6Ce7B2f2805af28616E082455;
        jobId = "c128fbb0175442c8ba828040fdd1a25e";
        fee = 0.1 * 10 ** 18; // 0.1 LINK
    }
    
    /**
     * Create a Chainlink request to retrieve API response, find the target data,
     * At Path
     */
    function requestAuditYear() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        // Set the URL to perform the GET request on
        request.add("get", "http://ec2-3-83-110-40.compute-1.amazonaws.com:5000/fetchIncomeTaxReturns/fromDate/16-08-2020/toDate/19-08-2020/pan/000");
        
        // Set the path to find the desired data in the API response, where the response format is:
    
        request.add("path", "ITR3.AssessmentYear");
        
        
        // Sends the request
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    /**
     * Receive the response in the form of bytes32
     */ 
    function fulfill(bytes32 _requestId, bytes32 _returnData) public recordChainlinkFulfillment(_requestId)
    {
        auditYear = bytes32ToString(_returnData);
    }
    /**
     *  convert to string 
     */
     function bytes32ToBytes(bytes32 _bytes32) public returns (bytes memory){
        // string memory str = string(_bytes32);
        // TypeError: Explicit type conversion not allowed from "bytes32" to "string storage pointer"
        bytes memory bytesArray = new bytes(32);
        for (uint256 i; i < 32; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return bytesArray;
    }//
    
    function bytes32ToString(bytes32 _bytes32) public returns (string memory){
        bytes memory bytesArray = bytes32ToBytes(_bytes32);
        return string(bytesArray);
    }//

}

contract AuditDateAPIConsumer is ChainlinkClient {
    
      
    string public auditDate;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    /**
     Oracle on Kovan for Get request bytes32
     */
    constructor() public {
        setPublicChainlinkToken();
        oracle = 0x56dd6586DB0D08c6Ce7B2f2805af28616E082455;
        jobId = "c128fbb0175442c8ba828040fdd1a25e";
        fee = 0.1 * 10 ** 18; // 0.1 LINK
    }
    
    /**
     * Create a Chainlink request to retrieve API response, find the target data
     */
    function requestAuditDate() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        // Set the URL to perform the GET request on
        request.add("get", "http://ec2-3-83-110-40.compute-1.amazonaws.com:5000/fetchIncomeTaxReturns/fromDate/16-08-2020/toDate/19-08-2020/pan/000");
        
        // Set the path to find the desired data in the API response, where the response format is:
    
        request.add("path", "ITR3.AuditInfo.AuditDate");
        
        
        // Sends the request
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    /**
     * Receive the response in the form of bytes32
     */ 
    function fulfill(bytes32 _requestId, bytes32 _returnData) public recordChainlinkFulfillment(_requestId)
    {
        auditDate = bytes32ToString(_returnData);
    }
    
     function bytes32ToBytes(bytes32 _bytes32) public returns (bytes memory){
        // string memory str = string(_bytes32);
        // TypeError: Explicit type conversion not allowed from "bytes32" to "string storage pointer"
        bytes memory bytesArray = new bytes(32);
        for (uint256 i; i < 32; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return bytesArray;
    }//
    
    function bytes32ToString(bytes32 _bytes32) public returns (string memory){
        bytes memory bytesArray = bytes32ToBytes(_bytes32);
        return string(bytesArray);
    }//
    
}

contract TradeNameAPIConsumer is ChainlinkClient {
    
      
    string public tradeName;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    /**
     * Kovan Oracle
     */
    constructor() public {
        setPublicChainlinkToken();
        oracle = 0x56dd6586DB0D08c6Ce7B2f2805af28616E082455;
        jobId = "c128fbb0175442c8ba828040fdd1a25e";
        fee = 0.1 * 10 ** 18; // 0.1 LINK
    }
    
    /**
     * Create a Chainlink request to retrieve API response, find the target 
     */
    function requestTradeName() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        // Set the URL to perform the GET request on
        request.add("get", "http://ec2-3-83-110-40.compute-1.amazonaws.com:5000/fetchIncomeTaxReturns/fromDate/16-08-2020/toDate/19-08-2020/pan/000");
        
        // Set the path to find the desired data in the API response, where the response format is:
    
        request.add("path", "ITR3.NatOfBus.NatureOfBusiness.TradeName1");
        
        
        // Sends the request
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    /**
     * Receive the response in the form of bytes32
     */ 
    function fulfill(bytes32 _requestId, bytes32 _returnData) public recordChainlinkFulfillment(_requestId)
    {
        tradeName = bytes32ToString(_returnData);
    }
    
     function bytes32ToBytes(bytes32 _bytes32) public returns (bytes memory){
        // string memory str = string(_bytes32);
        // TypeError: Explicit type conversion not allowed from "bytes32" to "string storage pointer"
        bytes memory bytesArray = new bytes(32);
        for (uint256 i; i < 32; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return bytesArray;
    }//
    
    function bytes32ToString(bytes32 _bytes32) public returns (string memory){
        bytes memory bytesArray = bytes32ToBytes(_bytes32);
        return string(bytesArray);
    }//
    
}


