      SUBROUTINE SMATRIXHEL(P,HEL,ANS)
      IMPLICIT NONE
C     
C     CONSTANT
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER                 NCOMB
      PARAMETER (             NCOMB=32)
CF2PY INTENT(OUT) :: ANS
CF2PY INTENT(IN) :: HEL
CF2PY INTENT(IN) :: P(0:3,NEXTERNAL)

C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
      INTEGER HEL
C     
C     GLOBAL VARIABLES
C     
      INTEGER USERHEL
      COMMON/HELUSERCHOICE/USERHEL
C     ----------
C     BEGIN CODE
C     ----------
      USERHEL=HEL
      CALL SMATRIX(P,ANS)
      USERHEL=-1

      END

      SUBROUTINE SMATRIX(P,ANS)
C     
C     Generated by MadGraph5_aMC@NLO v. 2.5.2, 2016-12-10
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     MadGraph5_aMC@NLO StandAlone Version
C     
C     Returns amplitude squared summed/avg over colors
C     and helicities
C     for the point in phase space P(0:3,NEXTERNAL)
C     
C     Process: g u > x0 u c c~ QNP<=2 WEIGHTED<=5 @1
C     Process: g u > x0 u d d~ QNP<=2 WEIGHTED<=5 @1
C     Process: g u > x0 u s s~ QNP<=2 WEIGHTED<=5 @1
C     Process: g c > x0 c u u~ QNP<=2 WEIGHTED<=5 @1
C     Process: g c > x0 c d d~ QNP<=2 WEIGHTED<=5 @1
C     Process: g c > x0 c s s~ QNP<=2 WEIGHTED<=5 @1
C     Process: g d > x0 d u u~ QNP<=2 WEIGHTED<=5 @1
C     Process: g d > x0 d c c~ QNP<=2 WEIGHTED<=5 @1
C     Process: g d > x0 d s s~ QNP<=2 WEIGHTED<=5 @1
C     Process: g s > x0 s u u~ QNP<=2 WEIGHTED<=5 @1
C     Process: g s > x0 s c c~ QNP<=2 WEIGHTED<=5 @1
C     Process: g s > x0 s d d~ QNP<=2 WEIGHTED<=5 @1
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER    NINITIAL
      PARAMETER (NINITIAL=2)
      INTEGER NPOLENTRIES
      PARAMETER (NPOLENTRIES=(NEXTERNAL+1)*6)
      INTEGER                 NCOMB
      PARAMETER (             NCOMB=32)
      INTEGER HELAVGFACTOR
      PARAMETER (HELAVGFACTOR=4)
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
CF2PY INTENT(OUT) :: ANS
CF2PY INTENT(IN) :: P(0:3,NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER NHEL(NEXTERNAL,NCOMB),NTRY
      REAL*8 T
      REAL*8 MATRIX
      INTEGER IHEL,IDEN, I, J
C     For a 1>N process, them BEAMTWO_HELAVGFACTOR would be set to 1.
      INTEGER BEAMS_HELAVGFACTOR(2)
      DATA (BEAMS_HELAVGFACTOR(I),I=1,2)/2,2/
      INTEGER JC(NEXTERNAL)
      LOGICAL GOODHEL(NCOMB)
      DATA NTRY/0/
      DATA GOODHEL/NCOMB*.FALSE./

C     
C     GLOBAL VARIABLES
C     
      INTEGER USERHEL
      COMMON/HELUSERCHOICE/USERHEL
      DATA USERHEL/-1/

      DATA (NHEL(I,   1),I=1,6) /-1, 1, 0,-1,-1, 1/
      DATA (NHEL(I,   2),I=1,6) /-1, 1, 0,-1,-1,-1/
      DATA (NHEL(I,   3),I=1,6) /-1, 1, 0,-1, 1, 1/
      DATA (NHEL(I,   4),I=1,6) /-1, 1, 0,-1, 1,-1/
      DATA (NHEL(I,   5),I=1,6) /-1, 1, 0, 1,-1, 1/
      DATA (NHEL(I,   6),I=1,6) /-1, 1, 0, 1,-1,-1/
      DATA (NHEL(I,   7),I=1,6) /-1, 1, 0, 1, 1, 1/
      DATA (NHEL(I,   8),I=1,6) /-1, 1, 0, 1, 1,-1/
      DATA (NHEL(I,   9),I=1,6) /-1,-1, 0,-1,-1, 1/
      DATA (NHEL(I,  10),I=1,6) /-1,-1, 0,-1,-1,-1/
      DATA (NHEL(I,  11),I=1,6) /-1,-1, 0,-1, 1, 1/
      DATA (NHEL(I,  12),I=1,6) /-1,-1, 0,-1, 1,-1/
      DATA (NHEL(I,  13),I=1,6) /-1,-1, 0, 1,-1, 1/
      DATA (NHEL(I,  14),I=1,6) /-1,-1, 0, 1,-1,-1/
      DATA (NHEL(I,  15),I=1,6) /-1,-1, 0, 1, 1, 1/
      DATA (NHEL(I,  16),I=1,6) /-1,-1, 0, 1, 1,-1/
      DATA (NHEL(I,  17),I=1,6) / 1, 1, 0,-1,-1, 1/
      DATA (NHEL(I,  18),I=1,6) / 1, 1, 0,-1,-1,-1/
      DATA (NHEL(I,  19),I=1,6) / 1, 1, 0,-1, 1, 1/
      DATA (NHEL(I,  20),I=1,6) / 1, 1, 0,-1, 1,-1/
      DATA (NHEL(I,  21),I=1,6) / 1, 1, 0, 1,-1, 1/
      DATA (NHEL(I,  22),I=1,6) / 1, 1, 0, 1,-1,-1/
      DATA (NHEL(I,  23),I=1,6) / 1, 1, 0, 1, 1, 1/
      DATA (NHEL(I,  24),I=1,6) / 1, 1, 0, 1, 1,-1/
      DATA (NHEL(I,  25),I=1,6) / 1,-1, 0,-1,-1, 1/
      DATA (NHEL(I,  26),I=1,6) / 1,-1, 0,-1,-1,-1/
      DATA (NHEL(I,  27),I=1,6) / 1,-1, 0,-1, 1, 1/
      DATA (NHEL(I,  28),I=1,6) / 1,-1, 0,-1, 1,-1/
      DATA (NHEL(I,  29),I=1,6) / 1,-1, 0, 1,-1, 1/
      DATA (NHEL(I,  30),I=1,6) / 1,-1, 0, 1,-1,-1/
      DATA (NHEL(I,  31),I=1,6) / 1,-1, 0, 1, 1, 1/
      DATA (NHEL(I,  32),I=1,6) / 1,-1, 0, 1, 1,-1/
      DATA IDEN/96/

      INTEGER POLARIZATIONS(0:NEXTERNAL,0:5)
      DATA ((POLARIZATIONS(I,J),I=0,NEXTERNAL),J=0,5)/NPOLENTRIES*-1/
      COMMON/BORN_BEAM_POL/POLARIZATIONS
C     
C     FUNCTIONS
C     
      LOGICAL IS_BORN_HEL_SELECTED

C     ----------
C     BEGIN CODE
C     ----------
      IF(USERHEL.EQ.-1) NTRY=NTRY+1
      DO IHEL=1,NEXTERNAL
        JC(IHEL) = +1
      ENDDO
C     When spin-2 particles are involved, the Helicity filtering is
C      dangerous for the 2->1 topology.
C     This is because depending on the MC setup the initial PS points
C      have back-to-back initial states
C     for which some of the spin-2 helicity configurations are zero.
C      But they are no longer zero
C     if the point is boosted on the z-axis. Remember that HELAS
C      helicity amplitudes are no longer
C     lorentz invariant with expternal spin-2 particles (only the
C      helicity sum is).
C     For this reason, we simply remove the filterin when there is
C      only three external particles.
      IF (NEXTERNAL.LE.3) THEN
        DO IHEL=1,NCOMB
          GOODHEL(IHEL)=.TRUE.
        ENDDO
      ENDIF
      ANS = 0D0
      DO IHEL=1,NCOMB
        IF (USERHEL.EQ.-1.OR.USERHEL.EQ.IHEL) THEN
          IF (GOODHEL(IHEL) .OR. NTRY .LT. 20.OR.USERHEL.NE.-1) THEN
            IF(NTRY.GE.2.AND.POLARIZATIONS(0,0).NE.
     $       -1.AND.(.NOT.IS_BORN_HEL_SELECTED(IHEL))) THEN
              CYCLE
            ENDIF
            T=MATRIX(P ,NHEL(1,IHEL),JC(1))
            IF(POLARIZATIONS(0,0).EQ.-1.OR.IS_BORN_HEL_SELECTED(IHEL))
     $        THEN
              ANS=ANS+T
            ENDIF
            IF (T .NE. 0D0 .AND. .NOT.    GOODHEL(IHEL)) THEN
              GOODHEL(IHEL)=.TRUE.
            ENDIF
          ENDIF
        ENDIF
      ENDDO
      ANS=ANS/DBLE(IDEN)
      IF(USERHEL.NE.-1) THEN
        ANS=ANS*HELAVGFACTOR
      ELSE
        DO J=1,NINITIAL
          IF (POLARIZATIONS(J,0).NE.-1) THEN
            ANS=ANS*BEAMS_HELAVGFACTOR(J)
            ANS=ANS/POLARIZATIONS(J,0)
          ENDIF
        ENDDO
      ENDIF
      END


      REAL*8 FUNCTION MATRIX(P,NHEL,IC)
C     
C     Generated by MadGraph5_aMC@NLO v. 2.5.2, 2016-12-10
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     Returns amplitude squared summed/avg over colors
C     for the point with external lines W(0:6,NEXTERNAL)
C     
C     Process: g u > x0 u c c~ QNP<=2 WEIGHTED<=5 @1
C     Process: g u > x0 u d d~ QNP<=2 WEIGHTED<=5 @1
C     Process: g u > x0 u s s~ QNP<=2 WEIGHTED<=5 @1
C     Process: g c > x0 c u u~ QNP<=2 WEIGHTED<=5 @1
C     Process: g c > x0 c d d~ QNP<=2 WEIGHTED<=5 @1
C     Process: g c > x0 c s s~ QNP<=2 WEIGHTED<=5 @1
C     Process: g d > x0 d u u~ QNP<=2 WEIGHTED<=5 @1
C     Process: g d > x0 d c c~ QNP<=2 WEIGHTED<=5 @1
C     Process: g d > x0 d s s~ QNP<=2 WEIGHTED<=5 @1
C     Process: g s > x0 s u u~ QNP<=2 WEIGHTED<=5 @1
C     Process: g s > x0 s c c~ QNP<=2 WEIGHTED<=5 @1
C     Process: g s > x0 s d d~ QNP<=2 WEIGHTED<=5 @1
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NGRAPHS
      PARAMETER (NGRAPHS=12)
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER    NWAVEFUNCS, NCOLOR
      PARAMETER (NWAVEFUNCS=10, NCOLOR=4)
      REAL*8     ZERO
      PARAMETER (ZERO=0D0)
      COMPLEX*16 IMAG1
      PARAMETER (IMAG1=(0D0,1D0))
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL)
      INTEGER NHEL(NEXTERNAL), IC(NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER I,J
      COMPLEX*16 ZTEMP
      REAL*8 DENOM(NCOLOR), CF(NCOLOR,NCOLOR)
      COMPLEX*16 AMP(NGRAPHS), JAMP(NCOLOR)
      COMPLEX*16 W(20,NWAVEFUNCS)
      COMPLEX*16 DUM0,DUM1
      DATA DUM0, DUM1/(0D0, 0D0), (1D0, 0D0)/
C     
C     GLOBAL VARIABLES
C     
      INCLUDE 'coupl.inc'

C     
C     COLOR DATA
C     
      DATA DENOM(1)/1/
      DATA (CF(I,  1),I=  1,  4) /   12,    4,    4,    0/
C     1 T(1,4,2) T(5,6)
      DATA DENOM(2)/1/
      DATA (CF(I,  2),I=  1,  4) /    4,   12,    0,    4/
C     1 T(1,4,6) T(5,2)
      DATA DENOM(3)/1/
      DATA (CF(I,  3),I=  1,  4) /    4,    0,   12,    4/
C     1 T(1,5,2) T(4,6)
      DATA DENOM(4)/1/
      DATA (CF(I,  4),I=  1,  4) /    0,    4,    4,   12/
C     1 T(1,5,6) T(4,2)
C     ----------
C     BEGIN CODE
C     ----------
      CALL VXXXXX(P(0,1),ZERO,NHEL(1),-1*IC(1),W(1,1))
      CALL IXXXXX(P(0,2),ZERO,NHEL(2),+1*IC(2),W(1,2))
      CALL SXXXXX(P(0,3),+1*IC(3),W(1,3))
      CALL OXXXXX(P(0,4),ZERO,NHEL(4),+1*IC(4),W(1,4))
      CALL OXXXXX(P(0,5),ZERO,NHEL(5),+1*IC(5),W(1,5))
      CALL IXXXXX(P(0,6),ZERO,NHEL(6),-1*IC(6),W(1,6))
      CALL FFV1_2(W(1,2),W(1,1),GC_7,ZERO,ZERO,W(1,7))
      CALL FFV1P0_3(W(1,6),W(1,5),GC_7,ZERO,ZERO,W(1,8))
      CALL FFV1P0_3(W(1,7),W(1,4),GC_7,ZERO,ZERO,W(1,9))
C     Amplitude(s) for diagram number 1
      CALL VVS2_6_0(W(1,8),W(1,9),W(1,3),GC_64,GC_10,AMP(1))
      CALL VVS2_6P0_1(W(1,1),W(1,3),GC_64,GC_10,ZERO,ZERO,W(1,9))
      CALL FFV1P0_3(W(1,2),W(1,4),GC_7,ZERO,ZERO,W(1,7))
      CALL FFV1_1(W(1,5),W(1,9),GC_7,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 2
      CALL FFV1_0(W(1,6),W(1,10),W(1,7),GC_7,AMP(2))
      CALL FFV1_2(W(1,6),W(1,9),GC_7,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 3
      CALL FFV1_0(W(1,10),W(1,5),W(1,7),GC_7,AMP(3))
C     Amplitude(s) for diagram number 4
      CALL VVV8_0(W(1,9),W(1,7),W(1,8),GC_6,AMP(4))
      CALL FFV1_2(W(1,2),W(1,9),GC_7,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 5
      CALL FFV1_0(W(1,10),W(1,4),W(1,8),GC_7,AMP(5))
      CALL FFV1_1(W(1,4),W(1,9),GC_7,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 6
      CALL FFV1_0(W(1,2),W(1,10),W(1,8),GC_7,AMP(6))
      CALL FFV1_1(W(1,4),W(1,1),GC_7,ZERO,ZERO,W(1,10))
      CALL FFV1P0_3(W(1,2),W(1,10),GC_7,ZERO,ZERO,W(1,4))
C     Amplitude(s) for diagram number 7
      CALL VVS2_6_0(W(1,8),W(1,4),W(1,3),GC_64,GC_10,AMP(7))
      CALL FFV1_1(W(1,5),W(1,1),GC_7,ZERO,ZERO,W(1,4))
      CALL FFV1P0_3(W(1,6),W(1,4),GC_7,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 8
      CALL VVS2_6_0(W(1,7),W(1,10),W(1,3),GC_64,GC_10,AMP(8))
      CALL FFV1_2(W(1,6),W(1,1),GC_7,ZERO,ZERO,W(1,10))
      CALL FFV1P0_3(W(1,10),W(1,5),GC_7,ZERO,ZERO,W(1,6))
C     Amplitude(s) for diagram number 9
      CALL VVS2_6_0(W(1,7),W(1,6),W(1,3),GC_64,GC_10,AMP(9))
C     Amplitude(s) for diagram number 10
      CALL VVVS1_2_0(W(1,1),W(1,7),W(1,8),W(1,3),GC_65,GC_11,AMP(10))
      CALL VVV8P0_1(W(1,1),W(1,7),GC_6,ZERO,ZERO,W(1,6))
C     Amplitude(s) for diagram number 11
      CALL VVS2_6_0(W(1,8),W(1,6),W(1,3),GC_64,GC_10,AMP(11))
      CALL VVV8P0_1(W(1,1),W(1,8),GC_6,ZERO,ZERO,W(1,6))
C     Amplitude(s) for diagram number 12
      CALL VVS2_6_0(W(1,7),W(1,6),W(1,3),GC_64,GC_10,AMP(12))
      JAMP(1)=+1D0/2D0*(+1D0/3D0*AMP(1)+1D0/3D0*AMP(5)+1D0/3D0*AMP(6)
     $ +1D0/3D0*AMP(7))
      JAMP(2)=+1D0/2D0*(-AMP(3)-IMAG1*AMP(4)-AMP(6)-AMP(7)-AMP(9)
     $ -IMAG1*AMP(10)-IMAG1*AMP(11)+IMAG1*AMP(12))
      JAMP(3)=+1D0/2D0*(-AMP(1)-AMP(2)+IMAG1*AMP(4)-AMP(5)-AMP(8)
     $ +IMAG1*AMP(10)+IMAG1*AMP(11)-IMAG1*AMP(12))
      JAMP(4)=+1D0/2D0*(+1D0/3D0*AMP(2)+1D0/3D0*AMP(3)+1D0/3D0*AMP(8)
     $ +1D0/3D0*AMP(9))

      MATRIX = 0.D0
      DO I = 1, NCOLOR
        ZTEMP = (0.D0,0.D0)
        DO J = 1, NCOLOR
          ZTEMP = ZTEMP + CF(J,I)*JAMP(J)
        ENDDO
        MATRIX = MATRIX+ZTEMP*DCONJG(JAMP(I))/DENOM(I)
      ENDDO

      END

      SUBROUTINE GET_ME(P, ALPHAS, NHEL ,ANS)
      IMPLICIT NONE
C     
C     CONSTANT
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
      INTEGER NHEL
      DOUBLE PRECISION ALPHAS
      REAL*8 PI
CF2PY INTENT(OUT) :: ANS
CF2PY INTENT(IN) :: NHEL
CF2PY INTENT(IN) :: P(0:3,NEXTERNAL)
CF2PY INTENT(IN) :: ALPHAS
C     ROUTINE FOR F2PY to read the benchmark point.    
C     the include file with the values of the parameters and masses 
      INCLUDE 'coupl.inc'

      PI = 3.141592653589793D0
      G = 2* DSQRT(ALPHAS*PI)
      CALL UPDATE_AS_PARAM()
      IF (NHEL.NE.0) THEN
        CALL SMATRIXHEL(P, NHEL, ANS)
      ELSE
        CALL SMATRIX(P, ANS)
      ENDIF
      RETURN
      END

      SUBROUTINE INITIALISE(PATH)
C     ROUTINE FOR F2PY to read the benchmark point.    
      IMPLICIT NONE
      CHARACTER*180 PATH
CF2PY INTENT(IN) :: PATH
      CALL SETPARA(PATH)  !first call to setup the paramaters    
      RETURN
      END

      LOGICAL FUNCTION IS_BORN_HEL_SELECTED(HELID)
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER    NCOMB
      PARAMETER (NCOMB=32)
C     
C     ARGUMENTS
C     
      INTEGER HELID
C     
C     LOCALS
C     
      INTEGER I,J
      LOGICAL FOUNDIT
C     
C     GLOBALS
C     
      INTEGER HELC(NEXTERNAL,NCOMB)
      COMMON/BORN_HEL_CONFIGS/HELC

      INTEGER POLARIZATIONS(0:NEXTERNAL,0:5)
      COMMON/BORN_BEAM_POL/POLARIZATIONS
C     ----------
C     BEGIN CODE
C     ----------

      IS_BORN_HEL_SELECTED = .TRUE.
      IF (POLARIZATIONS(0,0).EQ.-1) THEN
        RETURN
      ENDIF

      DO I=1,NEXTERNAL
        IF (POLARIZATIONS(I,0).EQ.-1) THEN
          CYCLE
        ENDIF
        FOUNDIT = .FALSE.
        DO J=1,POLARIZATIONS(I,0)
          IF (HELC(I,HELID).EQ.POLARIZATIONS(I,J)) THEN
            FOUNDIT = .TRUE.
            EXIT
          ENDIF
        ENDDO
        IF(.NOT.FOUNDIT) THEN
          IS_BORN_HEL_SELECTED = .FALSE.
          RETURN
        ENDIF
      ENDDO

      RETURN
      END

