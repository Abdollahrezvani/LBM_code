!---------------------------------------------------------------------------!
! LBDEM Developed by Duc Kien Tran, DSI, LLC.
!---------------------------------------------------------------------------!
! Module: LB_BCs
!
!> @details Providing the boundary conditions for LB part
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------!
  
Module mod_BCs
  Use mod_LB
  Implicit none
  
  Contains
  
!---------------------------------------------------------------------------!
! Subroutine: Bounce_back
!
!> @details Implementing the bounce back condition of fluid-wall
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------!

Subroutine bounce_back
  
  Integer :: ix, iy
  
  ! *** Loop over nodes on the south boundary
  iy = 2
  do ix = 2, nx-1
    f(3,ix,iy) = fc(5,ix,iy)
    f(6,ix,iy) = fc(8,ix,iy)
    f(7,ix,iy) = fc(9,ix,iy)
  end do
    
  ! *** Loop over nodes on the south boundary
  iy = ny - 1
  do ix = 2, nx-1
    f(5,ix,iy) = fc(3,ix,iy)
    f(8,ix,iy) = fc(6,ix,iy)
    f(9,ix,iy) = fc(7,ix,iy)
  end do
  
End subroutine bounce_back

!---------------------------------------------------------------------------!
! Subroutine: Periodic_flow
!
!> @details Implementing the periodic condition of fluid-wall
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------!  

Subroutine periodic_flow
  
End subroutine periodic_flow  

!---------------------------------------------------------------------------!
! Subroutine: Pressure_bc
!
!> @details Implementing the imposing pressure boundary condition
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------! 

Subroutine pressure_bc

  Integer :: ix, iy
  Real    :: rhou
  
  ! *** loop over nodes on the west boundary
  ix = 2
  do iy = 2, ny-1
    rhou = rhoin - (f(1,ix,iy) + f(3,ix,iy) + f(5,ix,iy) + 2.*(f(4,ix,iy) + f(7,ix,iy) + f(8,ix,iy)))
    
    f(2,ix,iy) = f(4,ix,iy) + 2./3.*rhou
    f(6,ix,iy) = f(8,ix,iy) + 1./6.*rhou - 1./2.*(f(3,ix,iy) - f(5,ix,iy))
    f(9,ix,iy) = f(7,ix,iy) + 1./6.*rhou + 1./2.*(f(3,ix,iy) - f(5,ix,iy))
  end do

  ! *** loop over nodes on the east boundary
  ix = nx - 1
  do iy = 2, ny-1
    rhou = -rhoout + (f(1,ix,iy) + f(3,ix,iy) + f(5,ix,iy) + 2.*(f(2,ix,iy) + f(6,ix,iy) + f(9,ix,iy)))
    
    f(4,ix,iy) = f(2,ix,iy) - 2./3.*rhou
    f(7,ix,iy) = f(9,ix,iy) - 1./6.*rhou - 1./2.*(f(3,ix,iy) - f(5,ix,iy))
    f(8,ix,iy) = f(6,ix,iy) - 1./6.*rhou + 1./2.*(f(3,ix,iy) - f(5,ix,iy))
  end do

End subroutine pressure_bc

!---------------------------------------------------------------------------!
! Subroutine: velocity_bc
!
!> @details Implementing the imposing velocity boundary condition
!
!> @author Duc Kien Tran
!> @date 02/07/2020
!---------------------------------------------------------------------------! 

Subroutine velocity_bc

End subroutine velocity_bc

end module mod_BCs