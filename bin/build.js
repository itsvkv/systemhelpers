#!/usr/bin/env node
//use strict
const yargs = require('yargs/yargs')
const { hideBin } = require('yargs/helpers')
const argv = yargs(hideBin(process.argv)).argv
const childProcess = require("child_process");


const cwd = process.cwd();
if (cwd.includes("client")) {
    const [environment] = argv._;
    let command = '';
    switch (environment) {
        case 'd':
            command = "npm run app:firebase:dev";
            break;
        case "q":
            command = "npm run app:firebase:qa";
            break;
        case "s":
            command = "npm run app:firebase:stage";
            break;
        case "p":
            command = "npm run app:firebase:prod";
            break;
    }
    childProcess.execSync(command, { stdio: 'inherit' })
}
else {
    const command = getPackageJson().scripts["build"];
    childProcess.execSync(command, { stdio: 'inherit' })
}
