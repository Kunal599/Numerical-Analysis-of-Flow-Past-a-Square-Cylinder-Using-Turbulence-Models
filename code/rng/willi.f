cmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
c
c
         program willi 
c
c*******************************************************************
c*       program willi for computing flow field in a channel 
c*       with built in square cylinder
c***********************************************************************
c
	 include 'header'
c
c        write(*,23)
c23      format('has entered willi')
c
	open(68,file='pro',form='formatted')
c
	call init
	if (irest.eq.0) call start
	if (irest.eq.1) call restar
 10     call conti
c	open(3,file='iwrite',form='formatted')
c	read (3,*) iwrite
c	read (3,*) itime
	close(3)	
c
c
	if (iwrite.eq.1) then
	call otre
	end if
c
	call turbu
	call velalt
	call ticorr
	call otpt
	call bcyl2d
	call nseqcp
	call bcns
	call tigrad
c
c	*******************************
	if(ita.gt.3500) epsi=0.0001
 	if(ita.lt.3500 .and. ita.gt.3000)epsi=0.0005
c 	if(ita.lt.3000 .and. ita.gt.2400)epsi=0.0005
 	if(ita.lt.3000 .and. ita.gt.2400)epsi=0.001
c 	if(ita.lt.2400 .and. ita.gt.1600)epsi=0.001
 	if(ita.lt.2400 .and. ita.gt.1600)epsi=0.005
 	if(ita.lt.1600 .and. ita.gt.800)epsi=0.005
 	if(ita.lt.800 .and. ita.gt.600)epsi=0.01
 	if(ita.lt.600 .and. ita.gt.400)epsi=0.05
 	if(ita.lt.400 .and. ita.gt.200)epsi=0.1
 	if(ita.lt.200)epsi=0.5
c
c 	if(ita.gt.3000)epsi_ke=0.05
 	if(ita.gt.3000)epsi_ke=1.0
c 	if(ita.lt.3000 .and.ita.gt.2000)epsi_ke=0.1
 	if(ita.lt.3000 .and.ita.gt.2000)epsi_ke=2.0
c 	if(ita.lt.2000 .and.ita.gt.1250)epsi_ke=0.5
 	if(ita.lt.2000 .and.ita.gt.1250)epsi_ke=3.0
 	if(ita.lt.1250 .and.ita.gt.750)epsi_ke=4.0
 	if(ita.lt.750 .and.ita.gt.500)epsi_ke=5.0
 	if(ita.lt.500 .and.ita.gt.250)epsi_ke=7.5
c
c 	write(*,123) epsi
c 123    format(  'epsi = ',e10.4,$)
	goto 10
c	*******************************
c
	end
cmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
