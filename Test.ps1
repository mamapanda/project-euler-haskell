$Answers = @{
    "001" = 233168;
    "002" = 4613732;
    "003" = 6857;
    "004" = 906609;
    "005" = 232792560;
    "006" = 25164150;
    "007" = 104743;
    "008" = 23514624000;
    "009" = 31875000;
    "010" = 142913828922;
    "011" = 70600674;
    "012" = 76576500;
    "013" = 5537376230;
    "014" = 837799;
    "015" = 137846528820;
    "016" = 1366;
    "017" = 21124;
    "018" = 1074;
    "019" = 171;
    "020" = 648;
    "021" = 31626;
    "022" = 871198282;
    "023" = 4179871;
    "024" = 2783915460;
    "025" = 4782;
    "026" = 983;
    "027" = -59231;
    "028" = 669171001;
    "029" = 9183;
    "030" = 443839;
    "031" = 73682;
    "032" = 45228;
    "033" = 100;
    "034" = 40730;
    "035" = 55;
    "036" = 872187;
    "037" = 748317;
    "038" = 932718654;
    "039" = 840;
    "040" = 210;
    "041" = 7652413
}

function Test-Case($Number) {
    $Binary = "./bin/$Number.exe"
    $Actual = "$(& $Binary)"
    $Expected = $Answers[$Number]

    if ($Actual -eq $Expected) {
        Write-Host "${Number}: SUCCESS" -ForegroundColor Green
    } else {
        $Message = "${Number}: FAILED (Expected: $Expected, Actual: $Actual)"
        Write-Host $Message -ForegroundColor Red
    }
}

foreach ($Entry in $Answers.GetEnumerator() | Sort-Object -Property Name) {
    make "bin/$($Entry.Name).exe" | Out-Null
    Test-Case($Entry.Name)
}