Function Get-TopProcess{ # Declaring Function
    param( # Define the parameters
        [int]$TopN
    )
    Get-Process | Sort-Object CPU -Descending | # Run the command
        Select-Object -First $TopN -Property ID,
        ProcessName, @{l='CPU';e={'{0:N}' -f $_.CPU}}
}

Get-TopProcess -TopN 10