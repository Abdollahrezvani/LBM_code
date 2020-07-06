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
!> @details Read the input file for fluid phase
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------! 
  Subroutine input_fluid                                                                              
                                                                  
    Write(*,'(A)')'Reading the main control file: lbm.inp' 
    Open(1,file='lbm.inp',status='unknown')
    Read(1,*)
    Read(1,*) nx, ny, nstep
    Read(1,*)
    Read(1,*) tau, rho0
    Read(1,*)
    Read(1,*) rhoin, rhoout
    
    nx = nx + 2
    ny = ny + 2
  End subroutine input_fluid

!---------------------------------------------------------------------------!
! Subroutine: input_solid
!
!> @details Read the input file for solid phase
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------! 
    Subroutine input_solid                                                                           
                                                                  
    Write(*,'(A)')'Reading the main control file: dem.inp' 

  End subroutine input_solid
End module Read_LB