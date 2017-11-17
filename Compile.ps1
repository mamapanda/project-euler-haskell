param (
    [Parameter(mandatory=$true)]
    [String]$Number
)

$SourceFile = "$Number.hs"
$Binary = "bin/$Number.exe"

stack exec -- ghc $SourceFile -outputdir out -o $Binary -O1
