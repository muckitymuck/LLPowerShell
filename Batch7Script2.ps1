Do {
    Do {
        cls
        write-host ""
        Write-Host "1 - List the details of local PC BIOS"
        Write-Host "2 - List Disk Partition Info in a separate Window"
        Write-Host "3 - Write Services to Services.html"
        Write-Host "4 - Open Services.html"
        Write-Host "5 - Get Local Computer system details"
        Write-Host "6 - List Details of local Share"
        Write-Host "X to Exit"
        Write-Host "Type your choice and press Enter:  " -NoNewline
        
        $choice=Read-Host

        Write-Host""

        $ok=$choice-match'^[123456x]+$'

        if( -not $ok) {
            Write-Host "Invalid Selection"
        }

    

    } until($ok)
    switch -Regex ($choice) 
    {
        "1" 
        {
            cls
            Write-Host "You chose 1"
            Write-Host "Getting BIOS info:   "
            Get-WmiObject -Class Win32_BIOS
            pause
        }
        "2"
        {
            cls
            Write-Host "You chose 2"
            Write-Host "Getting Disk Partition info"
            get-Partition | Out-GridView
            pause
        }
        "3" 
        {
            cls
            Write-Host "You chose 3"
            Write-Host "Writing Services to Services.html"
            Get-Service | Where-Object {$_.Status -eq "Running"} | ConvertTo-HTML | Out-File Services.html
            pause
        }
        "4"
        {
            cls
            Write-Host "You chose 4"
            Write-Host "Openning Services.html"
            Invoke-Item "Services.html"
            pause
        }
        "5"
        {
            cls
            Write-Host "You chose 5"
            Write-Host "Get Local Computer System Details"
            Get-ComputerInfo -Property "cs*" | Format-Table -AutoSize
            Pause
        }
        "6"
        {
            cls
            Write-Host "You chose 6"
            Write-Host "Get Local Share details"
            Get-SMBShare | Out-GridView
            pause
        }




    }

}until($choice -match "X")