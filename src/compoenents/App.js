
import Web3 from 'web3';

function App() {

    const loadWeb3 = async () => {
        if (window.ethereum) {
            window.web3 = new Web3(window.ethereum);
        } else {
            if (window.web3) {
                window.web3 = new Web3(window.web3.currentProvider);
            } else {
                window.alert("No ethereum browser detected. You can check out MetaMask!");
            }
        }
    }

    const getBlockchainData = async () => {
        const web3 = window.web3;
        const accounts = await web3.eth.getAccounts();
        console.log(accounts);
    }
}