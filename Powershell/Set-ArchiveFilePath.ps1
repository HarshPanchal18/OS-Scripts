Function Set-ArchiveFilePath{
    [CmdletBinding()] # Declare CmdletBinding and o/p type
    [OutputType([string])]
    param( # Defining parameters
        [Parameter(Mandatory=$true)]
        [string]$ZipPath,

        [Parameter(Mandatory=$true)]
        [string]$ZipPrefix,

        [Parameter(Mandatory=$true)]
        [datetime]$Date
    )

    if(-not (Test-Path -Path $ZipPath)) {
        New-Item -Path $ZipPath -ItemType Directory | Out-Null
        Write-Verbose "Create folder '$ZipPath'" # Including verbose output for testing and troubleshoot
    }

    $timeStamp = $Date.ToString('yyyyMMdd') # Create timestamp based on the date
    $ZipName = "$($ZipPrefix)$($timeStamp).zip" # Construct filename
    $ZipFile = Join-Path $ZipPath $ZipName # Set the full path of the zip file

    if(Test-Path -Path $ZipFile) {
        throw "The file $ZipFile already exists"
    }

    $ZipFile # Return the file path to the script
}