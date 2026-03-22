<#
    .SYNOPSIS
    View disk usage by directory
    .PARAMETER Path 
    The path of the directory.
    .EXAMPLE
    PS> Get-DiskUsage -Path C:\temp
    .NOTES
    version 0.1.1 
  #>



Write-Host "Files:          $(
                                (Get-ChildItem -Path $args[0] -File -Recurse -Force).length
                            )
            "

Write-Host "Directories:    $(
                                (Get-ChildItem -Path $args[0] -Directory -Recurse -Force).length +1
                            )
            "

Write-Host "Size:           $(
                                ((Get-ChildItem -Path $args[0] -File -Recurse -Force) | 
                                ForEach-Object {$_.Length } | 
                                Measure-Object -Sum).Sum
                            ) bytes
            "

Write-Host "Total on disk:  $(
                                ((Get-ChildItem -Path $args[0] -Directory -Recurse -Force).length +1 ) * 4096 + # Size of a empty folder 4096
                                ((Get-ChildItem -Path $args[0] -File -Recurse -Force) | 
                                ForEach-Object {$_.Length } | 
                                Measure-Object -Sum).Sum
                            ) bytes
            "