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
    const router = '0xD99D1c33F9fC3444f8101754aBC46c52416550D1';


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
        let User1;
        
        it('transfering tokens to user#1 :', async()=>{
            await tiger.connect(owner).transfer(add2.address, toWei('100'));
            User1 = await tiger.balanceOf(add2.address)
            expect(User1).to.equal(toWei('100'));
        });
        it('Selling => Transfer to pancakeSwap : ', async()=>{
            tiger.connect(owner).SetupEnableWhitelistTrading();
            await tiger.connect(add2).transfer(router, toWei('100'));
            // expect(router).to.equal(toWei('100'));
        });
    });
});

