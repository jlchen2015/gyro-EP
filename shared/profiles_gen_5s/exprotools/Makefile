include ${GYROEP_ROOT}/shared/install/make.inc.${GYROEP_PLATFORM}

ifeq ($(OPT),debug)
   FFLAGS=${FDEBUG}
else
   FFLAGS=${FOPT}
endif

EXEC1 = exprodump
EXEC2 = expromake

EXTRA_LIBS = ${GYROEP_ROOT}/shared/EXPRO/EXPRO_lib.a \
             ${GYROEP_ROOT}/shared/GEO/GEO_lib.a  \
             ${GYROEP_ROOT}/shared/math/math_lib.a 

OBJECTS = expromake_globals.o \
          expromake_set.o \
          expromake_read_input.o \
	  expromake_check.o \
          expromake_write.o 

.SUFFIXES : .o .f90

all : $(EXEC1) $(EXEC2)

$(EXEC1): $(EXEC1).o $(OBJECTS)
	$(FC) $(FFLAGS) -o $(EXEC1) $(EXEC1).o $(EXTRA_LIBS) $(LMATH)

$(EXEC2): $(EXEC2).o $(OBJECTS)
	$(FC) $(FFLAGS) -o $(EXEC2) $(EXEC2).o $(OBJECTS) $(EXTRA_LIBS) $(LMATH)

.f90.o :
	$(FC) $(FMATH) $(FFLAGS) -c $<

clean:
	rm -f *.o $(EXEC1) $(EXEC2) ${GYROEP_ROOT}/modules/expromake*.mod
