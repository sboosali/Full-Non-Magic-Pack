[CmdletBinding()]
param (
  [Parameter(Mandatory=$false)]
  [string]$in = "Netrunner Icons.ttf"
)

# mkdir -p

New-Item -Path .\svg  -Force  -ItemType Directory

# extract each "letter" (icon) into an SVG:

fontforge  -lang=ff  -c @'
Open($1);
SelectWorthOutputting();
UnlinkReference();
foreach Export($2);
endloop;
'@  $in  "svg/%n-%e.svg"

# strip the "-%e" suffix:

Get-ChildItem -Path .\svg  -File  |  Where-Object {

  $_.BaseName -match '-\d+$'

}  |  Rename-Item -NewName {

  ($_.BaseName -replace '-*\d+$') + $_.Extension

}

# delete:

$whitelist = @(
  "ADAM", "ADVANCEMENT", "AGENDAPOINT", "ANARCH", "APEX", "CLICK", "CREDIT", "CRIMINAL", "DECK", "HB", "INTERRUPT", "JINTEKI", "LINK", "MU", "NBN", "NETRUNNER", "RECURRING", "REZ", "SHAPER", "SUBROUTINE", "SUNNY", "TRASH", "UNIQUE", "WEYLAND"
)

Get-ChildItem -Path .\svg  -File  |  Where-Object { $whitelist -NotContains $_.BaseName }  |  Remove-Item

# rename:

$renames = @{
  "NETRUNNER"= "NEUTRAL"
}

foreach ($i in $renames.Keys) {
  $o = $renames[$i]
  Rename-Item -Path "svg\${i}.svg"  -NewName "${o}.svg"
}

# 

Get-ChildItem -Path .\svg  -File  -Name
