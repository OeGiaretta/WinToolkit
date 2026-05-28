Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "           WinToolkit Installer         " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[INFO] Starting installation..." -ForegroundColor Cyan

$InstallPath = "C:\WinToolkit"

if (!(Test-Path $InstallPath)) {
    New-Item -ItemType Directory -Path $InstallPath | Out-Null
    Write-Host "[SUCCESS] Installation folder created." -ForegroundColor Green
} else {
    Write-Host "[INFO] Installation folder already exists." -ForegroundColor Yellow
}

$ZipUrl = "https://github.com/OeGiaretta/WinToolkit/archive/refs/heads/dev.zip"
$ZipUrl = $env:TEMP + "\WinToolkit.zip"
Write-Host "[INFO]  Downloading WinToolkit..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipUrl

Write-Host "[INFO] Extracting files..." -ForegroundColor Cyan
Expand-Archive -Path $ZipFile -DestinationPath $InstallPath -Force
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " WinToolkit installed successfully! " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""