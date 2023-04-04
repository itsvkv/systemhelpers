
function Test-DirectoryInGitRepo {
    $gitDir = (Get-Item .).FullName
    while ($gitDir) {
        if (Test-Path -PathType Container (Join-Path $gitDir ".git")) {
            return $true
        }
        $gitDir = Split-Path $gitDir -Parent
    }
    return $false
}

if (Test-DirectoryInGitRepo) {
    # Get the "ERP-XXXXX" number from the current Git branch name
    $branchName = (git rev-parse --abbrev-ref HEAD)
    if ($branchName -match "ERP-\d+") {
        $erpNumber = $Matches[0]
        Write-Host "ERP number: $erpNumber"
        # Get text input from the user
        $inputText = Read-Host "Enter commit message"
        # Append the ERP number to the input text
        $outputText = "$erpNumber $inputText"
        stagefiles.ps1
        git commit -m $outputText
    }
    else {
        Write-Host "No ERP number found in branch name."
        $inputText = Read-Host "Enter commit message"
        git commit -m $outputText
    }

}
else {
    Write-Host "Current directory is not a Git repository."
}
