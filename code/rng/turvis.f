cfsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
c
c
      subroutine turvis
c
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c
	include 'header'
c
       do 10 i=2,ire
       do 10 j=2,jre
c
       if(i.ge.ia .and. i.le.ib
     $   .and. j.ge.ja .and. j.le.jb)goto 10
c
       vist(i,j)=(1.0+(cm*re*(xk2(i,j)**2.0)/d2(i,j))**0.5)**2.0
c
 10    continue
c
        return
        end
c
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
