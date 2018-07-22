        !COMPILER-GENERATED INTERFACE MODULE: Sun Jul 22 18:55:42 2018
        MODULE OBJFUNC__genmod
          INTERFACE 
            SUBROUTINE OBJFUNC(P,N,X,R,F,OK)
              INTEGER(KIND=8), INTENT(IN) :: P
              INTEGER(KIND=8), INTENT(IN) :: N
              REAL(KIND=8), INTENT(IN) :: X(:)
              REAL(KIND=8), INTENT(OUT) :: R(:)
              REAL(KIND=8), INTENT(OUT) :: F
              LOGICAL(KIND=4), INTENT(OUT) :: OK
            END SUBROUTINE OBJFUNC
          END INTERFACE 
        END MODULE OBJFUNC__genmod
