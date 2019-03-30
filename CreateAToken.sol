pragma solidity ^0.5.0;

contract ERC20 {
    string public name;
    uint256 public totalSupply;
    address public owner;
    
    mapping(address => uint256) private balances;
    
    constructor(uint256 _amount, string memory _name) public {
        name = _name;
        balances[msg.sender] = _amount;
        totalSupply = _amount;
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "you're not the owner");
        _;
    }
    
    function transfer(address to, uint256 amount) public {
        require(amount <= balances[msg.sender], "you're poor");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
    
    function balanceOf(address user) public view returns (uint256) {
        return balances[user];
    }
    
    function mintToken(address user, uint256 amount) public onlyOwner {
        totalSupply += amount;
        balances[user] += amount;
    }
    
}
