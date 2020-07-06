!---------------------------------------------------------------------------!
! LBDEM Developed by Duc Kien Tran, DSI, LLC.
!---------------------------------------------------------------------------!
!
!> @details The main program of the LB part
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------!
  
Program LB_Solver
  Use var_global
  Use mod_LB
  Use read_LB
  Use mod_BCs
  
  Implicit none
    Integer :: iter
    
    call input_fluid
    call init_fluid
    do iter = 1, nstep
      call collisions
      call streaming
      call bounce_back
      call pressure_bc
    end do
    
End program LB_Solver