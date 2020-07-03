!---------------------------------------------------------------------------!
! LBDEM Developed by Duc Kien Tran, DSI, LLC.
!---------------------------------------------------------------------------!
! Module: LBM
!
!> @details Containing subroutine for solving LB Equations
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------!
  
Module mod_LB
  Use var_global
  
  Implicit none
  
  Real (kind = rk4), allocatable :: f (:,:)    !< Distribution function
  Real (kind = rk4), allocatable :: fc(:,:)    !< Post-colision distribution function
  Real (kind = rk4), allocatable :: u0  (:)    !< Fluid velocity component in x direction
  Real (kind = rk4), allocatable :: u1  (:)    !< Fluid velocity component in y direction
  Real (kind = rk4), allocatable :: rho (:)    !< Fluid density
  
  Contains
  
!---------------------------------------------------------------------------!
! Subroutine: init_fluid
!
!> @details Initialisation of fluid
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------! 
  Subroutine init_fluid
  
  End subroutine init_fluid

!---------------------------------------------------------------------------!
! Subroutine: collisions
!
!> @details Computing the collision process of fluid nodes
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------! 
  Subroutine collisions
  
  End subroutine collisions
  
!---------------------------------------------------------------------------!
! Subroutine: Streaming
!
!> @details Computing the streaming process of fluid nodes
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------! 
  Subroutine streaming
  
  End subroutine streaming 
   
!---------------------------------------------------------------------------!
! Subroutine: macro_field
!
!> @details Computing the macro field quantities
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------! 
  Subroutine macro_field
  
  End subroutine macro_field 
  
  
End module mod_LB