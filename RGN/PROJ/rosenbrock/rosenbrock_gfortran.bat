REM compile and run RGN on rosenbrock
:: Instructons: 1) add PATH for gfortran
::              2) compile: gfortran -c -ffree-line-length-none ..\..\SRC_RGN\constantsMod.f90 ..\..\SRC_RGN\rgn.f90 ..\..\SRC_DEMO\rosenbrock\rgnMain_Rosenbrock.f90
::              3) link: gfortran  -o rosenbrock_demo.exe *.o
::              4) run: rosenbrock_demo.exe
:: The verion of executable file will depends on the gfortran version (32 bit or 64 bit) installed

echo compile rosenbrock demo with gfortran
echo "Have you included gfortran on path environment variable?"
set /P input=[Y/N]
set "TRUE"=
if /I not "%input%"=="Y" set TRUE=1
if /I not "%input%"=="y" set TRUE=1
if defined TRUE (
   echo Assuming "PATH=C:\cygwin64\bin\ (otherwise, update .bat file)"
   set "PATH=C:\cygwin64\bin\"
)
gfortran -c -ffree-line-length-none ..\..\SRC_RGN\constantsMod.f90 ..\..\SRC_RGN\rgn.f90 ..\..\SRC_DEMO\rosenbrock\rgnMain_Rosenbrock.f90
gfortran  -o rosenbrock_demo.exe *.o
rosenbrock_demo.exe
PAUSE

