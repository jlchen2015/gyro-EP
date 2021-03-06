include shared/install/make.inc.${GYROEP_PLATFORM}

ifeq ($(OPT),debug)
   FFLAGS=${FDEBUG}
else
   FFLAGS=${FOPT}
endif

FC += ${FOMP}

ifeq ($(ACC),true)
   FC += ${FACC}
endif

#ifeq ($(HDF5),true)
  HDF5LIBS = \
    ${GYROEP_ROOT}/shared/vshdf5/vshdf5_lib.a \
    ${HDF5_LIBS} 
#endif
 
EXEC=gyro

export EXTRA_LIBS = \
       ${GYROEP_ROOT}/shared/EXPRO/EXPRO_lib.a \
       ${GYROEP_ROOT}/shared/math/math_lib.a \
       ${GYROEP_ROOT}/shared/GEO/GEO_lib.a \
       ${GYROEP_ROOT}/shared/UMFPACK/UMFPACK_lib.a \
       ${GYROEP_ROOT}/BLEND/BLEND_lib.a \
       ${GYROEP_ROOT}/TRANSPOSE/TRANSP_lib.a \
       ${GYROEP_ROOT}/SSUB/SSUB_lib.a \
       ${GYROEP_ROOT}/GKEIGEN/GKEIGEN_lib.a \
       ${HDF5LIBS} ${LMATH} ${LIPM}	

all:
	cd ${GYROEP_ROOT}/shared ; make
	cd BLEND ; make 
	cd TRANSPOSE ; make 
	cd SSUB ; make 
	cd src ; make
	cd GKEIGEN ; make

	cd src ; $(FC) $(FFLAGS) -o $(EXEC) $(EXEC).o gyro_lib.a ${EXTRA_LIBS} ${FPETSC}

clean:
	cd shared ; make clean
	cd BLEND ; make clean
	cd TRANSPOSE ; make clean
	cd SSUB ; make clean
	cd src ; make clean
	cd GKEIGEN ; make clean
	cd modules ; rm *.mod ; rm *.f90

	cd src ; rm -f $(EXEC) .VERSION

.IGNORE:
