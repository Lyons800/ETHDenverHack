const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
var currentAccount = null;
const contractAddress = "0x5eE1F28F4ec5EBEB9b63978474CaaaBEBA030171";
var semanticSwapInstance = null;

const DownloadContractInfo = async () => {
    try {
        const semanticSwapContractInfo = await (await fetch("/SemanticSwap.json")).json();
        semanticSwapInstance = new web3.eth.Contract(semanticSwapContractInfo.abi, contractAddress);
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

const SubmitMatch = async () => {
    try {
        var reason = "IEML";
        var matchLinks = [
            {
                producer: "0xfD52d9FA50f18C6Ff737ACcAE49052c1872eD975",
                consumer: "0xa40c14c95Bf871769743EcB24313f35486DC5FfB"
            }
        ];

        var receipt = await semanticSwapInstance.methods.proposeMatch(reason, matchLinks).send({
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
