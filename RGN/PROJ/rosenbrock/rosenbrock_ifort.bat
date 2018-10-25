REM compile and run RGN on rosenbrock
:: Instructons: 1) add PATH for ifort and run ifortvars.bat
::              2) compile: ifort -c ..\..\SRC_RGN\constantsMod.f90 	
::                          ifort -c ..\..\SRC_RGN\rgn.f90
::                          ifort -c ..\..\SRC_DEMO\rosenbrock\rgnMain_Rosenbrock.f90
::              3) link: ifort -o rosenbrock_demo.exe *.o
::              4) run: rosenbrock_demo.exe
:: To compile 32 bit executable file, please replace "intel64" by "ia32"

echo compile rosenbrock demo with ifort
Set "ifortvars_path=C:\Program Files (x86)\Intel\Composer XE 2011 SP1\bin\"
echo Assuming path to ifort is %ifortvars_path%
echo "Is this the correct installation of Intel Fortran? (Y/N)"
set /P input=[Y/N]
set "TRUE"=
if /I not "%input%"=="Y" set TRUE=1
if /I not "%input%"=="y" set TRUE=1
if defined TRUE (
   echo "Please modify .bat to have correct path to ifortvars and retry"
   pause
   exit /b
) ELSE ( 
    CALL "%ifortvars_path%ifortvars.bat" intel64
)
ifort -c ..\..\SRC_RGN\constantsMod.f90
ifort -c ..\..\SRC_RGN\rgn.f90
ifort -c ..\..\SRC_DEMO\rosenbrock\rgnMain_Rosenbrock.f90
ifort -o rosenbrock_demo.exe *.obj
echo run rosenbrock demo
rosenbrock_demo.exe
PAUSE