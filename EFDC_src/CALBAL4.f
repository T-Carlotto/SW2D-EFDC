      SUBROUTINE CALBAL4  
C  
C CHANGE RECORD  
C **  SUBROUTINES CALBAL CALCULATE GLOBAL VOLUME, MASS, MOMENTUM,  
C **  AND ENERGY BALANCES  
C  
      USE GLOBAL  
	IMPLICIT NONE
	INTEGER::L,LN,K
	REAL::DUTMP,DVTMP
C  
C **  CALCULATE MOMENTUM AND ENERGY DISSIPATION  
C  
      DO L=2,LA  
        LN=LNC(L)  
        UUEOUT=UUEOUT+0.5*SPB(L)*DXYP(L)*(U(L,1)*TBX(L)+U(LEAST(L),1)*TBX(
     &       LEAST(L))-U(L,KC)*TSX(L)-U(LEAST(L),KC)*TSX(LEAST(L)))  
        VVEOUT=VVEOUT+0.5*SPB(L)*DXYP(L)*(V(L,1)*TBY(L)+V(LN,1)*TBX(LN)  
     &      -V(L,KC)*TSY(L)-V(LN,KC)*TSX(LN))  
      ENDDO  
      DO K=1,KS  
        DO L=2,LA  
          LN=LNC(L)  
          DUTMP=0.5*( U(L,K+1)+U(LEAST(L),K+1)-U(L,K)-U(LEAST(L),K) )  
          DVTMP=0.5*( V(L,K+1)+V(LN,K+1)-V(L,K)-V(LN,K) )  
          UUEOUT=UUEOUT+SPB(L)*2.0*DXYP(L)*AV(L,K)  
     &        *( DUTMP*DUTMP )/(DZC(K+1)+DZC(K))  
          VVEOUT=VVEOUT+SPB(L)*2.0*DXYP(L)*AV(L,K)  
     &        *( DVTMP*DVTMP )/(DZC(K+1)+DZC(K))  
          BBEOUT=BBEOUT+SCB(L)*DXYP(L)*HP(L)  
     &        *GP*AB(L,K)*(B(L,K+1)-B(L,K))  
        ENDDO  
      ENDDO  
      RETURN  
      END  

