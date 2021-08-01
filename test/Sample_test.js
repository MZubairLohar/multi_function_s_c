const {expect} = require('chai');
const { ethers } = require('hardhat');
const { BigNumber } = require("@ethersproject/bignumber");
    // Wei convertor
function toWei(n) {
    return ethers.utils.parseEther(n);
}
function fromWei(n) {
    return n.div(BigNumber.from("1000000000000000000"));
}
function BnToString(n) {
    return ethers.utils.formatUnits(n, "ether");
}
function toBN(n) {
return BigNumber.from(n);
}
async function etherBalance(addr) {
    return await ethers.provider.getBalance(addr);
}
describe('Tiger contract: ',async()=>{
    let owner,
    Tiger,
    tiger,
    add1,
    add2,
    add3,
    add4;


    beforeEach(async()=>{
        [owner, add1, add2, add3, add4] = await ethers.getSigners();
        Tiger = await ethers.getContractFactory('Tiger');
        tiger = await Tiger.deploy();
        await tiger.deployed(); 
        });
            // Token Name Test 
    describe('Test Name:',()=>{
        it('token name:',async()=>{
            expect(await tiger.name()).to.equal('Tiger Multifarm');
        });
    });
            // Checking Owner's Address
    describe('Owner"s address ', () => {
        it('Owner is :',async()=>{
            expect(await tiger.getOwner()).to.equal(owner.address);
        })
    })
            // Transfer Function Test
    describe('Transfer',()=>{
        it('transfering tokens to pancake', async()=>{

        });
    });
});

