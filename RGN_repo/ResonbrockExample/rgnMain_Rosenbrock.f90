PROGRAM testRGN
   USE rgnMod
   USE constantsMod
   IMPLICIT NONE
   INTEGER(ik), PARAMETER :: p=2, n=2
   REAL(rk) :: xo(p), xLo(p), xHi(p), x(p)
   TYPE (rgnConvType) :: cnv
   INTEGER(ik) :: error
   CHARACTER(100) :: message
   TYPE (rgnInfoType) :: info
   EXTERNAL objFunc
   !----
   !
   xo = [-1.0_rk, 0.0_rk]                                ! Start point of the search, with the optimum at [1.0 1.0]
   xLo = [-1.5_rk, -1.0_rk]                             ! Low bound
   xhi = [ 1.5_rk,  3.0_rk]                             ! Upper bound
   CALL setDefaultRgnConvergeSettings (cnvSet=cnv, dump=1, fail=0)
   CALL rgn (objFunc=objFunc, p=2, n=4, xo=xo, xLo=xlo, xHi=Xhi, cnv=cnv, x=x, info=info, error=error, message=message)
   WRITE(*,*) x
   WRITE(*,*) info%f
   WRITE(*,*) info%nIter, info%termFlag
   PAUSE
END PROGRAM testRGN

SUBROUTINE objFunc (nPar, nSim, x, r, f, error, message)
   USE constantsMod, ONLY: ik, rk
   IMPLICIT NONE
   INTEGER(ik), INTENT(in) :: nPar
   INTEGER(ik),INTENT(in):: nSim
   REAL(rk), INTENT(in) :: x(:)
   REAL(rk), INTENT(out) :: r(:)
   REAL(rk), INTENT(out):: f
   INTEGER(ik), INTENT(out):: error
   CHARACTER(100),INTENT(out) :: message
   INTEGER(ik) :: i
   !---
   !
   f = 0.0_rk
   r(1) = 1-x(1)
   r(2)=10.0_rk*(x(2)-x(1)**2)                      ! Compute residual
   f = f + r(1)**2+r(2)**2                          ! Calculate objective function
   f = f/2.0_rk
END SUBROUTINE objFunc