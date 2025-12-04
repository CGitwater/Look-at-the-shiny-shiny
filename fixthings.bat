@echo off
CLS

:::                                                   -----
:::                                                 /      \
:::                                                 )      |
:::          :================:                      "    )/
:::         /||              ||                      )_ /*
:::        / ||    System    ||                          *
:::       |  ||     Down     ||                   (=====~*~======)
:::        \ || Please wait  ||                  0      \ /       0
:::          ==================                //   (====*====)   ||
:::   ........... /      \.............       //         *         ||
:::   :\        ############            \    ||    (=====*======)  ||
:::   : ---------------------------------     V          *          V
:::   : |  *   |__________|| ::::::::::  |    o   (======*=======) o
:::   \ |      |          ||   .......   |    \\         *         ||
:::     --------------------------------- 8   ||   (=====*======)  //
:::                                        8   V         *         V
:::     --------------------------------- 8   =|=;  (==/ * \==)   =|=
:::     \   ###########################  \   / ! \     _ * __    / | \
:::      \  +++++++++++++++++++++++++++   \  ! !  !  (__/ \__)  !  !  !
:::       \ ++++++++++++++++++++++++++++   \        0 \ \V/ / 0
:::        \________________________________\     ()   \o o/   ()
:::         *********************************     ()           ()
:::

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo Fixing things .
echo Registering DNS servers
ipconfig /registerdns > nul
cls

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo Fixing things ....
echo Registering DNS servers........done
echo Flushing DNS ......................
ping 1.1.1.1 -n 2 > nul
ipconfig /flushdns > nul
cls

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo Fixing things .......
echo Registering DNS servers........done 
echo Flushing DNS...................done
echo Resetting Winsock..................
ping 1.1.1.1 -n 2 > nul
netsh winsock reset > nul
cls

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo Fixing things ...........
echo Registering DNS servers........done 
echo Flushing DNS...................done
echo Resetting Winsock..............done
echo Restarting NLA.....................
ping 1.1.1.1 -n 2 > nul
net stop nlasvc /y && net start nlasvc
cls

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo Fixing things ..............
echo Registering DNS servers........done 
echo Flushing DNS...................done
echo Resetting Winsock..............done
echo Restarting NLA.................done
echo Cleaning up temporary files........
ping 1.1.1.1 -n 2 > nul
# del /f /s /q "%localappdata%\Temp\*.*" > nul
for /D %%G in ("%SystemDrive%\Users\*") do erase /F /S /Q "%%G\AppData\Local\Temp\*.*"
cls

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo Fixing things .................
echo Registering DNS servers........done 
echo Flushing DNS...................done
echo Resetting Winsock..............done
echo Restarting NLA.................done
echo Cleaning up temporary files ...almost done
ping 1.1.1.1 -n 2 > nul
del /f /s /q %windir%\temp > nul
cls

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo Fixing things .....................
echo Registering DNS servers........done 
echo Flushing DNS...................done
echo Resetting Winsock..............done
echo Restarting NLA.................done
echo Cleaning up temporary files ...done
echo Scanning system files..............
ping 1.1.1.1 -n 2 > nul
echo.

dism /online /cleanup-image /restorehealth
sfc /scannow

echo All done
pause
