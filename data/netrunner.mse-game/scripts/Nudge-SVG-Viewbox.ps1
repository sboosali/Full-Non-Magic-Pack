[CmdletBinding()]
param (
  [Parameter(Mandatory=$false)]
  [int]$x,

  [Parameter(Mandatory=$false)]
  [int]$y
)

$Path = ".\"

$Files  =  Get-ChildItem -Path $Path  -Filter *.svg

foreach ($File in $Files) {
    $Before  =  Get-Content -Path $File.FullName  -Raw

    # viewBox="x y width height"
    $Pattern = '(?i)viewBox="(-?\d+) (-?\d+) (-?\d+) (-?\d+)"'

    if ($Before -match $Pattern) {
        Write-Host "$($File.Name) viewBox=`"$1 $2 $3 $4`""

        $After  =  $Before  -replace $Pattern, "viewBox=`"$(x) $(y) $3 $4`""  #TODO

        #Set-Content -Path $File.FullName  -Value $After  -Encoding UTF8
    }
}
