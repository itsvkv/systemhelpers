#!/usr/bin/env node
const path = require("path");
const childProcess = require("child_process");

const cwd = process.cwd();
if (getPackageJson().scripts["android"]) {
    childProcess.execSync(`npm run android`, { stdio: 'inherit' })
}
else {
    const command = getPackageJson().scripts["start"];
    childProcess.execSync(command, { stdio: 'inherit' })
}

function getPackageJson() {
    return require(path.join(cwd, "package.json"));
}