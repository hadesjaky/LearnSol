# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help

在Kovan网络完成的作业
txid: 0xea1319df8ff2d1c9265168c50f33805d9fddad075ce867f9f9c6e750ca869106

W5_1作业 
* 以太坊测试网上部署两个自己的ERC20合约MyToken，分别在Uniswap V2、V3(网页上)添加流动性 
* 作业：编写合约执行闪电贷（参考V2的ExampleFlashSwap）：   
* uniswapV2Call中，用收到的 TokenA 在 Uniswap V3 的 SwapRouter 兑换为 TokenB 还回到 uniswapV2 Pair 中。


W5_2作业 * 在一笔交易中完成（模拟闪电贷交易）    
* 在 AAVE 中借款 token A    
* 使用 token A 在 Uniswap V2 中交易兑换 token B，然后在 Uniswap V3 token B 兑换为 token A   
* token A 还款给 AAVE

```
遇到的问题，AAVE借款，前面使用自己创建的WETH和GBC代币，没有进入AAVE的交易对，导致部署FlashLoanAAVE合约失败，getPool()获取不到 没有找到如何在AAVE市场提供抵押

```

```
