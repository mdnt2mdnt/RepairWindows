@echo off
color 0C
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0
	(
        echo Success: Administrative permissions confirmed.
		echo ----------------------------------------------
		echo This script will repair Windows Component store and check for any corrupt core Windows files too.
		echo ----------------------------------------------
		pause
		cls
		sfc /scannow
		echo Process completed, now checking Windows Component store.
		timeout 15
		cls
		DISM /Online /Cleanup-Image /RestoreHealth
    )
	else
	(
        echo Failure: Current permissions inadequate.
    )

    pause >nul