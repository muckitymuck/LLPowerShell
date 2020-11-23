Do {
    Do {
        cls
        write-host ""
        Write-Host "1 - List the details of local PC BIOS"
        Write-Host "2 - List Disk Partition Info in a separate Window"
        Write-Host "3 - "
        Write-Host "4 - "
        Write-Host "5 - "
        Write-Host "6 - "
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
            Write-Host "You chose 1"
            Write-Host "Getting BIOS info:   "
            Get-WmiObject -Class Win32_BIOS
            pause
        }
        "2"
        {
            Write-Host "You chose 2"
            Write-Host "Getting Disk Partition info"
            get-Partition | Out-GridView
            pause
        }



    }

}until($choice -match "X")