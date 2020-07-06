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

  Real    (kind = rk4), allocatable :: ux  (:,:)    !< Fluid velocity components in x direction
  Real    (kind = rk4), allocatable :: uy  (:,:)    !< Fluid velocity components in y direction
  Real    (kind = rk4), allocatable :: rho (:,:)    !< Fluid density
  Real    (kind = rk4), allocatable :: cx    (:)    !< Lattice velocity components in x direction
  Real    (kind = rk4), allocatable :: cy    (:)    !< Lattice velocity components in y direction
  Real    (kind = rk4), allocatable :: w     (:)    !< Weights of the equilibrium distribution function
  Integer (kind = rk4), allocatable :: opp   (:)    !< Oposite components of lattice velocities
  
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
  
    integer :: ix, iy, iv
    
    allocate(f (nv,nx,ny))
    allocate(fc(nv,nx,ny))
    allocate(ux(nx,ny))
    allocate(uy(nx,ny))
    allocate(rho(nx,ny))
    allocate(cx(nv))
    allocate(cy(nv))
    allocate(w(nv))
    allocate(opp(nv))
    
    ! *** lattice velocity components
    cx = [0., 1., 0., -1., 0., 1., -1., -1., 1.]
    cy = [0., 0., 1., 0., -1., 1., 1., -1., -1.]
    
    ! *** equilibrium distribution weights
    w = [4./9., 1./9., 1./9., 1./9., 1./9., 1./36., 1./36., 1./36., 1./36.]
    
    ! *** oposite directions of lattice velocity components
    opp = [1, 4, 5, 2, 3, 8, 6, 9, 7]
    
    ! *** node-dependent quantities
    rho = rho0
    ux  = 0.
    uy  = 0.

    do iv = 1, nv
      f (iv,:,:) = rho0*w(iv)
      fc(iv,:,:) = rho0*w(iv)
    end do
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
    
    Integer :: ix, iy, iv
    Real (kind = rk4) :: unx, uny, rhon
    Real (kind = rk4) :: udotu, cdotu, feq
    
    do iy = 2, ny-1
      do ix = 2, nx-1
        unx  = ux (ix,iy)
        uny  = uy (ix,iy)
        rhon = rho(ix,iy)
        udotu = unx*uny
        
        do iv = 1, nv
          cdotu = cx(iv)*unx + cy(iv)*uny
          feq = rhon*w(iv)*(1. + 3.*cdotu + 4.5*cdotu*cdotu - 1.5*udotu)
          fc(iv,ix,iy) = f(iv,ix,iy) - (f(iv,ix,iy) - feq)/tau
        end do
      end do
    end do
    
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
    
    Integer :: ix, iy, iv, x, y
    
    do iv = 1, nv
      x = int(cx(iv))
      y = int(cy(iv))
      do iy = 2, ny-1
        do ix = 2, nx-1
          f(iv,ix,iy) = f(iv,ix-x,iy-y)
        end do
      end do
    end do
    
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
    
    Integer :: ix, iy, iv
        
    do iy = 2, ny-1
      do ix = 2, nx-1
        rho(ix,iy) = f(1,ix,iy)
        ux (ix,iy) = 0.
        uy (ix,iy) = 0.
        do iv = 2, nv
          rho(ix,iy) = rho(ix,iy) + f(iv,ix,iy)
          ux (ix,iy) = ux (ix,iy) + f(iv,ix,iy)*cx(iv)
          uy (ix,iy) = uy (ix,iy) + f(iv,ix,iy)*cy(iv)
        end do
        ux(ix,iy) = ux(ix,iy)/rho(ix,iy)
        uy(ix,iy) = uy(ix,iy)/rho(ix,iy)
      end do
    end do
    
  End subroutine macro_field 
  
  
End module mod_LB