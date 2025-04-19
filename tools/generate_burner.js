#!/usr/bin/env node
const { ethers } = require("ethers");
const fs = require("fs");
const path = require("path");

const wallet = ethers.Wallet.createRandom();

const output = `
🔥 Eternum Burner Wallet
=========================
Address:    ${wallet.address}
Private Key: ${wallet.privateKey}
Mnemonic:   ${wallet.mnemonic.phrase}

Timestamp:  ${new Date().toISOString()}
`;

const vaultPath = path.join(process.env.HOME, "Eternum/vault/burner_wallet.txt");

fs.mkdirSync(path.dirname(vaultPath), { recursive: true });
fs.writeFileSync(vaultPath, output.trim());

console.log(output);
console.log(`✅ Saved to: ${vaultPath}`);
