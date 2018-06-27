var wasm = require('./square.js')();

console.log(wasm.exports.square(2));