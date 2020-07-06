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
  Use Read_LB
  
  Implicit none
    Integer :: iter
    
    call input_fluid
    call init_fluid
    call streaming
    
End program LB_Solver