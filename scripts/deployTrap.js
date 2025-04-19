const fs = require('fs');
const exec = require('child_process').exec;

console.log("👁️ Deploying Ghostwire trap...");

exec('bash ~/Eternum/Ghostwire/ghostwire_sentinel.sh', (err, stdout, stderr) => {
  if (err) {
    console.error("Trap failed:", stderr);
    return;
  }
  console.log("✅ Trap initialized:", stdout);
});
