const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
var currentAccount = null;
const contractAddress = "0x281Fc06B19191C99e205AF1A0A500d163fC8736F";
var semanticSwapInstance = null;
var orderBookInstance = null;

const DownloadContractInfo = async () => {
    try {
        const semanticSwapContractInfo = await (await fetch("/SemanticSwap.json")).json();
        semanticSwapInstance = new web3.eth.Contract(semanticSwapContractInfo.abi, contractAddress);
        const orderBookContractInfo = await (await fetch("/OrderBook.json")).json();
        const orderBookAddress = await semanticSwapInstance.methods.orderBook().call();
        console.log(orderBookAddress);
        orderBookInstance = new web3.eth.Contract(orderBookContractInfo.abi, orderBookAddress);
    } catch (error) {
        console.log(error);
    }
}

const ConnectWallet = async () => {
  const accounts = await web3.eth.getAccounts();
  const account = accounts[0];
  console.log(account);
  
  var accountTextBox = document.getElementById("wallet-address");
  accountTextBox.innerText = account;
  currentAccount = account;
}

const SubmitAsk = async () => {
    try {
        const receipt = await web3.eth.sendTransaction({
            from: currentAccount,
            to: contractAddress,
            value: '1'
        });
    
        console.log(receipt);
    } catch(error) {
        console.log(error);
    }
}

const SubmitOffer = async () => {

}

const Initialize = async () => {
    await ConnectWallet();
    await DownloadContractInfo();
}

// Try to connect right away and download contract info
Initialize();
