const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
var currentAccount = null;

const ConnectWallet = async () => {
    const accounts = await web3.eth.getAccounts();
    const account = accounts[0];
    console.log(account);
    
    var accountTextBox = document.getElementById("wallet-address");
    accountTextBox.innerText = account;
    currentAccount = account;
  }
