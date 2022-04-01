
  // All Requirments to import  
  require("@nomiclabs/hardhat-waffle");
  require('hardhat-contract-sizer');
  require("hardhat-gas-reporter");


  // Main Accounts 
  task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
    const accounts = await hre.ethers.getSigners(()=>{
      
    });
  
    for (const account of accounts) {
      console.log(account.address);
    }
  });
  


  // Main body module
module.exports = {

  // solidity: "0.8.0",
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  optimizer: {
    enabled: true,
    runs: 200
},
contractSizer: {
  alphaSort: true,
  runOnCompile: true,
  disambiguatePaths: false,
},
gasReporter: {
  currency: 'CHF',
  gasPrice: 21
}
};
