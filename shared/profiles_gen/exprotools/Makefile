include ${GYROEP_ROOT}/shared/install/make.inc.${GYROEP_PLATFORM}

ifeq ($(OPT),debug)
   FFLAGS=${FDEBUG}
else
   FFLAGS=${FOPT}
endif

EXEC = exprodump

EXTRA_LIBS = ${GYROEP_ROOT}/shared/EXPRO/EXPRO_lib.a \
             ${GYROEP_ROOT}/shared/GEO/GEO_lib.a  \
             ${GYROEP_ROOT}/shared/math/math_lib.a

OBJECTS = create_globals.o \
          create_check.o \
          create_importvec.o \
          create_set.o \
          create_read_input.o \
          create_write.o

.SUFFIXES : .o .f90

all : $(EXEC)

$(EXEC): $(EXEC).o $(EXTRA_LIBS)
	$(FC) $(FFLAGS) -o $(EXEC) $(EXEC).o $(EXTRA_LIBS) $(LMATH)

.f90.o :
	$(FC) $(FMATH) $(FFLAGS) -c $<

clean:
	rm -f *.o $(EXEC)
