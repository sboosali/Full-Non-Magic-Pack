[CmdletBinding()]
param (
  [Parameter(Mandatory=$true)]
  [System.IO.FileInfo]$in,

  [Parameter(Mandatory=$true)]
  [String]$out
)

# e.g. a mask:
# > magick  TemplateRunnerProgram.png  -background white  -flatten  program-mask.png

magick  $in.Name   -background white  -flatten  $out

# e.g. a preview:
# > magick  .\BackRunner.jpg  -resize 75x105  .\preview.jpg

