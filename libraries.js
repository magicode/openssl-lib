const path = require('path');

console.log(
    path.join(__dirname, "linux-x86_64", "lib", "libcrypto.a")
    + " " +
    path.join(__dirname, "linux-x86_64", "lib", "libssl.a")
); 
