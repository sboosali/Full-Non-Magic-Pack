Get-ChildItem -Path . -Filter *.png  |  ForEach-Object {  magick identify  -format "%wx%h %f (%b)\n"  $_.Name  }
