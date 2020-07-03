!---------------------------------------------------------------------------!
! LBDEM Developed by Duc Kien Tran, DSI, LLC.
!---------------------------------------------------------------------------!
! Module: Read_LB
!
!> @details Reading the input files
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------!
  
Module Read_LB
  Use var_global
  Implicit none
  
  Contains
  
!---------------------------------------------------------------------------!
! Subroutine: input_fluid
!
!> @details Read the input file for fluid
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------! 
  Subroutine input_fluid                                                                              
                                                                  
    Write(*,'(A)')'Reading the main control file: lbm.inp' 
    Open(1,file='lbm.inp',status='unknown')
    Read(1,*)
    Read(1,*) tau, rho0
    Read(1,*)
    Read(1,*) u00, u01
    
  End subroutine input_fluid
  
End module Read_LB