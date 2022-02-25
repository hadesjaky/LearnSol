var VBTC = artifacts.require("VBTC");

contract("VBTC", function(accounts) {
  var Ins;
  if("VBTC", function(){
    return VBTC.deployed()
      .then(function(instance){
        Ins = instance;
	return Ins.count();	  
      }).then(function(){
        return Ins.counter();
      }).then(function(count){
        assert.equal(count, 1000000000000000);
      });
  });
});
