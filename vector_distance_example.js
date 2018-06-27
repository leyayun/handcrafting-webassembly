const wasm = require('./vector_distance')();


const canvasA = document.getElementById('canvasA');
const ctxA = canvasA.getContext("2d");
const imageA = ctxA.getImageData(0, 0, canvasA.width, canvasA.height).data;

const canvasB = document.getElementById('canvasB');
const ctxB = canvasB.getContext("2d");
const imageB = ctxB.getImageData(0, 0, canvasB.width, canvasB.height).data;

// debugger
// console.log(wasm.exports.memory);

wasm.realloc(imageA.byteLength + imageB.byteLength);

let offset = 0;

// Add image A
let imageAPtr = offset;
// wasm.exports.memory.set(imageA, offset);
offset += imageA.byteLength;

// // Add image B
var imageBPtr = offset;
// wasm.exports.memory.set(imageB, offset);

const dist = wasm.exports['i8.distance'](imageAPtr, imageBPtr, imageA.byteLength);
console.log(dist);
