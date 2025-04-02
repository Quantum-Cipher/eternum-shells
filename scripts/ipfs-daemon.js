// ipfs-daemon.js
const IPFS = require('ipfs-core')

async function startIPFS() {
  const ipfs = await IPFS.create()
  const { id } = await ipfs.id()
  console.log('🔥 IPFS node is running with id:', id)
  // Keep the process alive
}

startIPFS().catch(err => {
  console.error('Error starting IPFS:', err)
})
