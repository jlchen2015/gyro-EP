include install/make.inc.${GYROEP_PLATFORM}

all:
	cd math ; make "OPT=${OPT}"
	cd GEO ; make "OPT=${OPT}"
	cd UMFPACK ; make "OPT=${OPT}"
	cd EXPRO ; make "OPT=${OPT}"
	cd profiles_gen ; make "OPT=${OPT}"
	cd vshdf5 ; make "OPT=${OPT}"

clean:
	cd math ; make clean
	cd GEO ; make clean
	cd UMFPACK ; make clean
	cd EXPRO ; make clean
	cd profiles_gen ; make clean
	cd python ; rm -f *.pyc	
	cd vshdf5 ; make clean
