var wasm = require('./distance.js')();

console.log(wasm.exports.square(2));

console.log(wasm.exports['f64.distance'](1, 1, 2, 2));