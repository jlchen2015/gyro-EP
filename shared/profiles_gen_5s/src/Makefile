include ${GYROEP_ROOT}/shared/install/make.inc.${GYROEP_PLATFORM}

ifeq ($(OPT),debug)
   FFLAGS=${FDEBUG}
else
   FFLAGS=${FOPT}
endif



EXEC = prgen

OBJECTS = prgen_globals.o \
          prgen_fluxfit_globals.o \
          allocate_internals.o \
          allocate_iterdb_vars.o \
          allocate_plasmastate_vars.o \
	  allocate_peqdsk_vars.o \
	  allocate_corsica_vars.o \
	  allocate_ufile_vars.o \
          prgen_get_chi.o \
          prgen_map_iterdb.o \
          prgen_map_null.o \
          prgen_map_plasmastate.o \
	  prgen_map_peqdsk.o \
	  prgen_map_corsica.o \
	  prgen_map_ufile.o \
	  prgen_map_inputprofiles.o \
          prgen_read_cer.o \
          prgen_read_gato.o \
          prgen_read_iterdb.o \
          prgen_read_iterdb_nc.o \
          prgen_read_null.o \
          prgen_read_plasmastate.o \
	  prgen_read_peqdsk.o \
	  prgen_read_corsica.o \
	  prgen_read_ufile.o \
	  prgen_read_inputprofiles.o \
          prgen_write.o \
          fluxfit_driver.o \
          fluxfit_moments.o \
          fluxfit_intersect.o \
          fluxfit_minmax.o \
          fluxfit_fourier.o \
          fluxfit_error.o \
          fluxfit_f_model.o \
          $(EXEC).o

.SUFFIXES : .o .f90

exec: $(OBJECTS)
	$(FC) $(FMATH) $(FFLAGS) -o $(EXEC) $(OBJECTS) $(EXTRA_LIBS)

.f90.o :
	$(FC) $(FMATH) $(FFLAGS) -I $(NETCDF_INC) -c $<

clean:
	rm -f *.o $(EXEC)
	rm -f ${GYROEP_ROOT}/modules/prgen*.mod
