Do {
    Do {
        cls
        write-host ""
        Write-Host "1 - Run a Menu for folder and File Options"
        Write-Host "2 - Run a Menu for System information"
        Write-Host "X to Exit"
        
        Write-Host "Type your choice and press Enter:  " -NoNewline
        
        $choice=Read-Host

        Write-Host""

        $ok=$choice-match'^[12x]+$'

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
            Write-Host " "
            &.\Batch7Script1.ps1
            pause
        }
        "2"
        {
            cls
            Write-Host "You chose 2"
            Write-Host " "
            &.\Batch7Script2.ps1
            pause
        }
        
    }
}until($choice -match "X")