@echo on

for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set DateTime=%%a

set Yr=%DateTime:~0,4%
set Mon=%DateTime:~4,2%
set Day=%DateTime:~6,2%
set Hr=%DateTime:~8,2%
set Min=%DateTime:~10,2%
set Sec=%DateTime:~12,2%

@REM date and time stamp to the folder copies from source to destination 
set BackupName= ApplicationBackup__%Yr%-%Mon%-%Day%_(%Hr%-%Min%-%Sec%)  


SET "source=D:\sourcepath"
SET "destination=E:\destination\tp\"
SET "log=E:\destination\log.txt"

robocopy %source% "%destination%%BackupName%" /E /TS /LOG+:%log% /TS  /FP 
