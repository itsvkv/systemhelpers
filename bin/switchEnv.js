#!/usr/bin/env node
const path = require("path");
const childProcess = require("child_process");

const cwd = process.cwd();
const switchCommand = getPackageJson().scripts["switch-env"]
if (switchCommand) {
    childProcess.execSync(`npm run switch-env`, { stdio: 'inherit' })
}
else {
    console.log('Nothing to switch')
}

function getPackageJson() {
    return require(path.join(cwd, "package.json"));
}