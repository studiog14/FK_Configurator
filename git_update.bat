@echo off
cd /d D:\FK_Configurator

echo Dodawanie zmian do GIT...
git add .

echo Tworzenie commita...
git commit -m "Aktualizacja projektu"

echo Upewnianie się, że masz ustawione poprawne repozytorium...
git remote remove origin
git remote add origin https://github.com/studiog14/FK_Configurator.git

echo Pobieranie zmian z GitHub...
git pull origin main --allow-unrelated-histories

echo Wypychanie zmian do GitHub...
git push -u origin main

echo ---
echo Gotowe! Repozytorium zostało zaktualizowane.
pause
