Write-Host "=== Rozpoczynam automatyczny push do GitHuba ===" -ForegroundColor Cyan

# Ścieżka projektu
$projectPath = "D:\FK_Configurator"
Set-Location $projectPath

# Usuń stare repo, jeśli istnieje
if (Test-Path ".git") {
    Write-Host "Usuwam stare repozytorium .git..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".git"
}

# Inicjalizacja nowego repo
git init
git branch -M main
git remote add origin https://github.com/studiog14/fajne_krzesla_configurator.git

# Wyłączenie Git LFS
Write-Host "Wyłączam Git LFS (jeśli był włączony)..." -ForegroundColor Yellow
git lfs uninstall | Out-Null

# Dodanie wszystkich plików
Write-Host "Dodaję wszystkie pliki do repo..." -ForegroundColor Yellow
git add .

# Commit
git commit -m "Initial commit - upload all project files (no LFS)" | Out-Null

# Utworzenie folderu workflow dla GitHub Pages
$workflowPath = ".github/workflows"
if (!(Test-Path $workflowPath)) {
    New-Item -ItemType Directory -Path $workflowPath -Force | Out-Null
}

# Tworzymy automatyczny workflow dla GitHub Pages
$workflowContent = @"
name: Deploy static site to GitHub Pages

on:
  push:
    branches: [ "main" ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pages: write
      id-token: write
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Pages
        uses: actions/configure-pages@v5

      - name: Upload site files
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
"@

Set-Content -Path "$workflowPath/deploy.yml" -Value $workflowContent -Encoding UTF8

# Dodanie workflow do repo
git add .github/workflows/deploy.yml
git commit -m "Add GitHub Pages workflow" | Out-Null

# Push do GitHuba
Write-Host "Wysyłam pliki do GitHuba..." -ForegroundColor Yellow
git push origin main --force

Write-Host "`n✅ Wszystko gotowe! Pliki zostały wysłane do GitHuba." -ForegroundColor Green
Write-Host "Repozytorium: https://github.com/studiog14/fajne_krzesla_configurator" -ForegroundColor Cyan
Write-Host "Strona GitHub Pages powinna być aktywna po kilku minutach." -ForegroundColor Cyan
pause
