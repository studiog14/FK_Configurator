@echo off
echo Zapisywanie zmian...
git add .
git commit -m "Aktualizacja konfiguratora"
echo Pobieranie zmian z GitHuba i wypychanie...
git pull --rebase
git push
pause
