const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
var currentAccount = null;
const contractAddress = "0x4ae08DE4741cB0a889FF310D3E36775e268e53DE";
var semanticSwapInstance = null;
var orderBookInstance = null;
var orderContractInfo = null;

const DownloadContractInfo = async () => {
    try {
        const semanticSwapContractInfo = await (await fetch("/SemanticSwap.json")).json();
        const orderBookContractInfo = await (await fetch("/OrderBook.json")).json();
        orderContractInfo = await (await fetch("/Order.json")).json();
        
        semanticSwapInstance = new web3.eth.Contract(semanticSwapContractInfo.abi, contractAddress);
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

        var receipt = await orderBookInstance.methods.submitOffer(offerPayload).send({
            from: currentAccount
        });
    
        console.log(receipt);
    } catch(error) {
        console.log(error);
    }
}

const ListAsks = async () => {
    const length = await orderBookInstance.methods.askLength().call();
    console.log(length);

    const container = document.getElementById("open-asks");

    for (var i = 0; i < length; i++) {
        const response = await orderBookInstance.methods.getAsk(i).call();
        console.log(response);
        var order = new web3.eth.Contract(orderContractInfo.abi, response);
        const statement = await order.methods.statement().call();
        console.log(statement);

        const node = document.createElement("li");
        const textnode = document.createTextNode(statement);
        node.appendChild(textnode);
        container.appendChild(node);
    }
} 

const ListOffers = async () => {
    const length = await orderBookInstance.methods.offerLength().call();
    console.log(length);

    const container = document.getElementById("open-offers");

    for (var i = 0; i < length; i++) {
        const response = await orderBookInstance.methods.getOffer(i).call();
        console.log(response);
        var order = new web3.eth.Contract(orderContractInfo.abi, response);
        const statement = await order.methods.statement().call();
        console.log(statement);

        const node = document.createElement("li");
        const textnode = document.createTextNode(statement);
        node.appendChild(textnode);
        container.appendChild(node);
    }
} 

const Initialize = async () => {
    await ConnectWallet();
    await DownloadContractInfo();
    await ListAsks();
    await ListOffers();
}

// Try to connect right away and download contract info
Initialize();
