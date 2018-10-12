PROGRAM testRGN
! Purpose: Calibrate 2D Rosenbrock function with Robust Gauss-Newton Algorithm (RGN)
!
! This is the example for calibrating Rosenbrock function with RGN
! The core of RGN is recorded in rgn.f90
! The data exchange between RGN and Rosenbrock function is through "objFunc"
! and the sum of least squares objective function value is evaluated and returned to RGN subroutine.
! The public variables were shared through subroutine "constantsMod.f90"
!******************************************************************
   USE rgnMod
   USE constantsMod
   IMPLICIT NONE
   INTEGER(ik), PARAMETER :: p=2, n=2
   REAL(rk) :: x0(p), xLo(p), xHi(p), x(p)
   TYPE (rgnConvType) :: cnv
   INTEGER(ik) :: error
   CHARACTER(100) :: message
   TYPE (rgnInfoType) :: info
   EXTERNAL objFunc
   !----
   !
   x0 = [-1.0_rk, 0.0_rk]                                ! Start point of the search, with the optimum at [1.0 1.0]
   xLo = [-1.5_rk, -1.0_rk]                             ! Low bound
   xhi = [ 1.5_rk,  3.0_rk]                             ! Upper bound
   CALL setDefaultRgnConvergeSettings (cnvSet=cnv, dump=1, fail=0)
   CALL rgn (objFunc=objFunc, p=2, n=4, x0=x0, xLo=xlo, xHi=Xhi, cnv=cnv, x=x, info=info, error=error, message=message)
   IF(error /= 0)then
     WRITE(*,*) message
     PAUSE
   END IF
   WRITE(*,*) x
   WRITE(*,*) info%f
   WRITE(*,*) info%nIter, info%termFlag
   WRITE(*,*) info%cpuTime
END PROGRAM testRGN

SUBROUTINE objFunc (nPar, nSim, x, r, f, timeFunc, error, message)
   USE constantsMod, ONLY: ik, rk
   IMPLICIT NONE
   INTEGER(ik), INTENT(in) :: nPar
   INTEGER(ik),INTENT(in):: nSim
   REAL(rk), INTENT(in) :: x(:)
   REAL(rk), INTENT(out) :: r(:)
   REAL(rk), INTENT(out):: f
   REAL(rk),INTENT(out):: timeFunc
   INTEGER(ik), INTENT(out):: error
   CHARACTER(100),INTENT(out) :: message
   INTEGER(ik) :: i
   !---
   !
   !time for evaluating
   REAL(rk)::timeObj(2)
   CALL CPU_TIME (timeObj(1))
   f = 0.0_rk
   r(1) = 1-x(1)
   r(2)=10.0_rk*(x(2)-x(1)**2)                      ! Compute residual
   f = f + r(1)**2+r(2)**2                          ! Calculate objective function
   f = f/2.0_rk
   CALL CPU_TIME (timeObj(2))
   timeFunc=timeObj(2)-timeObj(1)
END SUBROUTINE objFunc
