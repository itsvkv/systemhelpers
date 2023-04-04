#!/usr/bin/env node
const { execSync } = require('child_process');
const inquirer = require('inquirer');

// Get a list of modified but not staged files
const statusOutput = execSync('git status --porcelain').toString();
const modifiedFiles = statusOutput
    .split('\n')
    .filter(line => line.trim().startsWith('M '))
    .filter(line => !line.trim().startsWith('M  '))
    .map(line => line.trim().substring(2));
// Prompt the user to select files for staging
inquirer
    .prompt([
        {
            type: 'checkbox',
            name: 'files',
            message: 'Select files to stage',
            choices: modifiedFiles,
        },
    ])
    .then((answers) => {
        // Stage the selected files using Git
        const { files } = answers;
        const cmd = `git add ${files.join(' ')}`;
        execSync(cmd);
        console.log(`${files.length} file(s) staged.`);
    })
    .catch((error) => {
        console.error(error);
    });