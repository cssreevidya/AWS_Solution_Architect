
# 1. AWS CLI installation path
$AwsCliPath = "C:\Program Files\Amazon\AWSCLIV2"

# 2. Check whether AWS CLI is installed
if (Test-Path "$AwsCliPath\aws.exe") {
    Write-Host "AWS CLI is already installed."
}
else {
    Write-Host "AWS CLI is not installed."
    Write-Host "Download it from https://awscli.amazonaws.com/AWSCLIV2.msi"
    exit 1
}

# 3. Add AWS CLI to PATH permanently
$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")

if (($UserPath -split ';') -notcontains $AwsCliPath) {
    $NewPath = if ([string]::IsNullOrWhiteSpace($UserPath)) {
        $AwsCliPath
    } else {
        "$UserPath;$AwsCliPath"
    }

    [Environment]::SetEnvironmentVariable("Path", $NewPath, "User")
    Write-Host "AWS CLI added to User PATH."
}

# 4. Enable AWS CLI Auto-Prompt
[Environment]::SetEnvironmentVariable(
    "AWS_CLI_AUTO_PROMPT",
    "on-partial",
    "User"
)

Write-Host "AWS CLI Auto-Prompt enabled."

# 5. Verify installation
& "$AwsCliPath\aws.exe" --version

Write-Host "AWS setup completed successfully."
