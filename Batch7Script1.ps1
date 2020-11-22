Do {
    Do {
        cls
        write-host ""
        Write-Host "1 - Create a folder named PSCreate"
        Write-Host "2 - Create 3 files inside the PSCreate folder"
        Write-Host "3 - Browse the contents of PSCreate Folder"
        Write-Host "4 - Share PSCreate folder"
        Write-Host "5 - Map the PSCreate folder to available drive letter"
        Write-Host "6 - Show the mapped drives"
        Write-Host "7 - Remove the mappings "
        Write-Host "8 - Unshare the PSCreate folder"
        Write-Host "9 - Delete the PSCreate folder"
        Write-Host "X - Exit the Script"
        Write-Host "Type your choice and press Enter:  " -NoNewline

        $choice=Read-Host

        Write-Host""

        $ok=$choice-match'^[123456789x]+$'

        if( -not $ok) {
            Write-Host "Invalid Selection"
        }
        
    } until($ok)
    switch -Regex ($choice) {
        "1"
        {
            Write-Host "You Entered 1"
            Write-Host "Created c:\PSCreate"
            New-Item -Path "c:\" -Name "PSCreate" -ItemType "directory"
            pause
        } 
        "2"
        {
            Write-Host "You Entered 2"
            Write-Host "Create 3 files inside the PSCreate folder"
            New-Item -Path  "c:\PSCreate\" -Name "file1.txt" -ItemType "file" -Value "Value is 1"
            New-Item -Path  "c:\PSCreate\" -Name "file2.txt" -ItemType "file" -Value "Value is 2"
            New-Item -Path  "c:\PSCreate\" -Name "file3.txt" -ItemType "file" -Value "Value is 3"
            pause
        }
        "3"
        {
            Write-Host "You Entered 3"
            Write-Host "Browse the contents of PSCreate Folder"
            Get-ChildItem -Path C:\PSCreate
            pause
        }
        "4" 
        {
            Write-Host "You Entered 4"
            Write-Host "Sharing PSCreate Folder"
            New-SMBShare -Name "PSCreate" -Path "C:\PSCreate" -FullAccess "Administrators"
            Get-ChildItem -Path PSCreate:   
            pause
        }
        "5"
        {
            Write-Host "You Entered 5"
            Write-Host "Mapping PSCReate Folder to X:"
            New-PSDrive -Name "X" -PSProvider "FileSystem" -Root "\\DELL-4-PC\PSCreate"  
            pause           
        }
        "6"
        {
            Write-Host "You Entered 6"
            Get-PSDrive -Name "X"
            pause
        }
        "7"
        {
            Write-Host "You Entered 7"
            Write-Host "Removing X Drive"
            Get-PSDrive X | Remove-PSDrive
            pause
        }
        "8"
        {
            Write-Host "You Entered 8"
            Write-Host "Removing PSCreate Shared Folder"
            Remove-SmbShare -Name "PSCreate"
            pause
        }
        "9"
        {
            Write-Host "You Entered 9"
            Write-Host "Deleting PSCreate Folder"
            Remove-Item -Path "c:\PSCreate" -Recurse
            pause
        }   
    
    }

} until($choice -match "X")