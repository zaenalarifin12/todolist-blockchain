const Todolist = artifacts.require("./TodoList.sol")

module.exports = function (deployer) {
    deployer.deploy(Todolist)
}

