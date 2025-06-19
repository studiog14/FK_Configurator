@echo off
cd /d D:\FK_Configurator
git add .
git commit -m "Aktualizacja"
git pull --rebase
git push
pause
