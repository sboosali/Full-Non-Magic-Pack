[CmdletBinding()]
param (
  [Parameter(Mandatory=$false)]
  [string]$in = "*.svg",
  [Parameter(Mandatory=$false)]
  [int]$width = 300
)

Get-ChildItem -File  -Path .\  -Filter $in  |  ForEach-Object {
  try {

    & magick  -density 300  -background none  $_.FullName  -resize "$($width)x"  ($_.FullName  -replace '\.svg$', '.png')
    Write-Host $_.BaseName -BackgroundColor Green

  } catch {
    Write-Host $_.BaseName -BackgroundColor Red
  }
}

# Start-Process  -FilePath "magick"  -ArgumentList "`"$($_.FullName)`""  -Wait -PassThru

# magick  -density 300  -background none  -limit memory 4GiB -limit map 50GiB  MSVG:.\NSG_CREDIT.svg   -resize 100x  credit.png
