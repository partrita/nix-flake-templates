#!/usr/bin/env node

console.log("Hello, Nix Flakes Node.js!");

// Example: Accessing arguments
const args = process.argv.slice(2);
if (args.length > 0) {
  console.log("Arguments received:", args);
}
