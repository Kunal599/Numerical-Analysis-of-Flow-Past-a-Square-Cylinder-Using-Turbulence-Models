
################################################################
#
#      Erweiterter Compile-File fuer das Uebersetzen und Laden
#      eines Hauptprogrammes und mehrerer Unterprogramme unter
#      Ausnutzung bestimmter Voreinstellungen, die im System
#      bereits vorhanden sind. zone.o nusselt.o boundk.o
# 
##################################################################### open.o


#FFLAGS= -fsources -C
#FFLAGS= -qsource -C
#FFLAGS= -O -Pk
FFLAGS= -g
LDFLAGS=
LIBS=

OBJS= bcc.o bckd.o bcns.o bcobw.o bcobwkd.o bcyl2d.o ceqcp.o conti.o \
      init.o kdalt.o kdeqcp.o nseqcp.o otpt.o otre.o \
      restar.o start.o ticorr.o tigrad.o turbu.o turvis.o \
      velalt.o wall_u.o wall_v.o wallkd_x.o wallkd_y.o willi.o \

comp:	$(OBJS) 
	f77  $(FFLAGS) $(OBJS) $(LIBS) -o result
#####################################################################  boundt.o  mesh.o
