@echo off
REM Automated setup script for AudiogramDigitization (Windows)

echo Setting up AudiogramDigitization...

REM Check if Python 3 is available
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python 3 is not installed. Please install Python 3.7 or higher.
    exit /b 1
)

REM Display Python version
python --version

REM Create virtual environment
echo Creating virtual environment...
python -m venv environment

REM Activate virtual environment
echo Activating virtual environment...
call environment\Scripts\activate.bat

REM Install dependencies
echo Installing dependencies...
python -m pip install --upgrade pip
pip install -r requirements.txt

echo.
echo Setup complete!
echo.
echo To use the digitizer, activate the virtual environment first:
echo   environment\Scripts\activate.bat
echo.
echo Then run the digitizer:
echo   python src\digitize_report.py -i ^<path_to_image^> -o ^<output_directory^>
echo.
