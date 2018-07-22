!******************************************************************
!
! Purpose: modules for sharing hydrology data between subroutines

! Author: Youwei Qin
! Email: youwei.qin@uon.edu.au
! Colledge of Hydrology and Water Resources
! Hohai University
! Nanjing, Jiangsu, 210098, China
!
MODULE hydroDataMod
   USE constantsMod, ONLY: ik, rk
   IMPLICIT NONE
   SAVE
   PUBLIC
   INTEGER(ik)::nWarmUp, nData, nPar, nState
   REAL(rk),ALLOCATABLE::rain(:),pet(:),obsQ(:)
   CHARACTER(128),ALLOCATABLE::parName(:)
   CHARACTER(128),ALLOCATABLE::stateName(:)
   REAL(rk),ALLOCATABLE::stateVal(:)
END MODULE hydroDataMod

