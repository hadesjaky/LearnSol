#  学习作业
  
距离0.4.24版本的智能合约有一段时间了，通过登链的学习又捡回来了。


## W1-1作业

* 安装 Metamask、并创建好账号
* 执行一次转账
* 使用 Remix 创建任意一个合约
* VSCode IDE 开发环境配置
* 使用 Truffle 部署 Counter 合约 到 test 网络（goerli）（提交交易 hash）
* 编写一个测试用例

- [w1_code](https://github.com/hadesjaky/LearnSol/tree/main/w1)

---

## W1-2作业

* 使用Hardhat部署修改后的Counter
* 使用Hardhat测试Counter
* 写一个脚本调用count()

- [w1_2_code](https://github.com/hadesjaky/LearnSol/tree/main/w1_2)

---

## W2-1作业

* 编写⼀个Bank合约：
* 通过 Metamask 向Bank合约转账ETH
* 在Bank合约记录每个地址转账⾦额
* 编写 Bank合约withdraw(), 实现提取出所有的 ETH

- [w2_1_code](https://github.com/hadesjaky/LearnSol/tree/main/w2_1)

---

## W2-2作业

* 编写合约Score，⽤于记录学⽣（地址）分数：
   * 仅有⽼师（⽤modifier权限控制）可以添加和修改学⽣分数
   * 分数不可以⼤于 100； 
* 编写合约 Teacher 作为⽼师，通过 IScore 接⼝调⽤修改学⽣分数。

- [w2_2_code](https://github.com/hadesjaky/LearnSol/tree/main/w2_2)

---

## W3作业

W3_1
* 发⾏⼀个 ERC20 Token： 
  * 可动态增发（起始发⾏量是 0） 
  * 通过 ethers.js. 调⽤合约进⾏转账
* 编写⼀个Vault 合约：
  * 编写deposite ⽅法，实现 ERC20 存⼊ Vault，并记录每个⽤户存款⾦额 ， ⽤从前端调⽤（Approve，transferFrom） 
  * 编写 withdraw ⽅法，提取⽤户⾃⼰的存款 （前端调⽤）
  * 前端显示⽤户存款⾦额

W3_2
* 发行一个 ERC721 Token
   * 使用 ether.js 解析 ERC721 转账事件(加分项：记录到数据库中，可方便查询用户持有的所有NFT)
   * (或)使用 TheGraph 解析 ERC721 转账事件

- [w3_code](https://github.com/hadesjaky/LearnSol/tree/main/w3)

---

## W4作业

W4_1
* 部署自己的 ERC20 合约 MyToken
* 编写合约 MyTokenMarket 实现：
   * AddLiquidity():函数内部调用 UniswapV2Router 添加 MyToken 与 ETH 的流动性
   * buyToken()：用户可调用该函数实现购买 MyToken

W4_2
* 在上一次作业的基础上：
   * 完成代币兑换后，直接质押 MasterChef
   * withdraw():从 MasterChef 提取 Token 方法

- [w4_code](https://github.com/hadesjaky/LearnSol/tree/main/w4)

---

## W5作业

W5_1
* 以太坊测试网上部署两个自己的ERC20合约MyToken，分别在Uniswap V2、V3(网页上)添加流动性
* 作业：编写合约执行闪电贷（参考V2的ExampleFlashSwap）：
   * uniswapV2Call中，用收到的 TokenA 在 Uniswap V3 的 SwapRouter 兑换为 TokenB 还回到 uniswapV2 Pair 中。

W5_2
* 在一笔交易中完成（模拟闪电贷交易）
   * 在 AAVE 中借款 token A
   * 使用 token A 在 Uniswap V2 中交易兑换 token B，然后在 Uniswap V3 token B 兑换为 token A
   * token A 还款给 AAVE

- [w5_code](https://github.com/hadesjaky/LearnSol/tree/main/w5)

---


## W6作业

W6_1
* 设计一个看涨期权Token:
   * 创建期权Token 时，确认标的的价格与行权日期；
   * 发行方法（项目方角色）：根据转入的标的（ETH）发行期权Token；
   * （可选）：可以用期权Token 与 USDT 以一个较低的价格创建交易对，模拟用户购买期权。
   * 行权方法（用户角色）：在到期日当天，可通过指定的价格兑换出标的资产，并销毁期权Token
   * 过期销毁（项目方角色）：销毁所有期权Token 赎回标的。
   
W6_2（可选）
* 实现⼀个通过 DAO 管理资⾦的Treasury：
   * 管理员可以从Treasury合约中提取资⾦withdraw（）
   * 治理Gov合约作为管理员
   * 通过发起提案从Treasury合约资⾦

- [w6_code](https://github.com/hadesjaky/LearnSol/tree/main/w6)

---

