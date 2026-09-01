@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo   위키 미리보기를 시작합니다.
echo   브라우저에서  http://127.0.0.1:8000  으로 접속하세요.
echo   (끄려면 이 창에서 Ctrl+C)
echo.
python -m mkdocs serve
pause
