const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
var currentAccount = null;
const contractAddress = "0x4E60138CBB19FdBAC0233eD38E5dD5F3DDCDF838";
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
        var askPayloadTextBox = document.getElementById("new-ask-payload");
        const askPayload = askPayloadTextBox.value;
        console.log("Submittig new ask '" + askPayload + "'");

        var receipt = await orderBookInstance.methods.submitAsk(askPayload).send({
            from: currentAccount
        });
    
        console.log(receipt);
    } catch(error) {
        console.log(error);
    }
}

const SubmitOffer = async () => {
    try {
        var offerPayloadTextBox = document.getElementById("new-offer-payload");
        const offerPayload = offerPayloadTextBox.value;
        console.log("Submittig new offer '" + offerPayload + "'");

        var receipt = await orderBookInstance.methods.submitAsk(offerPayload).send({
            from: currentAccount
        });
    
        console.log(receipt);
    } catch(error) {
        console.log(error);
    }
}

const Initialize = async () => {
    await ConnectWallet();
    await DownloadContractInfo();
}

// Try to connect right away and download contract info
Initialize();
