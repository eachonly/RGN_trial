REM compile and run RGN on hymod
:: Instructons: 1) add PATH for ifort and run ifortvars.bat
::				2) compile: ifort -c ..\..\SRC_RGN\constantsMod.f90 	
::				   			ifort -c ..\..\SRC_RGN\rgn.f90
::							ifort -c ..\..\SRC_DEMO\hymod\hydroDataMod.f90
::							ifort -c ..\..\SRC_DEMO\hymod\hymod.f90
::							ifort -c ..\..\SRC_DEMO\hymod\rgnMain_Hymod.f90
::              3) link: ifort -o hymod_demo.exe *.o
::              4) run: hymod_demo.exe

echo compile hymod demo with gfortran
Set "ifortvars_path=C:\Program Files (x86)\Intel\Composer XE 2011 SP1\bin"
CALL "%ifortvars_path%\ifortvars.bat" ia32
ifort -c ..\..\SRC_RGN\constantsMod.f90
ifort -c ..\..\SRC_RGN\rgn.f90
ifort -c ..\..\SRC_DEMO\hymod\hydroDataMod.f90
ifort -c ..\..\SRC_DEMO\hymod\hymod.f90
ifort -c ..\..\SRC_DEMO\hymod\rgnMain_Hymod.f90
ifort -o hymod_demo.exe *.obj
echo run hymod demo
hymod_demo.exe
PAUSE