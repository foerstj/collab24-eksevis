:: name of map
set map=collab24-eksevis
:: name of map, case-sensitive
set map_cs=Collab 24 Eksevis
:: tank properties
set year=2024
set copyright=CC-BY-SA %year%
set author=Eksevis
set title=%map_cs%

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\art" "%tmp%\Bits\art" /S
robocopy "%bits%\ui" "%tmp%\Bits\ui" /S
robocopy "%bits%\world\contentdb\templates\regular" "%tmp%\Bits\world\contentdb\templates\regular" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
