# Parse YAML and generate BAT variables
param([string]$yamlFile, [string]$outputFile)

$inOptions = $false
$currentIndex = 0
$exitKey = "X"
$exitValue = "Exit"

# Windows-1252 (ANSI) encoding for CMD compatibility
$encoding = [System.Text.Encoding]::GetEncoding(1252)

# Helper function to append line to file
function Append-Line {
    param([string]$content, [string]$file)
    [System.IO.File]::AppendAllText($file, "$content`r`n", $encoding)
}

# Create the file and add @echo off first
[System.IO.File]::WriteAllText($outputFile, "@echo off`r`n", $encoding)

Get-Content $yamlFile -Encoding UTF8 | ForEach-Object {
    $line = $_
    
    if ($line -match 'title:\s*"(.+)"') {
        Append-Line "set `"MENU_TITLE=$($Matches[1])`"" $outputFile
    }
    
    if ($line -match 'prompt:\s*"(.+)"') {
        Append-Line "set `"MENU_PROMPT=$($Matches[1])`"" $outputFile
    }
    
    if ($line -match 'exit_key:\s*"(.+)"') {
        $exitKey = $Matches[1]
    }
    
    if ($line -match 'exit_value:\s*"(.+)"') {
        $exitValue = $Matches[1]
    }
    
    if ($line -match 'options:') {
        $inOptions = $true
    }
    
    if ($inOptions) {
        if ($line -match 'index:\s*(\d+)') {
            $currentIndex = $Matches[1]
        }
        
        if ($line -match 'value:\s*"(.+)"') {
            Append-Line "set `"MENU_VALUE_$currentIndex=$($Matches[1])`"" $outputFile
        }
        
        if ($line -match 'file:\s*"(.+)"') {
            Append-Line "set `"MENU_FILE_$currentIndex=$($Matches[1])`"" $outputFile
            Append-Line "set `"MENU_COUNT=$currentIndex`"" $outputFile
        }
    }
}

Append-Line "set `"MENU_EXIT_KEY=$exitKey`"" $outputFile
Append-Line "set `"MENU_EXIT_VALUE=$exitValue`"" $outputFile

