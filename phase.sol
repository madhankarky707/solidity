
Phase 1
1. I should be able to npm install, truffle migrate and execute npm run dev and see your home page with your project name
2. When your webpage loads, if web3 object is not found, show an alert saying install Metamask or use web3js supported browser

Phase 2
1. The Ethereum account/wallet user should be able to register as a broker by staking Ether in the smart contract
2. Implement the frontend where user enters the amount they want to stake in a text box and hits submit.
3. The frontend should display all the brokers and amount they have staked

Phase 3
1. When broker is on the website, the frontend should show 3 text boxes where broker can enter the stock symbol, strike time and strike price and hit submit
2. Implement the smart contract functionality to store the offering created by that broker

Phase 4
1. Enhance the frontend functionality to show the offerings created by each broker
2. Next to the offering should be a text box and bid button
3. Trader should be able to enter the Ether amount in the textbox and click bid, the bid should be recorded
4. On bidding, the smart contract should store the trader’s money

Phase 5
1. If the time has expired, a button should appear next to the offering called “Finalize” and a radio button to select if broker won or trader won.
2. Select a radio button and click finalize to issue the payout
3. Implement the smart contract so the amount is dispatched to the broker or all the traders who bid

Phase 6
1. Enhance the functionality for trader to withdraw their bid before time expires
2. Implement the frontend functionality where trader clicks on withdraw and Ether is transferred to his wallet

Phase 7
1. Implement the functionality in the smart contract for trader to increase or decrease their bid
2. Implement the frontend functionality where trader can enter the amount they want to increase by and hit submit
3. Implement the frontend functionality where trader can enter the amount they want to decrease by and hit submit

Phase 8
1. Implement the functionality for broker to deregister from the network if they don’t have any active offerings
2. Implement the frontend functionality where clicking on “Withdraw” button will deregister the broker
