module var_global
  implicit none
  
  integer, parameter :: rkd = 8    !< real(rkd) for double precision
  integer, parameter :: rk4 = 4    !< real(rk4) for single precision
  integer (kind = rk4), parameter :: nv  = 9    !< Number of mirco velocity components
  
  integer (kind = rk4) :: nx       !< Number of nodes along x direction
  integer (kind = rk4) :: ny       !< Number of nodes along y direction
  integer (kind = rk4) :: nstep    !< Number of time steps
  
  Real    (kind = rk4), allocatable :: f (:,:,:)    !< Distribution function
  Real    (kind = rk4), allocatable :: fc(:,:,:)    !< Post-colision distribution function
  Real    (kind = rk4)  :: tau        !< Relaxation time
  Real    (kind = rk4)  :: rho0       !< Initial fluid density
  Real    (kind = rk4)  :: rhoin      !< Fluid density at inlet
  Real    (kind = rk4)  :: rhoout     !< Fluid density at outlet 
  
end module var_global