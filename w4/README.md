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
```

```
--------练习题--------第四周
• 部署⾃⼰的 ERC20 合约MyToken
• 编写合约MyTokenMarket 实现：
• AddLiquidity(): 函数内部调⽤ Uniswap V2Router 添加MyToken与 ETH 的流动 性
• buyToken(): ⽤户可调⽤该函数实现购买MyToken

• 完成代币兑换后，直接质押 MasterChef
 *  withdraw():从 MasterChef 提取 Token 方法

```

自己部署了 V2-factory， v2-periphery，sushi 

在OKT上部署的，合约地址在deployments/dev 文件夹下
