$ProgressPreference = 'SilentlyContinue'

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "           WinToolkit Installer         " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[INFO] Starting installation..." -ForegroundColor Cyan

# ============================================
# Paths
# ============================================

$InstallPath = "C:\WinToolkit"
$ZipUrl = "https://github.com/OeGiaretta/WinToolkit/archive/refs/heads/dev.zip"
$ZipFile = "$env:TEMP\WinToolkit.zip"

# ============================================
# Create install directory
# ============================================

if (!(Test-Path $InstallPath)) {
    New-Item -ItemType Directory -Path $InstallPath | Out-Null
    Write-Host "[SUCCESS] Installation folder created." -ForegroundColor Green
}
else {
    Write-Host "[INFO] Installation folder already exists." -ForegroundColor Yellow
}

# ============================================
# Download
# ============================================

Write-Host "[INFO] Downloading WinToolkit..." -ForegroundColor Cyan

Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipFile

if (!(Test-Path $ZipFile)) {
    Write-Host "[ERROR] Download failed." -ForegroundColor Red
    exit
}

Write-Host "[SUCCESS] Download completed." -ForegroundColor Green

# ============================================
# Extract
# ============================================

Write-Host "[INFO] Extracting files..." -ForegroundColor Cyan

Expand-Archive -Path $ZipFile -DestinationPath $InstallPath -Force

# ============================================
# Find extracted folder
# ============================================

$ExtractedFolder = Get-ChildItem $InstallPath |
Where-Object {
    $_.PSIsContainer -and $_.Name -like "WinToolkit-*"
} |
Select-Object -First 1

if ($ExtractedFolder) {

    Move-Item "$($ExtractedFolder.FullName)\*" $InstallPath -Force

    Remove-Item $ExtractedFolder.FullName -Recurse -Force
}

# ============================================
# Cleanup
# ============================================

Remove-Item $ZipFile -Force

# ============================================
# Finish
# ============================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " WinToolkit installed successfully! " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Run WinToolkit using:" -ForegroundColor Cyan
Write-Host "cd C:\WinToolkit" -ForegroundColor White
Write-Host ".\WinToolkit.bat" -ForegroundColor White