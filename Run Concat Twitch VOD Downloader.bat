@ECHO OFF
setlocal EnableDelayedExpansion
::Ask user for the VoD ID and check if the result is blank or a space
:vodIdLoc
set /p vodId="Enter the ID of the VoD you would like to download: "
if  "!vodId!"=="" (
		echo Please enter a Vod ID
		goto vodIdLoc
	)
if  "!vodId!"==" " (
		echo Please enter a Vod ID
		goto vodIdLoc
	)
echo.
::Ask user for the desired file name. If left blank, use the VoD ID
:filenameLoc
set /p filename="Enter the filename you would like the VoD to be downloaded as (leave blank for VoD ID): "
if "!filename!"=="" (
		set filename=!vodId!
	)
echo.
::Ask user for desired start time. If left blank, use 00 00 00
:startTimeLoc
set /p startTime="Enter the start time (in format hh mm ss) leave blank for begining: " || set "startTime=00 00 00"
echo.
::Ask user for desired end time. If left blank or a space, ask again
:endTimeLoc
set /p endTime="Enter the end time you would like (in format hh mm ss): "
if  "!endTime!"=="" (
		echo Please enter an end time
		goto endTimeLoc
	)
if  "!endTime!"==" " (
		echo Please enter an end time
		goto endTimeLoc
	)
echo.
::Run command with user inputs
concat_win.exe -vod="%vodId%" -filename="%filename%" -start="%startTime%" -end="%endTime%"
echo.

pause