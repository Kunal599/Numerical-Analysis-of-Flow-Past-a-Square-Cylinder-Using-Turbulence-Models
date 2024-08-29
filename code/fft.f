C
        PROGRAM FFT

C       CALCULATION OF FREQUENCY SPECTRUM  OF DIGITIZED
C       SIGNALS USING FFT.
C
C      a(i) = Time series stored in data file input.dat
C
C      nu =Power of 2 for total number of points (n) in
C            the input data
C
C       ndata = Total number of points in input data
C
C       del = Time interval between any two points
C
C       b(jj) = Frequency hormonics
C
c        dimension a(16384),power(16384),b(16384),phase(16384)
        dimension a(32768),power(32768),b(32768),phase(32768)
c        complex x(16384)
        complex x(32768)
	character*25 infile,outfile
C
        print *, 'what are nu ndata del '
        read *, nu,ndata,del
C
	print*,'Specify input file name'
	read*,infile
C
	print*,'Specify Blockage Ratio'
	read*,br
C
        n=2**nu
        fmax=1.0/del
        tt=del*(n-1)
        pi=3.1415926
C
        open(unit=21,file=infile)
	do i =1,ndata
        read(21,*)t,a(i)
	enddo
c
c       remove  stray mean.
c
        call trap(a,ndata,e)
        do 65 i=1,ndata
        a(i)=a(i)-e
65      continue
c
c       Zero padding
c
        do 45 i=ndata+1,n
        a(i)=0.0
45      continue

        call fftr (a,b,x,nu,del)
        do 100 i=1,n
        r=real(x(i))
        s=imag(x(i))
        power(i)=sqrt(r**2+s**2)
        phase(i)=atan(s/r)
100     continue
c
        nd2=n/2
        fnyq=0.5*fmax
c
c       Output stored in freq.dat
c
	print*,'Specify Output file name'
	read*,outfile
c
        open(unit=24,file=outfile)
        write(24,1230)
1230    format(/2x,'freq in Hz.; amplitude dimensional',/)
c
        write(24,1225)
1225    format(/22x,'             amplitude')
c 
        write(24,1200)
1200    format(/6x,'freq',12x,'mod')
c 
        write(24,1250) (b(i)*br,power(i),i=1,nd2)
1250    format(2x,e12.5,4x,e12.5)
c
        stop
        end
C
        subroutine fftr(a,b,x,nu,del)
c        dimension  x(16384),b(16384),a(16384)
        dimension  x(32768),b(32768),a(32768)
        complex x,u,w,t
        n=2**nu
        pi=3.141592653
c       --------------------
        tt=(n-1)*del
        do 5 jj=1,n
        b(jj) = (jj-1)/tt
5       continue
c       --------------------
        do 6 i=1,n
        x(i)=cmplx(a(i),0.0)
6       continue
c       FFT ALGORITHUM
        do 20 l=1,nu
        le=2**(nu+1-l)
        le1=le/2
        u=(1.,0.)
        w=cmplx(cos(pi/float(le1)),-sin(pi/float(le1)))
        do 20 j=1,le1
        do 10 i=j,n,le
        ip=i+le1
        t=x(i)+x(ip)
        x(ip)=(x(i)-x(ip))*u
10      x(i)=t
20      u=u*w
c       BIT REVERSAL TECHNIQUE
        nv2=n/2
        nm1=n-1
        j=1
        do 30 i=1,nm1
        if(i.ge.j)go to 25
        t=x(j)
        x(j)=x(i)
        x(i)=t
25      k=nv2
35      if(k.ge.j)go to 30
        j=j-k
        k=k/2
        go to 35
30      j=j+k
        return
        end
        subroutine simpson (x,n,e)
        dimension x(3200)
        fx=0.0
        do 5 i=2,n-1,2
5       fx=fx+x(i)
        fy=0.0
        do 10 i=3,n-2,2
10      fy=fy+x(i)
        e=(x(1)+x(n)+4.0*fx+2.0*fy)/(3.0*(n-1))
        return
        end
        subroutine trap(x,n,e)
        dimension x(32768)
        fx=0.0
        do 10 i=2,n-1
        fx=fx+x(i)
10      continue
        e=(x(1)+x(n)+2.0*fx)/(2.0*(n-1))
        return
        end
