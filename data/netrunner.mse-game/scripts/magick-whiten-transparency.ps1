param (
 [Parameter(Mandatory = $true)]
 [string]$Input,
 [Parameter(Mandatory = $true)]
 [string]$Output
)

magick $Input -background white $Output
