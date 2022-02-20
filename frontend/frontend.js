const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
const contractAddress = "0x6b112699AD0230e718629c272C3D2d40f50B48b6";
var semanticSwapContract = null;
var currentAccount = null;

const DownloadContractInfo = async () => {
    try {
        const contractInfo = await (await fetch("/SemanticSwap.json")).json();
        semanticSwapContract = new web3.eth.Contract(contractInfo.abi);
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
