:: get script dir
for /f "delims=" %%H in ('CD') do (set SCRIPTDIR=%%H\)

IF NOT EXIST vboxPath.cfg exit
set config=vboxPath.cfg
for /f "tokens=2* delims==" %%I in ('find "vboxVMDirWin=" ^<%config% ') do (set VMDir=%%I)
for /f "tokens=2* delims==" %%J in ('find "vboxAppWin=" ^<%config% ') do (set VMApp=%%J)

::now set our root paths
::here's what the windows drive is called on my mac
set WinDriveOnMac=/Volumes/Untitled

cd /D %VMDir%
for /r %%K in (*.vbox) do (copy %%K %%K.winbak)

set FART=%SCRIPTDIR%FART.exe
:: Relace first this
%FART% -r -- *.vbox "%WinDriveOnMac%/Emulators" "P:\\"

:: then this
%FART% -r -- *.vbox "%WinDriveOnMac%/Games" "F:\\"

:: now this (because of the backslash after emulators, we now have P:\/QUICKPLAY....)
%FART% -r -- *.vbox "P:\/QUICKPLAY" "P:\QUICKPLAY"

:: For VM's that mostly get loaded on windows, change the single C:/Program files ref for the 
:: Guest Additions Iso but NOT the 2 references to the guest additions folder on the GUEST
:: ie: we're stating windows is the 'primary' host for these images
%FART% -r -- *.vbox "%WinDriveOnMac%/Program Files/Oracle/VirtualBox/" "C:\Program Files\Oracle\VirtualBox\\"

:: Change boot to docker location, this will always live on osx
%FART% -r -- *.vbox "/Users/twoode/.boot2docker/" "E:\Users\twoode\.boot2docker\\"

:: Change guest additions location for ubuntu, this will always live on osx
%FART% -r -- *.vbox "/Applications/VirtualBox.app/Contents/MacOS/" "E:\Applications\VirtualBox.app\Contents\MacOS\\"


%VMApp%


