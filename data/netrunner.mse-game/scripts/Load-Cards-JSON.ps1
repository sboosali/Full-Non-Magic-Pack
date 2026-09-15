param (
  [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
  [ValidateScript({  (Test-Path $_ -PathType Leaf)  -and  ([System.IO.Path]::GetExtension($_) -eq '.json') })]
  [System.IO.FileInfo]$File = .\cards.json
)

# Read and convert the file into a custom PowerShell object
$Global:cards = Get-Content -Raw -Path $File | ConvertFrom-Json

