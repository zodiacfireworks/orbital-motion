PROGRAM  tierra_sol   
IMPLICIT NONE 
!----------parametros iniciales---------- 
Real(8),parameter:: pi=3.141516d0
Real(8),parameter:: UA=1.46e11
Real(8),parameter:: G=6.67384e-11
Real(8),parameter:: o=3.156e7 ! o=año en segundos
Real(8),parameter:: GM=4*pi**2
Real(8):: h=0.001
Integer::i
!----------------------------------------

Real(8):: ro,r,x,y,vo,v,vx,vy,a,n
Real(8):: Eco,Epo,Ecf,Epf,Emi,Emf !Energias
Real(8):: L,Lo,Lf !Momento angular


!---------Condiciones Iniciales----------
Real(8),parameter:: m=5.972e24
Real(8),parameter:: xo=0.98d0
Real(8),parameter:: yo=0.0
Real(8),parameter:: vxo=0.0,vyo=sqrt(G*m/0.98**2)
Real(8):: axo,ayo,ax,ay
Real(8),parameter:: to=0.0d0, Tmax=1

!----------------------------------------
open(unit=8,file='datos.txt',action='write')

ro=sqrt(xo**2+yo**2)
vo=sqrt(vxo**2+vyo**2)
Lo=m*(xo*vxo+yo*vyo)
Eco=0.5*m*ro**2
Epo=-GM*m/ro
Emi=Eco+Epo

print*,ro,vo,lo,Eco,Epo,Emi

30 format(3f20.10)
!----------------------------------------
contains
subroutine verlet(x,vx,ax,h)
implicit none
integer::i
real(8)::to,h,x,vx,ax

  do i=1,10

x=x+vx*h+0.5*ax*h**2
!y=y+vy*h+0.5*ay*h**2

vx=vo+0.5*(ax+axo)*h
!vy=vo+0.5*(ay+ayo)*h
  end do 
end subroutine 
!print*,x,y
!Write(8,30)x,y
!to=to+h
!end do
!----------------------------------------
!ax=-(GM*xo)/(ro)**1.5
!axo=ax
!ay=-(GM*yo)/(ro)**1.5
!axo=ay

!----------------------------------------

!ax=-(GM*x)/(x*x+y*y)**1.5
!ay=-(GM*y)/(x*x+y*y)**1.5

!----------------------------------------

!SUBROUTINE inicio(t,xo,yo,x1,y1,vxo,vyo)
!REAL(8) ::xo,yo,vxo,vyo,axo,ayo,x1,y1
!integer::n
!t=0.0d0
!print*,'n:'
!read*,n
!xo=0.98d0;vxo=0.0d0;vyo=sqrt(G*m/0.98**2);axo=GM*xo/sqrt((xo)**2+(yo)**2)**1.5;ayo=GM*xo/sqrt((xo)**2+(yo)**2)**1.5

!do i=1,n
    
   !x1=xo+vxo*h+0.5*axo*h**2
   !y1=yo+vyo*h+0.5*ayo*h**2
 !end do
!t=to+h*n

!END SUBROUTINE




!---------------------------------------

!---------------------------------------
END PROGRAM                                              
