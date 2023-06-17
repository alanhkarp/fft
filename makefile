# makefile for FFT routines - called test

COMPILE = fvs -c -f"ignore sdump opt(3) ad(none) gostmt flag(w) source vector(report(xlist))"
LOAD    = fvs -xa

FFTS  = ffta.o  fftb.o  fftc.o  fftd.o  ffte.o \
        fftf.o  fftg.o  ffth.o  ffti.o  fftj.o \
        fftk.o  fftl.o  fftm.o  fftn.o  ffto.o \
	fftp.o  fftq.o  fftr.o  ffts.o  fftt.o \
	fftu.o  fftv.o  fftw.o  fftx.o  ffty.o \
	fftz.o

TESTDEP = testfft.o coeff24.o ran2.o seconds.o fourn.o fft.o $(FFTS)
FFTSDEP = reorder.o coeffs.o reorderm.o factor.o factor2.o reorder2.o \
          reorder3.o
ALLFILES = $(TESTDEP) $(FFTSDEP) afbvshft.o

.SILENT:

testfft: $(ALLFILES)
	echo Building testfft
	$(LOAD) $(ALLFILES) -o testfft -lesslv

.f.o: 
	echo Compiling $<
	$(COMPILE) $<
