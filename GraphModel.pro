pro GraphModel, type, gtype

; Jamie Tayar 8/29/2012
; Reads in the output of the stellar evolution code
;  file(s) *.track and plots logTeff and logL 
; (although it should be trivial to change it to plot 
; whatever pair of parameters you want
; gtype options are do you want rotational graphs 
; or mass luminosity plots.

; INPUT PARAMS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if n_params() eq 0 then begin
    print, 'GraphTrackModel, type (try mass or z)'
    return
endif

if gtype eq'Rot' then begin
    xmin=-6
    xmax=2
    ymin=-2.5
    ymax=2.5
endif

if gtype eq 'TrackConv' then begin
    xmin=6300
    xmax=3500
    ymin=-.5
    ymax=1.5
endif

if gtype eq 'Track' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=3.0
endif
if gtype eq 'TauCZ' then begin
    xmin=3.8
    xmax=3.6
    ymin=5.5
    ymax=7.0
endif
if gtype eq 'Rossby' then begin
    xmin=5.0
    xmax=3.0
    ymin=0.0
    ymax=5.0
endif
if gtype eq 'Tracknopms' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=1.5
endif
if gtype eq 'Tracknopmspub' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=1.5
endif
if gtype eq'TracknopmsTess' then begin
    xmin=6000;4.1 ;
    xmax=4000;3.6;
    ymin=1;.75
    ymax=10 ;2.8;3.0;
endif

if gtype eq 'TeffLoggDiff2' then begin
     xmin=200
     xmax=-200
     ymin=4.0
     ymax=0.0
endif

if gtype eq 'Calibrate' then begin
    xmin=-1
    xmax=1
    ymin=-.1
    ymax=.1
endif
if gtype eq 'CNLogg' then begin
    xmin=3.5
    xmax=1.0
    ymin=-1.0
    ymax=0.5
endif
;if gtype eq 'Calibrate' then begin
;    xmin=-4
;    xmax=2
;    ymin=-.3
;    ymax=.1
;endif

;    if gtype eq 'Calibrate' then begin
;       xmin=-10
;       xmax=10
;       ymin=0
;       ymax=4
;     endif

if gtype eq 'CoreR' then begin
     xmin=3
     xmax=18
     ymin=10
     ymax=400
endif
if gtype eq 'CoreRPub' then begin
     xmin=3
     xmax=18
     ymin=10
     ymax=400
endif

if gtype eq 'He3Logg' then begin
    xmin=3.7
    xmax=1.0
    ymin=0;0.000373;0;-0.001
    ymax=0.002;0.000374;0.003
endif
if gtype eq 'H2Age' then begin
    xmin=0
    xmax=0.1
    ymin=1e-6;0.000373;0;-0.001
    ymax=1e-2;0.000374;0.003
endif

if gtype eq 'RotLogg' then begin
     xmin=0
     xmax=5
     ymin=1
     ymax=10000
endif

if gtype eq 'TeffLogg' then begin
     xmin=3500
     xmax=5500
     ymin=0
     ymax=3.5
endif

if gtype eq 'LumLogg' then begin
     xmin=15
     xmax=3
     ymin=3.0
     ymax=4.0
endif
if gtype eq 'BCZLogg' then begin
     xmin=0.
     xmax=5.
     ymin=0.
     ymax=0.85
endif

if gtype eq 'Li' then begin
    xmin=-6
    xmax=2
    ymin=-5
    ymax=5
endif

if gtype eq 'RotLayersP' then begin
     xmin=0.001
     xmax=1.0
     ymin=8e3
     ymax=1e1
endif

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-10
     ymax=1e-5
endif

if gtype eq 'HLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=0.001
     ymax=1.0
endif

if gtype eq 'OttoCali' then begin
    xmin=-.1
    xmax=.1
    ymin=-.5
    ymax=.5
    OttoAge= 4.568; 12.2 Solar values I think 
    OttoR= 1 ;2.62
    OttoTeff=5780 ; 5363
    OttoLogg= 4.44 ;3.52
    OttoRbce= .77 ;.36  Solar value from Monteiro et al 1994
    OmCDeH=2.86e-6
    OmSDeH=2.86e-6
    OttoRho=1.409
endif

if gtype eq 'TrackAS' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=1.5
    OttoRho=1.409
    OttoLogg= 4.44 ;3.52
endif

if gtype eq'Rot2z' then begin
    xmin=0.0
    xmax=5.0
    ymin=-2.5
    ymax=2.5
endif

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.0
    ymin=0
    ymax=25
endif
if gtype eq'RotKmsClump' then begin
    xmin=3.2
    xmax=2.0
    ymin=0.1
    ymax=30
endif
if gtype eq'RotKmsM' then begin
    xmin=2.0
    xmax=3.0
    ymin=0.1
    ymax=30
endif
if gtype eq'JdotM' then begin
    xmin=2.0
    xmax=3.0
    ymin=1E10
    ymax=1E30
endif
if gtype eq'RotRatio' then begin
    xmin=3.5
    xmax=0.0
    ymin=0.01
    ymax=10000
endif
if gtype eq'RotKmspub2' then begin
    xmin=3.5
    xmax=0.0
    ymin=0
    ymax=25
endif


if gtype eq 'Temp' then begin
    xmin=-6.
    xmax=2.
    ymin=0
    ymax=8.0
endif

if gtype eq'RhoOm' then begin
    xmin=0
    xmax=5
    ymin=-1
    ymax=5
endif

if gtype eq'ROm' then begin
    xmin=0
    xmax=0.7
    ymin=0.0
    ymax=2.5
endif
if gtype eq 'Deg' then begin
    xmin=.1
    xmax=3
    ymin=.01
    ymax=100
endif
if gtype eq 'Deg2' then begin
    xmin=.1
    xmax=3
    ymin=.01
    ymax=100
endif
if gtype eq 'CoreM' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.2
    ymax=0.5
endif
if gtype eq 'Reimers' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.001
    ymax=1.0
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'Surfacelogg' then begin
    xmin=5.0
    xmax=2.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceloggCE' then begin
    xmin=5.0
    xmax=2.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceRKms' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e0
    ymax=1e3
endif
if gtype eq 'SurfaceTeffKms' then begin
    xmin=5700
    xmax=4700
    ymin=1e0
    ymax=1e3

endif

    hlines=14 ; number of header lines
    outdirectory= '~/EVOLUTION/output/Graphs/'
if type eq 'mass' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/TestingParams/testingjunk/'
    infiles=['test2','m1_52', 'm1_20', 'm0_80']
    outfile= 'MvaryZ182'
    outtext='X = 0.7109   Z = 0.01821'
    textperrun=['1.0 Msun', '1.5 Msun', '1.2 Msun', '0.8 Msun']
if type eq 'Track' then begin
    xmin=3.9
    xmax=3.5
    ymin=-1.
    ymax=1.5
endif



endif

if type eq 'z' then begin
;Testing various Zs
    datadirectory= '~/EVOLUTION/output/TestingParams/Ztest/'
    infiles=['M1Z20','M1Z15', 'M1Z10', 'M1Z25', 'M1Z30']
    outfile= 'M1Zvary'
    outtext='X = 0.7109   M= Msun'
    textperrun=['Z=.20', 'Z=.15', 'Z=.10', 'Z=.25', 'Z=.30']
endif

if type eq 'alpha' then begin  
;Testing various alphas (mixing length)
    datadirectory= '~/EVOLUTION/output/TestingParams/alphatest/'
    infiles=['M1Z20A20','M1Z20A15', 'M1Z20A10', 'M1Z20A25', 'M1Z20A30']
    outfile= 'M1Z20Avary'
    outtext='X = 0.7109   M= Msun Z=.02'
    textperrun=['A=2.0', 'A=1.5', 'A=1.0', 'A=2.5', 'A=3.0']
endif

if type eq 'Nmodels' then begin
;Testing various N Models
    datadirectory= '~/EVOLUTION/output/TestingParams/NModelstest/'
    infiles=['SOLMD100','SOLMD500', 'SOLMD800', 'SOLMD11C', 'SOLMD15C']
    outfile= 'SOLNMDvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['N=100', 'N=500', 'N=800', 'N=1100', 'N=1500']
endif

if type eq 'NIter1' then begin
;Testing various Iteration Numbers (NIter1)
    datadirectory= '~/EVOLUTION/output/TestingParams/NIter1test/'
    infiles=['SOLNI101','SOLNI102', 'SOLNI106', 'SOLNI120', 'SOLNI11C']
    outfile= 'SOLNIter1vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['N=1', 'N=2', 'N=6', 'N=20', 'N=100']

  ;  xmin=3.77
  ;  xmax=3.73
  ;  ymin=-.2
  ;  ymax=.01

endif

if type eq 'NIter2' then begin
;Testing various Iteration Numbers (NIter2)
    datadirectory= '~/EVOLUTION/output/TestingParams/NIter2test/'
    infiles=['SOLNI210','SOLNI220', 'SOLNI240', 'SOLNI275', 'SOLNI21C']
    outfile= 'SOLNIter2vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['N=10', 'N=20', 'N=40', 'N=75', 'N=100']


 ;   xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01

endif

if type eq 'NIter3' then begin
;Testing various Iteration Numbers (NIter3)
    datadirectory= '~/EVOLUTION/output/TestingParams/NIter3test/'
    infiles=['SOLNI310','SOLNI320', 'SOLNI340', 'SOLNI375', 'SOLNI31C']
    outfile= 'SOLNIter3vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['N=10', 'N=20', 'N=40', 'N=75', 'N=100']
  ;  xmin=3.77
  ;  xmax=3.73
  ;  ymin=-.2
  ;  ymax=.01

endif

if type eq 'NIter4' then begin
;Testing various Iteration Numbers (NIter4)
    datadirectory= '~/EVOLUTION/output/TestingParams/NIter4test/'
    infiles=['SOLNI410','SOLNI420', 'SOLNI440', 'SOLNI475', 'SOLNI41C']
    outfile= 'SOLNIter4vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['N=10', 'N=20', 'N=40', 'N=75', 'N=100']

  ;   xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01

endif

if type eq 'NIterAll' then begin
;Testing various Iteration Numbers (NIterAll)
    datadirectory= '~/EVOLUTION/output/TestingParams/NIterAlltest/'
    infiles=['SOLNIA10','SOLNIA20', 'SOLNIA40', 'SOLNIA75', 'SOLNIA1C']
    outfile= 'SOLNIterAllvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['N=10', 'N=20', 'N=40', 'N=75', 'N=100']

 ;   xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01
endif

if type eq 'HPTTol2' then begin
;Testing various Spacial grid sizes (HPTTol(2))
    datadirectory= '~/EVOLUTION/output/TestingParams/HPTTol2test/'
    infiles=['SLTT02_0','SLTT02_1', 'SLTT02_2', 'SLTT02_3']
    outfile= 'SOLHPTTol2vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tol=.5', 'Tol=.05', 'Tol=.005', 'Tol=.0005']
 
  ;   xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01
endif
  
if type eq 'HPTTol3' then begin
;Testing various Spacial grid sizes (HPTTol(3))
    datadirectory= '~/EVOLUTION/output/TestingParams/HPTTol3test/'
    infiles=['SLTT03_0','SLTT03_1', 'SLTT03_2', 'SLTT03_3']
    outfile= 'SOLHPTTol3vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tol=.5', 'Tol=.05', 'Tol=.005', 'Tol=.0005']
 ;   xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01
endif

if type eq 'HPTTol8' then begin
;Testing various Spacial grid sizes (HPTTol(8))
    datadirectory= '~/EVOLUTION/output/TestingParams/HPTTol8test/'
    infiles=['SLTT08_1', 'SLTT08_2', 'SLTT08_3']
    outfile= 'SOLHPTTol8vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=[ 'Tol=.05', 'Tol=.005', 'Tol=.0005']

 ;   xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01
endif

if type eq 'HPTTol9' then begin
;Testing various Spacial grid sizes (HPTTol(9))
    datadirectory= '~/EVOLUTION/output/TestingParams/HPTTol9test/'
    infiles=['SLTT09_0','SLTT09_1', 'SLTT09_2', 'SLTT09_3']
    outfile= 'SOLHPTTol9vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tol=.5', 'Tol=.05', 'Tol=.005', 'Tol=.0005']
 
  ;   xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01
endif

if type eq 'HPTTol10' then begin
;Testing various Spacial grid sizes (HPTTol(10))
    datadirectory= '~/EVOLUTION/output/TestingParams/HPTTol10test/'
    infiles=['SLTT10_0','SLTT10_1', 'SLTT10_2', 'SLTT10_3']
    outfile= 'SOLHPTTol10vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tol=.5', 'Tol=.05', 'Tol=.005', 'Tol=.0005']

  ;   xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01
endif

if type eq 'HPTTol11' then begin
;Testing various Spacial grid sizes (HPTTol(11))
    datadirectory= '~/EVOLUTION/output/TestingParams/HPTTol11test/'
    infiles=['SLTT11_0','SLTT11_1', 'SLTT11_2', 'SLTT11_3']
    outfile= 'SOLHPTTol11vary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tol=.5', 'Tol=.05', 'Tol=.005', 'Tol=.0005']
 ;    xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01
endif

if type eq 'HPTTolAll' then begin
;Testing various Spacial grid sizes (HPTTol(All))
    datadirectory= '~/EVOLUTION/output/TestingParams/HPTTolAlltest/'
    infiles=['SLTTAL_0','SLTTAL_1', 'SLTTAL_2', 'SLTTAL_3']
    outfile= 'SOLHPTTolAllvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tol=.5', 'Tol=.05', 'Tol=.005', 'Tol=.0005']
 
 ;   xmin=3.77
 ;   xmax=3.73
 ;   ymin=-.2
 ;   ymax=.01
endif

if type eq 'rotation' then begin
;Testing various Rotational properties on/off
    datadirectory= '~/EVOLUTION/output/RotationTest/Rotationtest/'
    infiles=['SOLROT_F','SOLROT_T', 'SOLINS_F', 'SOLSLD_F', 'SOLJDT_F']
    outfile= 'SOLRotationaloptions'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Default', 'LROT_T', 'LINSTB_F', 'LSOLID_F', 'LJOT0_F']
 
;    xmin=3.77
;    xmax=3.73
;    ymin=-.2
;    ymax=.01
endif

if type eq 'RedGiant' then begin
;Evolve to the red giant phase
    datadirectory= '~/EVOLUTION/output/RotationTest/RedGianttest/'
    infiles=['SOL_RDGT', 'SOLRDG12', 'SLRDG12b']
    outfile= 'SolRedGiant'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Age= 4.5e10', 'Age= 4.5e12', 'Age= 4.5e12']
 
 ;   xmin=4.
 ;   xmax=3.5
 ;   ymin=-.5
 ;   ymax=2.0
endif

if type eq 'RGRot' then begin
;Evolve to the red giant phase
    datadirectory= '~/EVOLUTION/output/RotationTest/RGRottest/'
    infiles=['SOLRGrtFinFsbFjdF', 'SOLRGrtTinTsbFjdF', 'SOLRGrtTinTsbFjdF', 'SOLRGrtTinTsbTjdF', $
            'SOLRGrtTinTsbTjdT' , 'SOLRGrtTinTsbFjdT', 'SOLRGrtTinFsbTjdF', 'SOLRGrtTinFsbTjdT', $
            'SOLRGrtTinFsbFjdT']
    outfile= 'SolRGRotation'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['NoRT', 'RT', 'IN', 'IN,SB', 'IN,SB,JD', 'IN,JD', 'SB', 'SB, JD', 'JD']

 ;   xmin=-6
 ;   xmax=4
 ;   ymin=-5
 ;   ymax=5 

 ;   xmin=-2.5
 ;   xmax=.5
 ;   ymin=1.8
 ;   ymax=3
endif

if type eq 'Rotw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotWtest/'
    infiles=['SOLRGrtT8inFsbFjdF', 'SOLRGrtT7inFsbFjdF','SOLRGrtT6inFsbFjdF', 'SOLRGrtT5inFsbFjdF', $
              'SOLrtT26inFsbFjdF', 'SOLrtT46inFsbFjdF', 'SOLrtT66inFsbFjdF', 'SOLrtT86inFsbFjdF']
    outfile= 'SolRotWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']

;    xmin=3.8
;    xmax=3.53
;    ymin=-1
;    ymax=1.5 

endif

if type eq 'RotInw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotINWtest/'
    infiles=['SOLRGrtT8inFsbFjdF', 'SOLRGrtT7inTsbFjdF','SOLRGrtT6inTsbFjdF', 'SOLRGrtT5inTsbFjdF', $
              'SOLrtT26inTsbFjdF', 'SOLrtT46inTsbFjdF', 'SOLrtT66inTsbFjdF', 'SOLrtT86inTsbFjdF']
    outfile= 'SolRotInWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']



;    xmin=3.8
;    xmax=3.53
;    ymin=-1
;    ymax=1.5 

endif

if type eq 'RotLdiskInw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotLdiskInWtest/'
    infiles=['SOLrtT8inTsbFjdFldT', 'SOLrtT7inTsbFjdFldT','SOLrtT6inTsbFjdFldT', 'SOLrtT5inTsbFjdFldT', $
              'SOLrtT26inTsbFjdFldT', 'SOLrtT46inTsbFjdFldT', 'SOLrtT66inTsbFjdFldT', 'SOLrtT86inTsbFjdFldT']
    outfile= 'SolRotLdiskInWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']

 ;   xmin=4.0
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif

if type eq 'RotInSbw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotInSbWtest/'
    infiles=['SOLrtT8inTsbTjdF', 'SOLrtT7inTsbTjdF','SOLrtT6inTsbTjdF', 'SOLrtT5inTsbTjdF', $
              'SOLrtT26inTsbTjdF', 'SOLrtT46inTsbTjdF', 'SOLrtT66inTsbTjdF', 'SOLrtT86inTsbTjdF']
    outfile= 'SolRotInSbWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif

if type eq 'RotInJdw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotInJdWtest/'
    infiles=['SOLrtT8inTsbFjdT', 'SOLrtT7inTsbFjdT','SOLrtT6inTsbFjdT', 'SOLrtT5inTsbFjdT', $
              'SOLrtT26inTsbFjdT', 'SOLrtT46inTsbFjdT', 'SOLrtT66inTsbFjdT', 'SOLrtT86inTsbFjdT']
    outfile= 'SolRotInJdWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']

;    xmin=3.8
;    xmax=3.53
;    ymin=-1
;    ymax=1.5 

endif

if type eq 'RotInSbw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotInSbWtest/'
    infiles=['SOLrtT8inTsbTjdF', 'SOLrtT7inTsbTjdF','SOLrtT6inTsbTjdF', 'SOLrtT5inTsbTjdF', $
              'SOLrtT26inTsbTjdF', 'SOLrtT46inTsbTjdF', 'SOLrtT66inTsbTjdF', 'SOLrtT86inTsbTjdF']
    outfile= 'SolRotInSbWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']

  ;  xmin=3.8
  ;  xmax=3.53
  ;  ymin=-1
  ;  ymax=1.5 

endif

if type eq 'RotInSbJdw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotInSbJdWtest/'
    infiles=['SOLrtT8inTsbTjdT', 'SOLrtT7inTsbTjdT','SOLrtT6inTsbTjdT', 'SOLrtT5inTsbTjdT', $
              'SOLrtT26inTsbTjdT', 'SOLrtT46inTsbTjdT', 'SOLrtT66inTsbTjdT', 'SOLrtT86inTsbTjdT']
    outfile= 'SolRotInSbJdWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif

if type eq 'RotSbJdw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotSbJdWtest/'
    infiles=['SOLrtT8inFsbTjdT', 'SOLrtT7inFsbTjdT','SOLrtT6inFsbTjdT', 'SOLrtT5inFsbTjdT', $
              'SOLrtT26inFsbTjdT', 'SOLrtT46inFsbTjdT', 'SOLrtT66inFsbTjdT', 'SOLrtT86inFsbTjdT']
    outfile= 'SolRotSbJdWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']

  ;  xmin=3.8
  ;  xmax=3.53
  ;  ymin=-1
  ;  ymax=1.5 

endif

if type eq 'RotSbw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotSbWtest/'
    infiles=['SOLrtT8inFsbTjdF', 'SOLrtT7inFsbTjdF','SOLrtT6inFsbTjdF', 'SOLrtT5inFsbTjdF', $
              'SOLrtT26inFsbTjdF', 'SOLrtT46inFsbTjdF', 'SOLrtT66inFsbTjdF', 'SOLrtT86inFsbTjdF']
    outfile= 'SolRotSbWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']

  ;  xmin=3.8
  ;  xmax=3.53
  ;  ymin=-1
  ;  ymax=1.5 

endif

if type eq 'RotJdw' then begin
;Test how WNEW affects the model
    datadirectory= '~/EVOLUTION/output/RotationTest/RotJdWtest/'
    infiles=['SOLrtT8inFsbFjdT', 'SOLrtT7inFsbFjdT','SOLrtT6inFsbFjdT', 'SOLrtT5inFsbFjdT', $
              'SOLrtT26inFsbFjdT', 'SOLrtT46inFsbFjdT', 'SOLrtT66inFsbFjdT', 'SOLrtT86inFsbFjdT']
    outfile= 'SolRotJdWvary'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['RTe-8', 'RTe-7','RTe-6','RTe-5', 'RT2e-6', 'RT4e-6', 'RT6e-6', 'RT8e-6']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrDL' then begin
;Test how Disk locking time affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/Calibrate/'
    infiles=['SOLRTdl1fk2_6fc6', 'SOLRTdl2fk2_6fc6','SOLRTdl3fk2_6fc6', 'SOLRTdl4fk2_6fc6', $
              'SOLRTdl5fk2_6fc6','SOLRTdl23fk2_6fc6','SOLRTdl43fk2_6fc6', 'SOLRTdl63fk2_6fc6', $
              'SOLRTdl83fk2_6fc6']
    outfile= 'SOLRTCalibDL'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tde-1', 'Tde-2','Tde-3','Tde-4', 'Tde-5', 'Td2e-3','Td4e-3', 'Td6e-3','Td8e-3' ]

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrFk' then begin
;Test how Fk affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/Calibrate/'
    infiles=['SOLRTdl2fk_1fc6', 'SOLRTdl2fk2fc6','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk3fc6', $
              'SOLRTdl2fk5fc6']
    outfile= 'SOLRTCalibFk'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Fk=.1', 'Fk=2','Fk=2.65','Fk=3', 'Fk=5']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrFc' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/Calibrate/'
    infiles=['SOLRTdl2fk5fc0', 'SOLRTdl2fk5fc5','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk5fc7', $
              'SOLRTdl2fk5fc1' ]
    outfile= 'SOLRTCalibFc'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Fc=0', 'Fc=.5','Fc=.625','Fc=.75', 'Fc=1']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'Calibrate' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/Calibrate/'
    infiles=['SOLRTdl1fk2_6fc6', 'SOLRTdl2fk2_6fc6','SOLRTdl3fk2_6fc6', 'SOLRTdl4fk2_6fc6', $
              'SOLRTdl5fk2_6fc6','SOLRTdl2fk_1fc6', 'SOLRTdl2fk2fc6','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk3fc6', $
              'SOLRTdl2fk5fc6', 'SOLRTdl2fk5fc0', 'SOLRTdl2fk5fc5','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk5fc7', $
              'SOLRTdl2fk5fc1', 'SOLRTdl23fk2_6fc6','SOLRTdl43fk2_6fc6', 'SOLRTdl63fk2_6fc6', $
              'SOLRTdl83fk2_6fc6']
    outfile= 'SOLRTCalibrate'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tde-1', 'Tde-2','Tde-3','Tde-4', 'Tde-5', $
            'Fk=.1', 'Fk=2','Fk=2.65','Fk=3', 'Fk=5', 'Fc=0', $
            'Fc=.5','Fc=.625','Fc=.75', 'Fc=1', 'Td2e-3','Td4e-3', 'Td6e-3','Td8e-3' ]

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif

if type eq 'CalibrDLr' then begin
;Test how Disk locking time affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibrateReal/'
    infiles=['SOLRTdl1fk2_6fc6', 'SOLRTdl2fk2_6fc6','SOLRTdl3fk2_6fc6', 'SOLRTdl4fk2_6fc6', $
              'SOLRTdl5fk2_6fc6','SOLRTdl23fk2_6fc6','SOLRTdl43fk2_6fc6', 'SOLRTdl63fk2_6fc6', $
              'SOLRTdl83fk2_6fc6']
    outfile= 'SOLRTCalibDLR'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tde-1', 'Tde-2','Tde-3','Tde-4', 'Tde-5', 'Td2e-3','Td4e-3', 'Td6e-3','Td8e-3' ]

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrFkr' then begin
;Test how Fk affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibrateReal/'
    infiles=['SOLRTdl2fk_1fc6', 'SOLRTdl2fk2fc6','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk3fc6', $
              'SOLRTdl2fk5fc6']
    outfile= 'SOLRTCalibFkR'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Fk=.1', 'Fk=2','Fk=2.65','Fk=3', 'Fk=5']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrFcr' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibrateReal/'
    infiles=['SOLRTdl2fk5fc0', 'SOLRTdl2fk5fc5','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk5fc7', $
              'SOLRTdl2fk5fc1', 'SOLRTdl2fk2_6fc70']
    outfile= 'SOLRTCalibFcr'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Fc=0', 'Fc=.5','Fc=.625','Fc=.75', 'Fc=1', 'Fc=.70']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'Calibrater' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibrateReal/'
    infiles=['SOLRTdl1fk2_6fc6', 'SOLRTdl2fk2_6fc6','SOLRTdl3fk2_6fc6', 'SOLRTdl4fk2_6fc6', $
              'SOLRTdl5fk2_6fc6','SOLRTdl2fk_1fc6', 'SOLRTdl2fk2fc6','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk3fc6', $
              'SOLRTdl2fk5fc6', 'SOLRTdl2fk5fc0', 'SOLRTdl2fk5fc5','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk5fc7', $
              'SOLRTdl2fk5fc1', 'SOLRTdl23fk2_6fc6','SOLRTdl43fk2_6fc6', 'SOLRTdl63fk2_6fc6', $
              'SOLRTdl83fk2_6fc6']
    outfile= 'SOLRTCalibrateReal'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tde-1', 'Tde-2','Tde-3','Tde-4', 'Tde-5', $
            'Fk=.1', 'Fk=2','Fk=2.65','Fk=3', 'Fk=5', 'Fc=0', $
            'Fc=.5','Fc=.625','Fc=.75', 'Fc=1', 'Td2e-3','Td4e-3', 'Td6e-3','Td8e-3' ]

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrDLInJdDl' then begin
;Test how Disk locking time affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibInJdDl/'
    infiles=['SOLRTdl1fk2_6fc6', 'SOLRTdl2fk2_6fc6','SOLRTdl3fk2_6fc6', 'SOLRTdl4fk2_6fc6', $
              'SOLRTdl5fk2_6fc6','SOLRTdl23fk2_6fc6','SOLRTdl43fk2_6fc6', 'SOLRTdl63fk2_6fc6', $
              'SOLRTdl83fk2_6fc6']
    outfile= 'SOLRTCalibDLInJdDl'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tde-1', 'Tde-2','Tde-3','Tde-4', 'Tde-5', 'Td2e-3','Td4e-3', 'Td6e-3','Td8e-3' ]

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrFkInJdDl' then begin
;Test how Fk affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibInJdDl/'
    infiles=['SOLRTdl2fk_1fc6', 'SOLRTdl2fk2fc6','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk3fc6', $
              'SOLRTdl2fk5fc6']
    outfile= 'SOLRTCalibFkInJdDl'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Fk=.1', 'Fk=2','Fk=2.65','Fk=3', 'Fk=5']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrFcInJdDl' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibInJdDl/'
    infiles=['SOLRTdl2fk5fc0', 'SOLRTdl2fk5fc5','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk5fc7', $
              'SOLRTdl2fk5fc1', 'SOLRTdl2fk2_6fc70']
    outfile= 'SOLRTCalibFcInJdDl'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Fc=0', 'Fc=.5','Fc=.625','Fc=.75', 'Fc=1', 'Fc=.70']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrateInJdDl' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibInJdDl/'
    infiles=['SOLRTdl1fk2_6fc6', 'SOLRTdl2fk2_6fc6','SOLRTdl3fk2_6fc6', 'SOLRTdl4fk2_6fc6', $
              'SOLRTdl5fk2_6fc6','SOLRTdl2fk_1fc6', 'SOLRTdl2fk2fc6','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk3fc6', $
              'SOLRTdl2fk5fc6', 'SOLRTdl2fk5fc0', 'SOLRTdl2fk5fc5','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk5fc7', $
              'SOLRTdl2fk5fc1', 'SOLRTdl23fk2_6fc6','SOLRTdl43fk2_6fc6', 'SOLRTdl63fk2_6fc6', $
              'SOLRTdl83fk2_6fc6']
    outfile= 'SOLRTCalibrateInJdDl'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tde-1', 'Tde-2','Tde-3','Tde-4', 'Tde-5', $
            'Fk=.1', 'Fk=2','Fk=2.65','Fk=3', 'Fk=5', 'Fc=0', $
            'Fc=.5','Fc=.625','Fc=.75', 'Fc=1', 'Td2e-3','Td4e-3', 'Td6e-3','Td8e-3' ]

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif

if type eq 'CalibrDLJd' then begin
;Test how Disk locking time affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibJd/'
    infiles=['SOLRTdl1fk2_6fc6', 'SOLRTdl2fk2_6fc6','SOLRTdl3fk2_6fc6', 'SOLRTdl4fk2_6fc6', $
              'SOLRTdl5fk2_6fc6','SOLRTdl23fk2_6fc6','SOLRTdl43fk2_6fc6', 'SOLRTdl63fk2_6fc6', $
              'SOLRTdl83fk2_6fc6']
    outfile= 'SOLRTCalibDLJd'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tde-1', 'Tde-2','Tde-3','Tde-4', 'Tde-5', 'Td2e-3','Td4e-3', 'Td6e-3','Td8e-3' ]

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrFkJd' then begin
;Test how Fk affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibJd/'
    infiles=['SOLRTdl2fk_1fc6', 'SOLRTdl2fk2fc6','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk3fc6', $
              'SOLRTdl2fk5fc6']
    outfile= 'SOLRTCalibFkJd'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Fk=.1', 'Fk=2','Fk=2.65','Fk=3', 'Fk=5']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrFcJd' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibInJd/'
    infiles=['SOLRTdl2fk5fc0', 'SOLRTdl2fk5fc5','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk5fc7', $
              'SOLRTdl2fk5fc1', 'SOLRTdl2fk2_6fc70']
    outfile= 'SOLRTCalibFcJd'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Fc=0', 'Fc=.5','Fc=.625','Fc=.75', 'Fc=1', 'Fc=.70']

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'CalibrateJd' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/CalibJd/'
    infiles=['SOLRTdl1fk2_6fc6', 'SOLRTdl2fk2_6fc6',$    
              'SOLRTdl3fk2_6fc6','SOLRTdl4fk2_6fc6', $
              'SOLRTdl5fk2_6fc6','SOLRTdl2fk_1fc6', $   
               'SOLRTdl2fk2fc6','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk3fc6', $
              'SOLRTdl2fk5fc6', 'SOLRTdl2fk5fc0', $  
               'SOLRTdl2fk5fc5','SOLRTdl2fk2_6fc6', 'SOLRTdl2fk5fc7', $
              'SOLRTdl2fk5fc1', 'SOLRTdl23fk2_6fc6',$
             'SOLRTdl43fk2_6fc6', 'SOLRTdl63fk2_6fc6', $
              'SOLRTdl83fk2_6fc6']
    outfile= 'SOLRTCalibrateJd'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Tde-1', 'Tde-2','Tde-3','Tde-4', 'Tde-5', $
            'Fk=.1', 'Fk=2','Fk=2.65','Fk=3', 'Fk=5', 'Fc=0', $
            'Fc=.5','Fc=.625','Fc=.75', 'Fc=1', 'Td2e-3','Td4e-3', 'Td6e-3','Td8e-3' ]

 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif


if type eq 'Mcalibr' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/WrongCali/Mcalibr/'
    infiles=[ 'SOLCalM06','SOLCalM07', 'SOLCalM08', $
              'SOLCalM09','SOLCalM10', 'SOLCalM11','SOLCalM12', 'SOLCalM13', $
              'SOLCalM14', 'SOLCalM15', 'SOLCalM16','SOLCalM17', 'SOLCalM18', $
              'SOLCalM19', 'SOLCalM20']
    outfile= 'SOLRTCalibM'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['M06','M07', 'M08', $
              'M09','M10', 'M11','M12', 'M13', $
              'M14', 'M15', 'M16','M17', 'M18', $
              'M19', 'M20' ]
 ;   xmin=3.8
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif

if type eq 'M15fix' then begin
;Test how Fc affects the model
    datadirectory= '~/EVOLUTION/output/M15fix/'
    infiles=['SOLCalM15', 'M15SEN-7','M15FFIRST', 'M15LNEW', $
              'M15LNTT', 'M15LNTL', 'M15LNTTTL', $
              'MF15SEN-7', 'MF15LNEW', $
              'MF15LNTT', 'MF15LNTL', 'MF15LNTTTL', $
              'MF15MP']
    outfile= 'M15fix'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['Cal', 'SEN','FFIRST','LNEW', 'LNTT', 'LNTL', 'LNTTTL',$
                'SEN','LNEW', 'LNTT', 'LNTL', 'LNTTTL', 'MP']
if gtype eq 'Track' then  xmin=3.9
 ;   xmax=3.53
 ;   ymin=-1
 ;   ymax=1.5 

endif

if type eq 'RGRotbyMass' then begin
;RG for .8-2.5 Msun for various rot flag combos
    datadirectory= '~/EVOLUTION/output/RGRotbyMass/'
    infiles=[$;'0_8MRGinFsbFjdF', '0_8MRGinTsbFjdF', '0_8MRGinFsbTjdF', '0_8MRGinFsbFjdT', $
             ;'0_8MRGinTsbTjdF', '0_8MRGinTsbFjdT', '0_8MRGinFsbTjdT', '0_8MRGinTsbTjdT', $
             '1_0MRGinFsbFjdF', '1_0MRGinTsbFjdF', '1_0MRGinFsbTjdF', '1_0MRGinFsbFjdT', $
             '1_0MRGinTsbTjdF', '1_0MRGinTsbFjdT', '1_0MRGinFsbTjdT', '1_0MRGinTsbTjdT', $ 
             '1_1MRGinFsbFjdF', '1_1MRGinTsbFjdF', '1_1MRGinFsbTjdF', '1_1MRGinFsbFjdT', $
             '1_1MRGinTsbTjdF', '1_1MRGinTsbFjdT', '1_1MRGinFsbTjdT', '1_1MRGinTsbTjdT', $
             '1_3MRGinFsbFjdF', '1_3MRGinTsbFjdF', '1_3MRGinFsbTjdF', '1_3MRGinFsbFjdT', $
             '1_3MRGinTsbTjdF', '1_3MRGinTsbFjdT', '1_3MRGinFsbTjdT', '1_3MRGinTsbTjdT', $
             '1_5MRGinFsbFjdF', '1_5MRGinTsbFjdF', '1_5MRGinFsbTjdF', '1_5MRGinFsbFjdT', $
             '1_5MRGinTsbTjdF', '1_5MRGinTsbFjdT', '1_5MRGinFsbTjdT', '1_5MRGinTsbTjdT', $
             '1_7MRGinFsbFjdF', '1_7MRGinTsbFjdF', '1_7MRGinFsbTjdF', '1_7MRGinFsbFjdT', $
             '1_7MRGinTsbTjdF', '1_7MRGinTsbFjdT', '1_7MRGinFsbTjdT', '1_7MRGinTsbTjdT', $
             '1_9MRGinFsbFjdF', '1_9MRGinTsbFjdF', '1_9MRGinFsbTjdF', '1_9MRGinFsbFjdT', $
             '1_9MRGinTsbTjdF', '1_9MRGinTsbFjdT', '1_9MRGinFsbTjdT', '1_9MRGinTsbTjdT', $
             '2_0MRGinFsbFjdF', '2_0MRGinTsbFjdF', '2_0MRGinFsbTjdF', '2_0MRGinFsbFjdT', $
             '2_0MRGinTsbTjdF', '2_0MRGinTsbFjdT', '2_0MRGinFsbTjdT', '2_0MRGinTsbTjdT', $
             '2_1MRGinFsbFjdF', '2_1MRGinTsbFjdF', '2_1MRGinFsbTjdF', '2_1MRGinFsbFjdT', $
             '2_1MRGinTsbTjdF', '2_1MRGinTsbFjdT', '2_1MRGinFsbTjdT', '2_1MRGinTsbTjdT', $
             '2_3MRGinFsbFjdF', '2_3MRGinTsbFjdF', '2_3MRGinFsbTjdF', '2_3MRGinFsbFjdT', $
             '2_3MRGinTsbTjdF', '2_3MRGinTsbFjdT', '2_3MRGinFsbTjdT', '2_3MRGinTsbTjdT', $
             '2_5MRGinFsbFjdF', '2_5MRGinTsbFjdF', '2_5MRGinFsbTjdF', '2_5MRGinFsbFjdT', $
             '2_5MRGinTsbTjdF', '2_5MRGinTsbFjdT', '2_5MRGinFsbTjdT', '2_5MRGinTsbTjdT']
    outfile= 'RGRotbyMass'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[$;'.8Rot', '.8In', '.8Sb', '.8Jd', '.8InSb', '.8InJd', '.8SbJd', '.8InSbJd', $
                '1.0Rot', '1.0In', '1.0Sb', '1.0Jd', '1.0InSb', '1.0InJd', '1.0SbJd', '1.0InSbJd', $
                '1.1Rot', '1.1In', '1.1Sb', '1.1Jd', '1.1InSb', '1.1InJd', '1.1SbJd', '1.1InSbJd', $
                '1.3Rot', '1.3In', '1.3Sb', '1.3Jd', '1.3InSb', '1.3InJd', '1.3SbJd', '1.3InSbJd', $
                '1.5Rot', '1.5In', '1.5Sb', '1.5Jd', '1.5InSb', '1.5InJd', '1.5SbJd', '1.5InSbJd', $
                '1.7Rot', '1.7In', '1.7Sb', '1.7Jd', '1.7InSb', '1.7InJd', '1.7SbJd', '1.7InSbJd', $
                '1.9Rot', '1.9In', '1.9Sb', '1.9Jd', '1.9InSb', '1.9InJd', '1.9SbJd', '1.9InSbJd', $
                '2.0Rot', '2.0In', '2.0Sb', '2.0Jd', '2.0InSb', '2.0InJd', '2.0SbJd', '2.0InSbJd', $
                '2.1Rot', '2.1In', '2.1Sb', '2.1Jd', '2.1InSb', '2.1InJd', '2.1SbJd', '2.1InSbJd', $
                '2.3Rot', '2.3In', '2.3Sb', '2.3Jd', '2.3InSb', '2.3InJd', '2.3SbJd', '2.3InSbJd', $
                '2.5Rot', '2.5In', '2.5Sb', '2.5Jd', '2.5InSb', '2.5InJd', '2.5SbJd', '2.5InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
 ;   xmax=3.53
 ;   ymin=-1
    ymax=2.5 
endif
endif

if type eq 'Rot1.1' then begin
;RG for 1.1 Msun for various rot flag combos
    datadirectory= '~/EVOLUTION/output/RGRotbyMass/'
    infiles=[$ 
             '1_1MRGinFsbFjdF', '1_1MRGinTsbFjdF', '1_1MRGinFsbTjdF', '1_1MRGinFsbFjdT', $
             '1_1MRGinTsbTjdF', '1_1MRGinTsbFjdT', '1_1MRGinFsbTjdT', '1_1MRGinTsbTjdT']
    outfile= 'RGRot1_1M'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[$
                '1.1Rot', '1.1In', '1.1Sb', '1.1Jd', '1.1InSb', '1.1InJd', '1.1SbJd', '1.1InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
endif

if type eq 'Rot1.3' then begin
;RG for 1.3 Msun for various rot flag combos
    datadirectory= '~/EVOLUTION/output/RGRotbyMass/'
    infiles=[$ 
             '1_3MRGinFsbFjdF', '1_3MRGinTsbFjdF', '1_3MRGinFsbTjdF', '1_3MRGinFsbFjdT', $
             '1_3MRGinTsbTjdF', '1_3MRGinTsbFjdT', '1_3MRGinFsbTjdT', '1_3MRGinTsbTjdT']
    outfile= 'RGRot1_3M'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[$
                '1.3Rot', '1.3In', '1.3Sb', '1.3Jd', '1.3InSb', '1.3InJd', '1.3SbJd', '1.3InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
endif

if type eq 'Rot1.5' then begin
;RG for 1.5 Msun for various rot flag combos
    datadirectory= '~/EVOLUTION/output/RGRotbyMass/'
    infiles=[$ 
             '1_5MRGinFsbFjdF', '1_5MRGinTsbFjdF', '1_5MRGinFsbTjdF', '1_5MRGinFsbFjdT', $
             '1_5MRGinTsbTjdF', '1_5MRGinTsbFjdT', '1_5MRGinFsbTjdT', '1_5MRGinTsbTjdT']
    outfile= 'RGRot1_5M'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[$
                '1.5Rot', '1.5In', '1.5Sb', '1.5Jd', '1.5InSb', '1.5InJd', '1.5SbJd', '1.5InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
endif

if type eq 'Rot1.7' then begin
;RG for 1.7 Msun for various rot flag combos
    datadirectory= '~/EVOLUTION/output/RGRotbyMass/'
    infiles=[$ 
             '1_7MRGinFsbFjdF', '1_7MRGinTsbFjdF', '1_7MRGinFsbTjdF', '1_7MRGinFsbFjdT', $
             '1_7MRGinTsbTjdF', '1_7MRGinTsbFjdT', '1_7MRGinFsbTjdT', '1_7MRGinTsbTjdT']
    outfile= 'RGRot1_7M'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[$
                '1.7Rot', '1.7In', '1.7Sb', '1.7Jd', '1.7InSb', '1.7InJd', '1.7SbJd', '1.7InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
endif

if type eq 'Rot1.9' then begin
;RG for 1.9 Msun for various rot flag combos
    datadirectory= '~/EVOLUTION/output/RGRotbyMass/'
    infiles=[$ 
             '1_9MRGinFsbFjdF', '1_9MRGinTsbFjdF', '1_9MRGinFsbTjdF', '1_9MRGinFsbFjdT', $
             '1_9MRGinTsbTjdF', '1_9MRGinTsbFjdT', '1_9MRGinFsbTjdT', '1_9MRGinTsbTjdT']
    outfile= 'RGRot1_9M'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[$
                '1.9Rot', '1.9In', '1.9Sb', '1.9Jd', '1.9InSb', '1.9InJd', '1.9SbJd', '1.9InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
endif

if type eq 'Rot1.0' then begin
;RG for 1.0 Msun for various rot flag combos
    datadirectory= '~/EVOLUTION/output/RGRotbyMass/'
    infiles=[$ 
             '1_0MRGinFsbFjdF', '1_0MRGinTsbFjdF', '1_0MRGinFsbTjdF', '1_0MRGinFsbFjdT', $
             '1_0MRGinTsbTjdF', '1_0MRGinTsbFjdT', '1_0MRGinFsbTjdT', '1_0MRGinTsbTjdT']
    outfile= 'RGRot1_0M'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[$
                '1.0Rot', '1.0In', '1.0Sb', '1.0Jd', '1.0InSb', '1.0InJd', '1.0SbJd', '1.0InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
endif

if type eq 'Rot2.5' then begin
;RG for 2.5 Msun for various rot flag combos
    datadirectory= '~/EVOLUTION/output/RGRotbyMass/'
    infiles=[$ 
;             '2_5MRGinFsbFjdF','2_5MRGinFsbTjdF']
            '2_5MRGinFsbFjdF', '2_5MRGinTsbFjdF', '2_5MRGinFsbTjdF', '2_5MRGinFsbFjdT', $
             '2_5MRGinTsbTjdF', '2_5MRGinTsbFjdT', '2_5MRGinFsbTjdT', '2_5MRGinTsbTjdT']
    outfile= 'RGRot2_5M'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[ $;'50 km/s Uncoupled-MS', '50 km/s Sb-MS']
;$
                '2.5Rot', '2.5In', '2.50Sb', '2.5Jd', '2.5InSb', '2.5InJd', '2.5SbJd', '2.5InSbJd']
if gtype eq 'Track' then begin
     xmin=4.05
    xmax=3.58
    ymin=.8
    ymax=3.3 
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=7.0
     ymin=-5
     ymax=5
endif
if gtype eq 'CoreR' then begin
    ymin=1e-3
    ymax=2e3
;    xmin=3
;    xmax=17
endif
if gtype eq 'RotKms' then begin
     xmin=-.3
     xmax=0.0
     ymin=0
     ymax=20
endif
endif

if type eq 'Rot2.5b' then begin
;RG for 2.5 Msun for various rot flag combos
    datadirectory= '~/EVOLUTION/output/RGRotbyMass/'
    infiles=[$ 
             '2_5MRGinFsbTjdFRGp2inFsbFjdF', '2_5MRGinFsbTjdFRGp2inTsbFjdF', $
             '2_5MRGinFsbTjdFRGp2inFsbTjdF', '2_5MRGinFsbTjdFRGp2inFsbFjdT', $
             '2_5MRGinFsbTjdFRGp2inTsbTjdF', '2_5MRGinFsbTjdFRGp2inTsbFjdT', $
             '2_5MRGinFsbTjdFRGp2inFsbTjdT', '2_5MRGinFsbTjdFRGp2inTsbTjdT'];, $
 ;            '2_5MRGinFsbTjdFEoMS']
    outfile= 'RGRot2_5Mp2'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[$
                '2.5Rot', '2.5In', '2.5Sb', '2.5Jd', '2.5InSb', '2.5InJd', '2.5SbJd', '2.5InSbJd'];, '']
if gtype eq 'Track' then begin
     xmin=4.05
    xmax=3.58
    ymin=.8
    ymax=3.3 
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=7.0
     ymin=-5
     ymax=5
endif
if gtype eq 'CoreR' then begin
    ymin=1e-1
    ymax=1e3
;    xmin=3
;    xmax=17
endif
endif


if type eq 'p2s' then begin
;RG w/ various rot flags starting w/ SbJd solar
    datadirectory= '~/EVOLUTION/output/p2s/'
    infiles=[$ 
             'M10Z18RGp2inFsbFjdF', 'M10Z18RGp2inTsbFjdF', 'M10Z18RGp2inFsbTjdF', $
             'M10Z18RGp2inFsbFjdT', $
             'M10Z18RGp2inTsbTjdF', 'M10Z18RGp2inTsbFjdT', 'M10Z18RGp2inFsbTjdT', $    
             'M10Z18RGp2inTsbTjdT', $
             '2_5MRGinFsbTjdFRGp2inFsbFjdF', '2_5MRGinFsbTjdFRGp2inTsbFjdF', $
             '2_5MRGinFsbTjdFRGp2inFsbTjdF', '2_5MRGinFsbTjdFRGp2inFsbFjdT', $
             '2_5MRGinFsbTjdFRGp2inTsbTjdF', '2_5MRGinFsbTjdFRGp2inTsbFjdT', $
             '2_5MRGinFsbTjdFRGp2inFsbTjdT', '2_5MRGinFsbTjdFRGp2inTsbTjdT'];
    outfile= 'p2s'
    outtext='X = 0.7109 Z=.0182'
    textperrun=[$
                '1.0Rot', '1.0In', '1.0Sb', '1.0Jd', '1.0InSb', '1.0InJd', '1.0SbJd', '1.0InSbJd', $
                '2.5Rot', '2.5In', '2.5Sb', '2.5Jd', '2.5InSb', '2.5InJd', '2.5SbJd', '2.5InSbJd']
if gtype eq 'Track' then begin
     xmin=4.05
    xmax=3.58
    ymin=.8
    ymax=3.3 
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=7.0
     ymin=-5
     ymax=5
endif
if gtype eq 'CoreR' then begin
    ymin=1e-1
    ymax=1e5
     xmin=1
;    xmax=17
endif
endif


if type eq 'M15fix2' then begin
;Try to get the 1.5 Msun model working
    datadirectory= '~/EVOLUTION/output/M15fix/'
    infiles=['1_5MnoRotRGinFsbTjdTMP', '1_5MRGinFsbTjdTMPFc0', '1_5MRGinFsbTjdTMPw8', $
             '1_5MRGinFsbTjdTMP','1_5MRGinFsbTjdFMP','1_5MRGinFsbFjdTMP','1_5MRGinFsbFjdFMP']
;    infiles=['1_5MRGinFsbTjdTMPenvT9', '1_5MRGinFsbTjdTMPenvT8','1_5MRGinFsbTjdTMPenvT5', $
;             '1_5MRGinFsbTjdTMPenv9','1_5MRGinFsbTjdTMPenv8','1_5MRGinFsbTjdTMPenv5', $
;             '1_5MRGinFsbTjdTMPenvT', '1_5MRGinFsbTjdTMP', '1_5MRGinFsbTjdTMPenvT4', $
;             '1_5MRGinFsbTjdTMPenvT3', '1_5MRGinFsbTjdTMPenvT2', '1_5MRGinFsbTjdTMPenvT1']   
    outfile= 'M15fix2'
    outtext='M= 1.5Msun'
    textperrun=['noRot', 'Fc=0', 'we-8', 'SBJD', 'SB', 'JD', 'Rot']
;     textperrun=['T9', 'T8', 'T5', 'F9', 'F8', 'F5', 'T7', 'F7', 'T4', 'T3', 'T2', 'T1']
if gtype eq 'Track' then  begin
     xmin= 3.9 ;3.84 ;
    xmax=3.53 ;3.81
    ymin=0 ;.65 
    ymax=3.0 ; .85 
endif

endif

if type eq 'cali2' then begin
;Recalibrated to MP Li I think
    datadirectory= '~/EVOLUTION/output/Calibrate2/'
;    infiles=['SolarRotBase', 'SOLRotinFsbFjdF', 'SOLRotinFsbFjdT','SOLRotinTsbFjdF', $
;              'SOLRotinTsbFjdT', 'SOLRotinFsbTjdF', 'SOLRotinFsbTjdT', $
;              'SOLRotTd1', 'SOLRotinFsbFjdFfc03', 'SOLRotinFsbFjdTdl1','SOLRotinTsbFjdFdl1', $
;              'SOLRotinTsbFjdTdl1', 'SOLRotinFsbTjdFdl1', 'SOLRotinFsbTjdTdl1', $
;              'SOLRotFc03', 'SOLRotinFsbFjdFfc03fk3', 'SOLRotinFsbFjdFfc03fk5', $
;              'SOLRotinFsbFjdFfc03fk10', 'SOLRotinFsbFjdFfc03fk30',$
;              'SOLRotinTsbFjdFfc03', 'SOLRotinTsbFjdTfc03', 'SolRGRotFc03', $
    infiles=[ 'SOLRotRGinFsbFjdF', 'SOLRotRGinFsbFjdT','SOLRotRGinTsbFjdF', $
              'SOLRotRGinTsbFjdT', 'SOLRotRGinFsbTjdF', 'SOLRotRGinFsbTjdT'  ]
    outfile= 'Calibrate2'
    outtext='X = 0.7109  M= Msun  Z=.0182'
;    textperrun=['MP', 'Rot', 'Jd', 'In', 'InJd', 'Sb', 'SbJd', $
;                'MPdl1', 'Rotfc03', 'Jddl1', 'Indl1', 'InJddl1', $
;                'Sbdl1', 'SbJddl1', 'MPfc03', 'Rotfc03fk3', $
;                'Rotfc03fk5', 'Rotfc03fk10', 'Rotfc03fk30', $
;                'Infc03', 'InJdfc03', 'RGRotfc03', $
     textperrun=['RotRG', 'JdRG', 'InRG', 'InJdRG', 'SbRG', 'SbJdRG']
if gtype eq 'Track' then   begin
    xmin=3.8
    xmax=3.4
;    ymin=3.34
    ymax=3.5 
endif
if gtype eq 'Rot' then   begin
    xmin=-6
    xmax=2
    ymin=-.1
    ymax=3 
endif
if gtype eq 'Calibrate' then begin
    xmin=-5
    xmax=.5
    ymin=-.5
    ymax=2.0
endif
if gtype eq 'CoreR' then begin
    xmin=3
    xmax=18
    ymin=.01  ;10
    ymax=10000 ;400
endif

endif


if type eq 'RGCali' then begin
;Test how initial parameters that output the sun end up as red giants
    datadirectory= '~/EVOLUTION/output/RGcalibrate/'
    infiles=['SOLCalRG', 'SOLRGrealW', 'SOLRGrtFinFsbFjdF',$ 
              'SOLRGrtTinFsbTjdT', 'SOLRGMP', 'SOLRGFc0', 'SOLFc0'] ;, $
;              'SOLRGFc0cont1']
    outfile= 'SOLRGCal'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=['shortlock', 'realW', 'noRT', 'SBJDtest', 'LiMP', $
               'Fc=0', 'SolFc=0'];, 'Cont Fc=0']

if gtype eq'Rot' then begin
    xmin=-6
    xmax=5
    ymin=-2.5
    ymax=2
endif

if gtype eq 'Track' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=1.5
endif

if gtype eq 'Calibrate' then begin
 ;   xmin=3.8
     xmax=2
 ;   ymin=-1
 ;   ymax=1.5 
endif

endif

if type eq 'RGCaliFc0' then begin
;Test how initial parameters that output the sun end up as red giants
    datadirectory= '~/EVOLUTION/output/RGcalibrate/'
    infiles=['SOLRGMP', 'SOLRGFc0', 'SOLFc0', $
              'SOLRGFc0cont1', 'SOLRGFc0InF']
    outfile= 'SOLRGCalFc0'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=[ 'LiMP', $
               'Fc=0', 'SolFc=0', 'Cont Fc=0', 'InF']
if gtype eq'Rot' then begin
    xmin=-6
    xmax=5
    ymin=-2.5
    ymax=2
endif

if gtype eq 'Track' then begin
    xmin=3.8
    xmax=3.2
    ymin=-.5
    ymax=3.5
endif

if gtype eq 'Calibrate' then begin
 ;   xmin=3.8
     xmax=2
 ;   ymin=-1
 ;   ymax=1.5 
endif


endif

if type eq 'SOLbaseRG' then begin
;RG w/ various rot flags starting w/ SbJd solar
    datadirectory= '~/EVOLUTION/output/SBbase2RG/'
    infiles=[$ 
             'SOLbaseRGinFsbFjdF', 'SOLbaseRGinTsbFjdF', 'SOLbaseRGinFsbTjdF', $
             'SOLbaseRGinFsbFjdT', $
             'SOLbaseRGinTsbTjdF', 'SOLbaseRGinTsbFjdT', 'SOLbaseRGinFsbTjdT', $    
             'SOLbaseRGinTsbTjdT']
    outfile= 'SOLbaseRG'
    outtext='X = 0.7109 M=Msun Z=.0182'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;     xmin=3.9
;    xmax=3.45
    ymin=.1
    ymax= 100000
endif
endif

if type eq 'Cali3SbJd' then begin
;Test how initial parameters that output the sun end up as red giants
    datadirectory= '~/EVOLUTION/output/Cali3SbJd/'
    infiles=['SOLcaliSbJdFk_22', 'SOLcaliSbJdFk_265',  $
              'SOLcaliSbJdFk_30', 'SOLcaliSbJdFk_34', 'SOLcaliSbJdFk_38', $
              'SOLcaliSbJdFk_42']
    outfile= 'SOLCal3Fk'
    outtext='X = 0.7109  M= Msun  Z=.0182'
    textperrun=[ 'Fk=2.2', $
               'Fk=2.65', 'Fk=3.0', 'Fk=3.4','Fk=3.8','Fk=4.2']
if gtype eq'Rot' then begin
    xmin=-6
    xmax=5
    ymin=-2.5
    ymax=2
endif

if gtype eq 'Track' then begin
    xmin=3.8
    xmax=3.2
    ymin=-.5
    ymax=3.5
endif

if gtype eq 'Calibrate' then begin
    xmin=-.1
     xmax=.1
    ymin=-.1
    ymax=.1 
endif


endif

if type eq 'M10Z18p2' then begin
;RG w/ various rot flags starting w/ SbJd solar
    datadirectory= '~/EVOLUTION/output/SbJdbase2RG2/'
    infiles=[$ 
             'M10Z18RGp2inFsbFjdF', 'M10Z18RGp2inTsbFjdF', 'M10Z18RGp2inFsbTjdF', $
             'M10Z18RGp2inFsbFjdT', $
             'M10Z18RGp2inTsbTjdF', 'M10Z18RGp2inTsbFjdT', 'M10Z18RGp2inFsbTjdT', $    
             'M10Z18RGp2inTsbTjdT']
    outfile= 'M10Z18RGp2'
    outtext='X = 0.7109 M=Msun Z=.0182'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;     xmin=3.9
;    xmax=3.45
    ymin=.1
    ymax= 100000
endif
if gtype eq 'Li' then begin
    xmin=0.95
    xmax=1.1
    ymin=-3.9
    ymax=.1
endif
endif

if type eq 'CompareMZp2' then begin
;RG w/ various rot flags starting w/ SbJd solar
    datadirectory= '~/EVOLUTION/output/SbJdbase2RG2/'
    infiles=[$ 
             'M10Z18RGp2inFsbFjdF', 'M10Z18RGp2inFsbTjdT', 'M11Z18RGp2inFsbFjdF', $
             'M11Z18RGp2inFsbTjdT', $
             'M12Z18RGp2inFsbFjdF', 'M12Z18RGp2inFsbTjdT', 'M10Z16RGp2inFsbFjdF', $    
             'M10Z16RGp2inFsbTjdT', 'M10Z20RGp2inFsbFjdF', 'M10Z20RGp2inFsbTjdT']
    outfile= 'CompareMZp2'
    outtext='X = 0.7109'
    textperrun=[$
                'M10Z18Rot', 'M10Z18SbJd','M11Z18Rot', 'M11Z18SbJd', $
                'M12Z18Rot', 'M12Z18SbJd','M10Z16Rot', 'M10Z16SbJd', $
                'M10Z20Rot', 'M10Z20SbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;     xmin=3.9
;    xmax=3.45
    ymin=.1
    ymax= 100000
endif
if gtype eq 'Li' then begin
    xmin=0.95
    xmax=1.1
    ymin=-3.9
    ymax=.1
endif
if gtype eq 'OttoCali' then begin
    xmin=-1
    xmax=1
    ymin=-1
    ymax=1
    OttoAge=10.0
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.52
    OttoRbce=.36
   OmCDeH=710e-9*2*3.14159
   OmSDeH=150e-9*2*3.14159
endif

endif

if type eq 'CompareZp2' then begin
;RG w/ various rot flags starting w/ SbJd solar
    datadirectory= '~/EVOLUTION/output/SbJdbase2RG2/'
    infiles=[$ 
             'M10Z18RGp2inFsbFjdF', 'M10Z18RGp2inFsbTjdT', $
              'M10Z16RGp2inFsbFjdF', $    
             'M10Z16RGp2inFsbTjdT', 'M10Z20RGp2inFsbFjdF', 'M10Z20RGp2inFsbTjdT']
    outfile= 'CompareZp2'
    outtext='X = 0.7109'
    textperrun=[$
                'M10Z18Rot', 'M10Z18SbJd', $
                'M10Z16Rot', 'M10Z16SbJd', $
                'M10Z20Rot', 'M10Z20SbJd']
if gtype eq 'Track' then begin
     xmin=3.52
    xmax=3.5
    ymin=3.3
    ymax=3.35 
endif
if gtype eq 'CoreR' then begin
;     xmin=3.9
;    xmax=3.45
    ymin=.1
    ymax= 100000
endif
if gtype eq 'Li' then begin
    xmin=0.95
    xmax=1.1
    ymin=-3.9
    ymax=.1
endif
if gtype eq 'OttoCali' then begin
    xmin=-.3
    xmax=.3
    ymin=-.8
    ymax=.8
    OttoAge=10.
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.52
    OttoRbce=.36
   OmCDeH=710e-9*2*3.14159
   OmSDeH=150e-9*2*3.14159
endif

endif


if type eq 'M11Z18p2' then begin
;RG w/ various rot flags starting w/ SbJd solar
    datadirectory= '~/EVOLUTION/output/SbJdbase2RG2/'
    infiles=[$ 
             'M11Z18RGp2inFsbFjdF', 'M11Z18RGp2inTsbFjdF', 'M11Z18RGp2inFsbTjdF', $
             'M11Z18RGp2inFsbFjdT', $
             'M11Z18RGp2inTsbTjdF', 'M11Z18RGp2inTsbFjdT', 'M11Z18RGp2inFsbTjdT', $    
             'M11Z18RGp2inTsbTjdT']
    outfile= 'M11Z18RGp2'
    outtext='X = 0.7109 M=1.1Msun Z=.0182'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;     xmin=3.9
;    xmax=3.45
    ymin=.1
    ymax= 100000
endif
if gtype eq 'Li' then begin
    xmin=0.9
    xmax=1.5
    ymin=3
    ymax=1
endif

endif

if type eq 'M12Z18p2' then begin
;RG w/ various rot flags starting w/ SbJd solar
    datadirectory= '~/EVOLUTION/output/SbJdbase2RG2/'
    infiles=[$ 
             'M12Z18RGp2inFsbFjdF', 'M12Z18RGp2inTsbFjdF', 'M12Z18RGp2inFsbTjdF', $
             'M12Z18RGp2inFsbFjdT', $
             'M12Z18RGp2inTsbTjdF', 'M12Z18RGp2inTsbFjdT', 'M12Z18RGp2inFsbTjdT', $    
             'M12Z18RGp2inTsbTjdT']
    outfile= 'M12Z18RGp2'
    outtext='X = 0.7109 M=1.2Msun Z=.0182'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;     xmin=3.9
;    xmax=3.45
    ymin=.1
    ymax= 100000
endif
if gtype eq 'Li' then begin
    xmin=0.9
    xmax=1.5
    ymin=3
    ymax=1
endif

endif

if type eq 'M10Z16p2' then begin
;RG w/ various rot flags starting w/ SbJd solar
    datadirectory= '~/EVOLUTION/output/SbJdbase2RG2/'
    infiles=[$ 
             'M10Z16RGp2inFsbFjdF', 'M10Z16RGp2inTsbFjdF', 'M10Z16RGp2inFsbTjdF', $
             'M10Z16RGp2inFsbFjdT', $
             'M10Z16RGp2inTsbTjdF', 'M10Z16RGp2inTsbFjdT', 'M10Z16RGp2inFsbTjdT', $    
             'M10Z16RGp2inTsbTjdT']
    outfile= 'M10Z16RGp2'
    outtext='X = 0.7109 M=Msun Z=.0160'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;     xmin=3.9
;    xmax=3.45
    ymin=.1
    ymax= 100000
endif
endif

if type eq 'M10Z20p2' then begin
;RG w/ various rot flags starting w/ SbJd solar
    datadirectory= '~/EVOLUTION/output/SbJdbase2RG2/'
    infiles=[$ 
             'M10Z20RGp2inFsbFjdF', 'M10Z20RGp2inTsbFjdF', 'M10Z20RGp2inFsbTjdF', $
             'M10Z20RGp2inFsbFjdT', $
             'M10Z20RGp2inTsbTjdF', 'M10Z20RGp2inTsbFjdT', 'M10Z20RGp2inFsbTjdT', $    
             'M10Z20RGp2inTsbTjdT']
    outfile= 'M10Z20RGp2'
    outtext='X = 0.7109 M=Msun Z=.0200'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;     xmin=3.9
;    xmax=3.45
    ymin=.1
    ymax= 100000
endif
endif

if type eq 'Otto1' then begin
;otto best DH model
    datadirectory= '~/EVOLUTION/output/ottowrong/Otto/'
    infiles=[$ 
             'Otto1inFsbFjdF', 'Otto1inTsbFjdF', 'Otto1inFsbTjdF', $
             'Otto1inFsbFjdT', $
             'Otto1inTsbTjdF', 'Otto1inTsbFjdT', 'Otto1inFsbTjdT', $    
             'Otto1inTsbTjdT']
    outfile= 'OttodeHbest'
    outtext='X = 0.537 M=.836 Msun Z=.054'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'OttoCali' then begin
    xmin=-.1
    xmax=.1
    ymin=-1
    ymax=1
    OttoAge=12.2
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.52
    OttoRbce=.36
   OmCDeH=710e-9*2*3.14159
   OmSDeH=150e-9*2*3.14159
    OttoRho=.06457
endif
endif

if type eq 'Otto1RGp2' then begin
;otto best DH model run as SbJd up to the MS turnoff and then with the 8 diff rotational options
    datadirectory= '~/EVOLUTION/output/ottowrong/Ottobase2RG/'
    infiles=[$ 
             'Otto1RGp2inFsbFjdF', 'Otto1RGp2inTsbFjdF', 'Otto1RGp2inFsbTjdF', $
             'Otto1RGp2inFsbFjdT', $
             'Otto1RGp2inTsbTjdF', 'Otto1RGp2inTsbFjdT', 'Otto1RGp2inFsbTjdT', $    
             'Otto1RGp2inTsbTjdT']
    outfile= 'OttodeHbestRGp2'
    outtext='X = 0.537 M=.836 Msun Z=.054'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'OttoCali' then begin
    xmin=-.1
    xmax=.1
    ymin=-.5
    ymax=.5
    OttoAge=12.2
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.52
    OttoRbce=.36
   OmCDeH=710e-9*2*3.14159
   OmSDeH=150e-9*2*3.14159
    OttoRho=.06457
endif

endif

if type eq 'Otto1cali' then begin
;otto best DH model
    datadirectory= '~/EVOLUTION/output/ottowrong/Otto/'
    infiles=[$ 
             'Otto1Dl1Fk2_65Fc_62', 'Otto1Dl2Fk2_65Fc_62', 'Otto1Dl3Fk2_65Fc_62', $
             'Otto1Dl2Fk1_8Fc_62', 'Otto1Dl2Fk2_2Fc_62', 'Otto1Dl2Fk2_6Fc_62', $
             'Otto1Dl2Fk3_0Fc_62', 'Otto1Dl2Fk3_4Fc_62', 'Otto1Dl2Fk2_65Fc_0', $    
             'Otto1Dl2Fk2_65Fc_3', 'Otto1Dl2Fk2_65Fc_6', 'Otto1Dl2Fk2_65Fc_9']
    outfile= 'OttodeHbestcali'
    outtext='X = 0.537 M=.836 Msun Z=.054'
    textperrun=[$
                'Dle-2', 'Dle-3', 'Dle-4', 'Fk1.8', 'Fk2.2', 'Fk2.6', 'Fk3.0', 'Fk3.4', $
                'Fc0', 'Fc0.3', 'Fc0.6', 'Fc0.9']
if gtype eq 'OttoCali' then begin
    xmin=-.1
    xmax=.1
    ymin=-1
    ymax=1
    OttoAge=12.2
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.52
    OttoRbce=.36
   OmCDeH=710e-9*2*3.14159
   OmSDeH=150e-9*2*3.14159
    OttoRho=.06457
endif
endif


if type eq 'Otto2' then begin
;otto solar metallicity
    datadirectory= '~/EVOLUTION/output/ottowrong/Otto/'
    infiles=[$ 
             'OttoZsolinFsbFjdF', 'OttoZsolinTsbFjdF', 'OttoZsolinFsbTjdF', $
             'OttoZsolinFsbFjdT', $
             'OttoZsolinTsbTjdF', 'OttoZsolinTsbFjdT', 'OttoZsolinFsbTjdT', $    
             'OttoZsolinTsbTjdT']
    outfile= 'OttoZsol'
    outtext='X = 0.7109 M=.790 Msun Z=.0182'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'OttoCali' then begin
    xmin=-.1
    xmax=.1
    ymin=-1
    ymax=1
    OttoAge=13.4
    OttoTeff=5521
    OttoR=2.58
    OttoLogg=3.51
    OttoRbce=.43
   OmCDeH=710e-9*2*3.14159
   OmSDeH=150e-9*2*3.14159
    OttoRho=.06457
endif
endif

if type eq 'Otto1RGp2b' then begin
;otto best DH model run as SbJd up to the MS turnoff and then with the 8 diff rotational options
    datadirectory= '~/EVOLUTION/output/Otto2/'
    infiles=[$ 
             'Otto1bRGp2inFsbFjdF', 'Otto1bRGp2inTsbFjdF', 'Otto1bRGp2inFsbTjdF', $
             'Otto1bRGp2inFsbFjdT', $
             'Otto1bRGp2inTsbTjdF', 'Otto1bRGp2inTsbFjdT', 'Otto1bRGp2inFsbTjdT', $    
             'Otto1bRGp2inTsbTjdT']
    outfile= 'OttodeHbestRGp2b'
    outtext='X = 0.745 M=.836 Msun Z=.0019'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'OttoCali' then begin
    xmin=-1
    xmax=1
    ymin=-1
    ymax=1
    OttoAge=11.3 ; 11.05;   12.2 ;
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.52
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
endif


if type eq 'Otto1RGp2c' then begin
;otto best DH model run as SbJd up to the MS turnoff and then with the 8 diff rotational options
    datadirectory= '~/EVOLUTION/output/Otto2/'
    infiles=[$ 
             'Otto1cRGp2fk2_65inFsbFjdF', 'Otto1cRGp2fk2_65inTsbFjdF', 'Otto1cRGp2fk2_65inFsbTjdF', $
             'Otto1cRGp2fk2_65inFsbFjdT', $
             'Otto1cRGp2fk2_65inTsbTjdF', 'Otto1cRGp2fk2_65inTsbFjdT', 'Otto1cRGp2fk2_65inFsbTjdT', $    
             'Otto1cRGp2fk2_65inTsbTjdT']
    outfile= 'OttodeHbestRGp2c'
    outtext='[Z/X]=-1 M=.836 Msun Age=12.2 Gyrs'
    textperrun=[$
                'Rot', 'In', 'Sb', 'Jd', 'InSb', 'InJd', 'SbJd', 'InSbJd']
if gtype eq 'OttoCali' then begin
    xmin=-1
    xmax=1
    ymin=-1
    ymax=1
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.52
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
endif


if type eq 'OttoGrid' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed
    datadirectory= '~/EVOLUTION/output/OttoGrid/'
    infiles=[$ 
             'Ottom75zm075a0RGp2inFsbTjdT', 'Ottom75zm075a2RGp2inFsbTjdT', $
             'Ottom75zm100a0RGp2inFsbTjdT', 'Ottom75zm100a2RGp2inFsbTjdT', $
             'Ottom75zm125a0RGp2inFsbTjdT', 'Ottom75zm125a2RGp2inFsbTjdT', $
             'Ottom75zm150a0RGp2inFsbTjdT', 'Ottom75zm150a2RGp2inFsbTjdT', $
             'Ottom75zm175a0RGp2inFsbTjdT', 'Ottom75zm175a2RGp2inFsbTjdT', $
             'Ottom80zm075a0RGp2inFsbTjdT', 'Ottom80zm075a2RGp2inFsbTjdT', $
             'Ottom80zm100a0RGp2inFsbTjdT', 'Ottom80zm100a2RGp2inFsbTjdT', $
             'Ottom80zm125a0RGp2inFsbTjdT', 'Ottom80zm125a2RGp2inFsbTjdT', $
             'Ottom80zm150a0RGp2inFsbTjdT', 'Ottom80zm150a2RGp2inFsbTjdT', $
             'Ottom80zm175a0SbJdRGp2inFsbTjdT',  $
             'Ottom85zm075a0RGp2inFsbTjdT', 'Ottom85zm075a2RGp2inFsbTjdT', $
             'Ottom85zm100a0RGp2inFsbTjdT', 'Ottom85zm100a2RGp2inFsbTjdT', $
             'Ottom85zm125a0SbJdRGp2inFsbTjdT', 'Ottom85zm125a2SbJdRGp2inFsbTjdT', $
             'Ottom90zm075a0RGp2inFsbTjdT', 'Ottom90zm075a2RGp2inFsbTjdT', $
             'Ottom90zm100a0SbJdRGp2inFsbTjdT', 'Ottom90zm100a2SbJdRGp2inFsbTjdT', $
             'Ottom75zm075a0RGp2inFsbFjdF', 'Ottom75zm075a2RGp2inFsbFjdF', $
             'Ottom75zm100a0RGp2inFsbFjdF', 'Ottom75zm100a2RGp2inFsbFjdF', $
             'Ottom75zm125a0RGp2inFsbFjdF', 'Ottom75zm125a2RGp2inFsbFjdF', $
             'Ottom75zm150a0RGp2inFsbFjdF', 'Ottom75zm150a2RGp2inFsbFjdF', $
             'Ottom75zm175a0RGp2inFsbFjdF', 'Ottom75zm175a2RGp2inFsbFjdF', $
             'Ottom80zm075a0RGp2inFsbFjdF', 'Ottom80zm075a2RGp2inFsbFjdF', $
             'Ottom80zm100a0RGp2inFsbFjdF', 'Ottom80zm100a2RGp2inFsbFjdF', $
             'Ottom80zm125a0RGp2inFsbFjdF', 'Ottom80zm125a2RGp2inFsbFjdF', $
             'Ottom80zm150a0RGp2inFsbFjdF', 'Ottom80zm150a2RGp2inFsbFjdF', $
             'Ottom80zm175a0SbJdRGp2inFsbFjdF', $
             'Ottom85zm075a0RGp2inFsbFjdF', 'Ottom85zm075a2RGp2inFsbFjdF', $
             'Ottom85zm100a0RGp2inFsbFjdF', 'Ottom85zm100a2RGp2inFsbFjdF', $
             'Ottom85zm125a0SbJdRGp2inFsbFjdF', 'Ottom85zm125a2SbJdRGp2inFsbFjdF', $
             'Ottom90zm075a0RGp2inFsbFjdF', 'Ottom90zm075a2RGp2inFsbFjdF', $
             'Ottom90zm100a0SbJdRGp2inFsbFjdF', 'Ottom90zm100a2SbJdRGp2inFsbFjdF']
             
    outfile= 'OttoGridp2'
    outtext=''
    textperrun=[$
             'm75zm075a0SbJd', 'm75zm075a2SbJd', $
             'm75zm100a0SbJd', 'm75zm100a2SbJd', $
             'm75zm125a0SbJd', 'm75zm125a2SbJd', $
             'm75zm150a0SbJd', 'm75zm150a2SbJd', $
             'm75zm175a0SbJd', 'm75zm175a2SbJd', $
             'm80zm075a0SbJd', 'm80zm075a2SbJd', $
             'm80zm100a0SbJd', 'm80zm100a2SbJd', $
             'm80zm125a0SbJd', 'm80zm125a2SbJd', $
             'm80zm150a0SbJd', 'm80zm150a2SbJd', $
             'm80zm175a0SbJd',  $
             'm85zm075a0SbJd', 'm85zm075a2SbJd', $
             'm85zm100a0SbJd', 'm85zm100a2SbJd', $
             'm85zm125a0SbJd', 'm85zm125a2SbJd', $
             'm90zm075a0SbJd', 'm90zm075a2SbJd', $
             'm90zm100a0SbJd', 'm90zm100a2SbJd', $
             'm75zm075a0Rot', 'm75zm075a2Rot', $
             'm75zm100a0Rot', 'm75zm100a2Rot', $
             'm75zm125a0Rot', 'm75zm125a2Rot', $
             'm75zm150a0Rot', 'm75zm150a2Rot', $
             'm75zm175a0Rot', 'm75zm175a2Rot', $
             'm80zm075a0Rot', 'm80zm075a2Rot', $
             'm80zm100a0Rot', 'm80zm100a2Rot', $
             'm80zm125a0Rot', 'm80zm125a2Rot', $
             'm80zm150a0Rot', 'm80zm150a2Rot', $
             'm80zm175a0Rot', $
             'm85zm075a0Rot', 'm85zm075a2Rot', $
             'm85zm100a0Rot', 'm85zm100a2Rot', $
             'm85zm125a0Rot', 'm85zm125a2Rot', $
             'm90zm075a0Rot', 'm90zm075a2Rot', $
             'm90zm100a0Rot', 'm90zm100a2Rot']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-1
    ymax=1e5
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
endif

if type eq 'OttoSTOP' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/OttoGrid/'
    infiles=['OttoSTOPm85zm100a2RGp2inFsbTjdT', 'OttoSTOPm85zm100a2RGp2inFsbFjdF', $
             'OttoSTOPm85zm100a2inFsbFjdF']
    outfile= 'OttoSTOPp2'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=['Solid Body', 'Uncoupled Post-MS', 'Uncoupled'];['SbJd', 'Rot', 'RotonMS']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=2.5
    xmax=3.0; 17
    ymin=1e-4 ;-2
    ymax=1e3 ;5
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1
     ymin=1e-8 ;-2e-6
     ymax=1.e-2
endif
if gtype eq'RotKms' then begin
    xmin=.9
    xmax=1.5
    ymin=0
    ymax=20
endif
endif

if type eq 'OttonoSTOP' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/OttoGrid/'
    infiles=['Ottom85zm100a2RGp2inFsbTjdT', 'Ottom85zm100a2RGp2inFsbFjdF', $
             'Ottom85zm100a2inFsbFjdF']
    outfile= 'Ottop2'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=['Solid Body', 'Uncoupled Post-MS', 'Uncoupled'];['SbJd', 'Rot', 'RotonMS']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-1
    ymax=1e5
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1
     ymin=1e-8 ;-2e-6
     ymax=1.e-2
endif
if gtype eq'RotKms' then begin
    xmin=.95
    xmax=1.1
    ymin=0
    ymax=20
endif
endif

if type eq 'Ottop2p3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/Ottop2p3/'
    infiles=['Ottom85zm100a2RGp3ea106inFsbFjdF', 'Ottom85zm100a2RGp3ea104inFsbFjdF', $
             'Ottom85zm100a2RGp3ea102inFsbFjdF', 'Ottom85zm100a2RGp3ea100inFsbFjdF', $
             'Ottom85zm100a2RGp3ea098inFsbFjdF', 'Ottom85zm100a2RGp3ea096inFsbFjdF', $
             'Ottom85zm100a2RGp3ea103inFsbFjdF', 'Ottom85zm100a2RGp3ea1029inFsbFjdF',$
             'Ottom85zm100a2RGp3ea1028inFsbFjdF','Ottom85zm100a2RGp3ea1027inFsbFjdF',$
             'Ottom85zm100a2RGp3ea1026inFsbFjdF','Ottom85zm100a2RGp3ea1025inFsbFjdF',$
             'Ottom85zm100a2RGp3ea1024inFsbFjdF','Ottom85zm100a2RGp3ea1023inFsbFjdF',$
             'Ottom85zm100a2RGp3ea1022inFsbFjdF','Ottom85zm100a2RGp3ea1021inFsbFjdF']
    outfile= 'Ottop2p3'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=['.07Gyrs','.27Gyrs','.47Gyrs', '.67Gyrs', '.87Gyrs', '1.07Gyrs', '.37Gyrs', $
                '.38Gyrs', '.39Gyrs', '.40Gyrs', '.41Gyrs', '.42Gyrs', '.43Gyrs', '.44Gyrs', $
                '.45Gyrs', '.46Gyrs']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=2.0 ;1.2
    xmax=3.0 ;5
    ymin=20;1000
    ymax=10 ;1
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=1e-8
     ymax=3e-6
endif
endif

if type eq 'OttoLimits' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/OttoGrid/'
    infiles=[ 'OttoSTOPm85zm100a2RGp2inFsbFjdF', $
             'OttoSTOPm85zm100a2inFsbFjdF', 'Ottom85zm100a2SbJd',  $
;            'Ottom85zm100a2Sb', 'Ottom85zm100a2Rot', 'Ottom85zm100a2Rotw3', 
             'Ottom85zm100a2Rotw2']
    outfile= 'Ottolimits'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=[ 'Rot', 'RotonMS', 'SbJd', $  ;'2zSb',  '2zRotMSw1', '2zRotMSw2',
                 '2z']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-1
    ymax=1e5
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=-2
     ymax=1
endif
if gtype eq'Rot2z' then begin
    xmin=10.0  ;0
    xmax=11.0  ;13.0
    ymin=-3.0
    ymax=5.0
endif
endif

if type eq 'M2_5wbegin' then begin
;Try to get the 2.5 Msun model working
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=['2_5MRGinFsbTjdF', '2_5MRGinFsbTjdFw3', $  
             '2_5MRGinFsbTjdFw6'] ;, $
 ;            'M10Z18RGp2inFsbTjdT', 'M10Z18RGp2inFsbFjdF', $
 ;            'Ottom85zm100a2RGp2inFsbTjdT', 'Ottom85zm100a2RGp2inFsbFjdF'] 
  
    outfile= 'M2_5wbegin'
    outtext='M= 2.5Msun, Main Sequence- Sb'
    textperrun=['50km/s', '150km/s', '300km/s'];,'50km/sRot', '150km/sRot', '300km/sRot']; , $
;                'M1SbJd', 'M1Rot', 'OttoSbJd', 'OttoRot']

if gtype eq 'Track' then  begin
     xmin= 3.9 ;3.84 ;
    xmax=3.53 ;3.81
    ymin=0 ;.65 
    ymax=3.0 ; .85 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-1
    ymax=1e5
endif
endif

if type eq 'M2_5w' then begin
;Try to get the 2.5 Msun model working
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=['2_5MRGinFsbTjdFRGp2inFsbTjdT', '2_5MRGinFsbTjdFw3RGp2inFsbTjdT', $  
             '2_5MRGinFsbTjdFw6RGp2inFsbTjdT', '2_5MRGinFsbTjdFRGp2inFsbFjdF', $
             '2_5MRGinFsbTjdFw3RGp2inFsbFjdF', '2_5MRGinFsbTjdFw6RGp2inFsbFjdF', $
 ;            'M10Z18RGp2inFsbTjdT', 'M10Z18RGp2inFsbFjdF', $
             'Ottom85zm100a2RGp2inFsbTjdT', 'Ottom85zm100a2RGp2inFsbFjdF'] 
  
    outfile= 'M2_5w'
    outtext='M= 2.5Msun, Main Sequence- Sb'
    textperrun=['50km/sSbJd', '150km/sSbJd', '300km/sSbJd','50km/sRot', '150km/sRot', '300km/sRot', $
;                'M1SbJd', 'M1Rot', 
                'OttoSbJd', 'OttoRot']

if gtype eq 'Track' then  begin
     xmin= 3.9 ;3.84 ;
    xmax=3.53 ;3.81
    ymin=0 ;.65 
    ymax=3.0 ; .85 
endif
if gtype eq 'CoreR' then begin
    xmin=2.5
;    xmax=17
    ymin=1e-2
    ymax=1e5
endif
if gtype eq'RotKms' then begin
    xmin=-.3
    xmax=0
    ymin=0
    ymax=20
endif
endif


if type eq '2.5pubInter' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[$ ;'2_5MRGinFsbTjdFRGp2inFsbTjdT', '2_5MRGinFsbTjdFw6RGp2inFsbTjdTt6', $  
             ;'2_5MRGinFsbTjdFRGp2inFsbFjdF','2_5MRGinFsbTjdFw6RGp2inFsbFjdFt6', $
             ;'2_5MRGinFsbFjdF', '2_5MRGinFsbFjdFw6t6',$
             ;'2_5MRGinFsbTjdFw3RGp2inFsbFjdF',
              '2_5MRGinFsbFjdFw3t6', $
             ;'2_5MRGinFsbTjdFw3RGp2inFsbTjdTt67b',
              '2_5MRGinFsbTjdFw3EoMS'];
            ; , $
;             '2_5MRGinFsbTjdFw3RGp4inFsbTjdTt67b']
;             '2_5MRGinFsbFjdF'];,  $
;              '2_5MRGinFsbTjdFw3RGp2inFsbTjdT54p3Rot', $  
;             '2_5MRGinFsbTjdFw3RGp2inFsbTjdT53p3Rot', '2_5MRGinFsbTjdFw3RGp2inFsbTjdT545p3Rot', $ 
;              '2_5MRGinFsbTjdFw3RGp2inFsbTjdT5475p3Rot'];, '2_5MRGinFsbTjdFw3RGp2inFsbTjdT52p3Rot',$
;;             '2_5MRGinFsbTjdFw3RGp2inFsbTjdT51p3Rot', '2_5MRGinFsbTjdFw3RGp2inFsbTjdT50p3Rot']        
    outfile= '2_5pubInter'
    outtext=''
    textperrun=[ '', '','','','n','n','No Coupling Post-MS', 'No Coupling', $
;                '', '','','','','',''$
               'Maximal Coupling','y','','0.01Gyrs', '0.02Gyrs', '0.005Gyrs', '0.0025Gyrs' $
;                , '0.03Gyrs', '0.04Gyrs', '0.05Gyrs', $
                 ]
    textperrun=['Decoupled', 'Coupled','','','','','', '','','','','']

endif

if type eq '2.5pub' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=['2_5MRGinFsbTjdFRGp2inFsbTjdT', '2_5MRGinFsbTjdFw6RGp2inFsbTjdTt6', $  
             '2_5MRGinFsbTjdFRGp2inFsbFjdF','2_5MRGinFsbTjdFw6RGp2inFsbFjdFt6', $
             '2_5MRGinFsbFjdF', '2_5MRGinFsbFjdFw6t6',$
             '2_5MRGinFsbTjdFw3RGp2inFsbFjdF', '2_5MRGinFsbFjdFw3t6', $
             '2_5MRGinFsbTjdFw3RGp2inFsbTjdTt67b', '2_5MRGinFsbTjdFw3EoMS', $
             '2_5MRGinFsbTjdFw3RGp4inFsbTjdTt67b']
;             '2_5MRGinFsbFjdF'];,  $
;              '2_5MRGinFsbTjdFw3RGp2inFsbTjdT54p3Rot', $  
;             '2_5MRGinFsbTjdFw3RGp2inFsbTjdT53p3Rot', '2_5MRGinFsbTjdFw3RGp2inFsbTjdT545p3Rot', $ 
;              '2_5MRGinFsbTjdFw3RGp2inFsbTjdT5475p3Rot'];, '2_5MRGinFsbTjdFw3RGp2inFsbTjdT52p3Rot',$
;;             '2_5MRGinFsbTjdFw3RGp2inFsbTjdT51p3Rot', '2_5MRGinFsbTjdFw3RGp2inFsbTjdT50p3Rot']        
    outfile= '2_5pub'
    outtext=''
    textperrun=[ '', '','','','','','No Coupling Post-MS', 'No Coupling', $
;                '', '','','','','',''$
               'Maximal Coupling','','','0.01Gyrs', '0.02Gyrs', '0.005Gyrs', '0.0025Gyrs' $
;                , '0.03Gyrs', '0.04Gyrs', '0.05Gyrs', $
                 ]
;    textperrun=['', '','','','','','', '','','','','']
if gtype eq 'CoreR' then begin
    xmin=3.0
    xmax=16.0
    ymin=1e4
    ymax=1e-3
endif
if gtype eq 'CoreRPub' then begin
    xmin=1.0 ;7.5;8.0;3.0;
    xmax=100.0 ;14.5;14.0;12.0 ;16.0;
    ymin=1e6;250;150;1e3;1e2;
    ymax=1e-3 ;25.0;30;1e-2;-2;3;
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=-2
     ymax=1
endif

if gtype eq 'RotKms' then begin
     xmin=3.5
     xmax=.5
     ymin=0
     ymax=25
endif

if gtype eq'Rot2z' then begin
    xmin=10.0  ;0
    xmax=11.0  ;13.0
    ymin=-3.0
    ymax=5.0
endif
if gtype eq 'Track' then begin
     xmin=4.0 ;3.76 ;
    xmax=3.6 ;3.66 ;
    ymin=0.5 ;
    ymax=3.2 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'Temp' then begin
    xmin=-6
    xmax=1
    ymin=3.0
    ymax=4.5
endif
endif
if type eq 'Ottopub' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/OttoGrid/'
    infiles=['Ottom90zm075a0RGp2inFsbTjdT', $ 
             'Ottom80zm125a2RGp2inFsbTjdT', $
             'Ottom90zm075a0RGp2inFsbFjdF', $
             'Ottom80zm125a2RGp2inFsbFjdF', $

             'Ottom90zm075a0RGp2inFsbFjdF', $
             'Ottom80zm125a2RGp2inFsbFjdF', $

;             'Ottom90zm075a0Rot', $
;             'Ottom80zm125a2Rot', $

             'Ottom85zm100a2RGp2inFsbFjdF', $
             'Ottom85zm100a2inFsbFjdF', 'Ottom85zm100a2SbJd' ,  $ ;];
;
;              'Ottom85zm100a2SbJd4kmsRGp2inFsbFjdF',  'Ottom85zm100a2SbJd4kmsRGp2inFsbFjdT',$
;             'Ottom85zm100a2RGp2inFsbFjdF','Ottom85zm100a2RGp2inFsbFjdT',$
;             'Ottom85zm100a2Rot4kms','Ottom85zm100a2Rot4kmsJd',$
;             'Ottom85zm100a2inFsbFjdF', 'Ottom85zm100a2inFsbFjdT',$
;             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdF','Ottom85zm100a2SbJd4kmsRGp2inFsbTjdT' ,$
;             'Ottom85zm100a2Sb','Ottom85zm100a2SbJd',$
;             'Ottom85zm100a2SbJd4kmsEoMS', $
;             ]; ,  $

             'Ottom85zm100a2RGp3ea106inFsbFjdF', 'Ottom85zm100a2RGp3ea104inFsbFjdF', $
              'Ottom85zm100a2RGp3ea100inFsbFjdF', $ ;'Ottom85zm100a2RGp3ea102inFsbFjdF',
             'Ottom85zm100a2RGp3ea1024inFsbFjdF', $
             'Ottom85zm100a2RGp3ea1028inFsbFjdF'];, 'Ottom85zm100a2RGp2FFFI3cz2'] 
            
;             'Ottom75zm075a2RGp2inFsbTjdT', $
;             'Ottom75zm100a0RGp2inFsbTjdT', 'Ottom75zm100a2RGp2inFsbTjdT', $
;             'Ottom75zm125a0RGp2inFsbTjdT', 'Ottom75zm125a2RGp2inFsbTjdT', $
;             'Ottom75zm150a0RGp2inFsbTjdT', 'Ottom75zm150a2RGp2inFsbTjdT', $
 ;            'Ottom75zm175a0RGp2inFsbTjdT', 'Ottom75zm175a2RGp2inFsbTjdT', $
 ;            'Ottom80zm075a0RGp2inFsbTjdT', 'Ottom80zm075a2RGp2inFsbTjdT', $
 ;            'Ottom80zm100a0RGp2inFsbTjdT', 'Ottom80zm100a2RGp2inFsbTjdT', $
 ;            'Ottom80zm125a0RGp2inFsbTjdT', 'Ottom80zm125a2RGp2inFsbTjdT', $
 ;            'Ottom80zm150a0RGp2inFsbTjdT', 'Ottom80zm150a2RGp2inFsbTjdT', $
 ;            'Ottom80zm175a0SbJdRGp2inFsbTjdT',  $
 ;            'Ottom85zm075a0RGp2inFsbTjdT', 'Ottom85zm075a2RGp2inFsbTjdT', $
 ;            'Ottom85zm100a0RGp2inFsbTjdT', 'Ottom85zm100a2RGp2inFsbTjdT', $
 ;            'Ottom85zm125a0SbJdRGp2inFsbTjdT', 'Ottom85zm125a2SbJdRGp2inFsbTjdT', $
 ;            'Ottom90zm075a0RGp2inFsbTjdT', 'Ottom90zm075a2RGp2inFsbTjdT', $
 ;             'Ottom90zm100a0SbJdRGp2inFsbTjdT',$ 
  
;              'Ottom75zm075a2RGp2inFsbFjdF', $
 ;            'Ottom75zm100a0RGp2inFsbFjdF', 'Ottom75zm100a2RGp2inFsbFjdF', $
 ;            'Ottom75zm125a0RGp2inFsbFjdF', 'Ottom75zm125a2RGp2inFsbFjdF', $
 ;            'Ottom75zm150a0RGp2inFsbFjdF', 'Ottom75zm150a2RGp2inFsbFjdF', $
 ;            'Ottom75zm175a0RGp2inFsbFjdF', 'Ottom75zm175a2RGp2inFsbFjdF', $
 ;            'Ottom80zm075a0RGp2inFsbFjdF', 'Ottom80zm075a2RGp2inFsbFjdF', $
 ;            'Ottom80zm100a0RGp2inFsbFjdF', 'Ottom80zm100a2RGp2inFsbFjdF', $
 ;            'Ottom80zm125a0RGp2inFsbFjdF', 'Ottom80zm125a2RGp2inFsbFjdF', $
 ;            'Ottom80zm150a0RGp2inFsbFjdF', 'Ottom80zm150a2RGp2inFsbFjdF', $
 ;            'Ottom80zm175a0SbJdRGp2inFsbFjdF', $
 ;            'Ottom85zm075a0RGp2inFsbFjdF', 'Ottom85zm075a2RGp2inFsbFjdF', $
  ;           'Ottom85zm100a0RGp2inFsbFjdF', 'Ottom85zm100a2RGp2inFsbFjdF', $
  ;           'Ottom85zm125a0SbJdRGp2inFsbFjdF', 'Ottom85zm125a2SbJdRGp2inFsbFjdF', $
  ;           'Ottom90zm075a0RGp2inFsbFjdF', 'Ottom90zm075a2RGp2inFsbFjdF', $
  ;           'Ottom90zm100a0SbJdRGp2inFsbFjdF',
  ;            'Ottom90zm100a2SbJdRGp2inFsbFjdF']
    outfile= 'OttoPub'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=[ '', '','','','','','No Coupling Post-MS', 'No Coupling MS', $
;                 '','','','','','' $
               'Maximal Coupling','0.07Gyrs','0.27Gyrs', '0.67Gyrs' ,$; '0.47Gyrs',$
               '0.44Gyrs', '0.39Gyrs', 'I3cz2' ]
;             'm75zm075a0SbJd', 'm75zm075a2SbJd', $
;             'm75zm100a0SbJd', 'm75zm100a2SbJd', $
;             'm75zm125a0SbJd', 'm75zm125a2SbJd', $
;             'm75zm150a0SbJd', 'm75zm150a2SbJd', $
;             'm75zm175a0SbJd', 'm75zm175a2SbJd', $
;             'm80zm075a0SbJd', 'm80zm075a2SbJd', $
;             'm80zm100a0SbJd', 'm80zm100a2SbJd', $
;             'm80zm125a0SbJd', 'm80zm125a2SbJd', $
;             'm80zm150a0SbJd', 'm80zm150a2SbJd', $
;             'm80zm175a0SbJd',  $
;             'm85zm075a0SbJd', 'm85zm075a2SbJd', $
;             'm85zm100a0SbJd', 'm85zm100a2SbJd', $
;             'm85zm125a0SbJd', 'm85zm125a2SbJd', $
;             'm90zm075a0SbJd', 'm90zm075a2SbJd', $
;             'm90zm100a0SbJd', 'm90zm100a2SbJd', $
;             'm75zm075a0Rot', 'm75zm075a2Rot', $
;             'm75zm100a0Rot', 'm75zm100a2Rot', $
;             'm75zm125a0Rot', 'm75zm125a2Rot', $
;             'm75zm150a0Rot', 'm75zm150a2Rot', $
;             'm75zm175a0Rot', 'm75zm175a2Rot', $
;             'm80zm075a0Rot', 'm80zm075a2Rot', $
;             'm80zm100a0Rot', 'm80zm100a2Rot', $
;             'm80zm125a0Rot', 'm80zm125a2Rot', $
;             'm80zm150a0Rot', 'm80zm150a2Rot', $
;             'm80zm175a0Rot', $
;             'm85zm075a0Rot', 'm85zm075a2Rot', $
;             'm85zm100a0Rot', 'm85zm100a2Rot', $
;             'm85zm125a0Rot', 'm85zm125a2Rot', $
;             'm90zm075a0Rot', 'm90zm075a2Rot', $
;             'm90zm100a0Rot', 'm90zm100a2Rot']  
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.7;3.9
    xmax=3.5;3.45
    ymin=3.0;  -1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-1
    ymax=1e5
endif
if gtype eq 'CoreRPub' then begin
    xmin=1.5;1. ;
    xmax= 7.0;4.5;100.0 ;
    ymin=1e3;6;
    ymax=1e00;-3;
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=1e-9
     ymax=1e-5
endif
if gtype eq'Rot2z' then begin
    xmin=10.0  ;0
    xmax=11.0  ;13.0
    ymin=-3.0
    ymax=5.0
endif
if gtype eq'RotKms' then begin
    xmin=4.0 ;0
    xmax=3.5  ;13.0
    ymin=0.2
    ymax=3.0
endif
endif

if type eq 'Double' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=['OttoGrid/Ottom75zm075a0RGp2inFsbTjdT', $ 
             'OttoGrid/Ottom90zm100a2SbJdRGp2inFsbTjdT', $
             'OttoGrid/Ottom75zm075a0RGp2inFsbFjdF', $
             'OttoGrid/Ottom90zm100a2SbJdRGp2inFsbFjdF', $
             'OttoGrid/Ottom75zm075a0Rot', $
             'OttoGrid/Ottom90zm100a2Rot', $
             'M2_5w/2_5MRGinFsbTjdFRGp2inFsbTjdT', 'M2_5w/2_5MRGinFsbTjdFw6RGp2inFsbTjdT', $  
             'M2_5w/2_5MRGinFsbTjdFRGp2inFsbFjdF','M2_5w/2_5MRGinFsbTjdFw6RGp2inFsbFjdF', $
             'M2_5w/2_5MRGinFsbFjdF', 'M2_5w/2_5MRGinFsbFjdFw6',$
             'M2_5w/2_5MRGinFsbTjdFw3RGp2inFsbFjdF', 'M2_5w/2_5MRGinFsbFjdFw3', $
             'M2_5w/2_5MRGinFsbTjdFw3EoMS', 'M2_5w/2_5MRGinFsbTjdFw3RGp2inFsbTjdT',  $
;             'M2_5w/2_5MRGinFsbTjdFw3RGp2inFsbTjdT54p3Rot', $  
;             'M2_5w/2_5MRGinFsbTjdFw3RGp2inFsbTjdT53p3Rot', 'M2_5w/2_5MRGinFsbTjdFw3RGp2inFsbTjdT545p3Rot', $ 
;             'M2_5w/2_5MRGinFsbTjdFw3RGp2inFsbTjdT5475p3Rot',$
             'OttoGrid/Ottom85zm100a2RGp2inFsbFjdF', 'OttoGrid/Ottom85zm100a2EoMS',$
             'OttoGrid/Ottom85zm100a2inFsbFjdF', 'OttoGrid/Ottom85zm100a2SbJd', $
             'OttoGrid/Ottom85zm100a2RGp2inFsbFjdFwm20','OttoGrid/Ottom85zm100a2SbJdwm20'];, $
;             'Cali3SbJd/SOLcaliSbJdFk_265RG'];,  $
;             'OttoGrid/Ottom85zm100a2RGp3ea106inFsbFjdF', 'OttoGrid/Ottom85zm100a2RGp3ea104inFsbFjdF', $
;             'OttoGrid/Ottom85zm100a2RGp3ea100inFsbFjdF', $
;             'OttoGrid/Ottom85zm100a2RGp4ea102inFsbFjdF']             

    outfile= 'Double'
    outtext=''
    textperrun=[ '', '','','','','', '', '','','','','',$
               '2.5M No Coupling Post-MS', '2.5 M No Coupling', ' ', $
               '2.5M Maximal Coupling',$;'0.01Gyrs', '0.02Gyrs', '0.005Gyrs', '0.0025Gyrs', $
               'Otto No Coupling Post-MS','', 'Otto No Coupling', $
               'Otto Maximal Coupling', 'oncpms_w-2','ottosb_w0-2', 'Solar Maximal Coupling','0.07Gyrs','0.27Gyrs', '0.67Gyrs' , '0.47Gyrs'$
                 ]
 
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-1
    ymax=1e5
endif
if gtype eq 'CoreRPub' then begin
    xmin=1.0;1.0
    xmax=100.0; 10.0; 
    ymin=1e6 ;6,4
    ymax=1e-3 ;-3
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=-2
     ymax=1
endif

if gtype eq 'ROm' then begin
     xmin=0.0
     xmax=12
     ymin=0.0
     ymax=2.5
endif

if gtype eq'Rot2z' then begin
    xmin=10.0  ;0
    xmax=11.0  ;13.0
    ymin=-3.0
    ymax=5.0
endif
endif


if type eq 'M2_5w6p3' then begin
;Try to get the 2.5 Msun model working
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=['2_5MRGinFsbTjdFw6RGp2inFsbTjdT57', '2_5MRGinFsbTjdFw6RGp2inFsbTjdT56p3Rot', $  
             '2_5MRGinFsbTjdFw6RGp2inFsbTjdT55p3Rot', '2_5MRGinFsbTjdFw6RGp2inFsbTjdT54p3Rot'] 
  
    outfile= 'M2_5w6p3'
    outtext='M= 2.5Msun, Main Sequence- 300km/s Sb'
    textperrun=['0Gyrs', '.005Gyrs', '0.015Gyrs', '0.025Gyrs', '0.045Gyrs', '0.065Gyrs']

if gtype eq 'Track' then  begin
     xmin= 3.9 ;3.84 ;
    xmax=3.53 ;3.81
    ymin=0 ;.65 
    ymax=3.0 ; .85 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-2
    ymax=1e5
endif
if gtype eq'RotKms' then begin
    xmin=-.3
    xmax=0
    ymin=0
    ymax=20
endif
if gtype eq 'RotLayers' then begin
;    xmin=3
;    xmax=17
    ymin=1e-8
    ymax=1e-3
endif
endif

if type eq 'M2_5test' then begin
;Try to get the 2.5 Msun model working
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=['2_5MRGinFsbTjdFw3RGp2inFsbTjdTt67b', '2_5MRGinFsbTjdFw3RGp2inFsbTjdT'] 
  
    outfile= 'M2_5test'
    outtext='M= 2.5Msun, Main Sequence- 150km/s Sb'
    textperrun=['0Gyrs', '.01Gyrs', '0.02Gyrs', '0.03Gyrs', '0.04Gyrs', '0.05Gyrs']
endif

if type eq 'M2_5w3p3' then begin
;Try to get the 2.5 Msun model working
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=['2_5MRGinFsbTjdFw3RGp2inFsbTjdT55', '2_5MRGinFsbTjdFw3RGp2inFsbTjdT54p3Rot', $  
             '2_5MRGinFsbTjdFw3RGp2inFsbTjdT53p3Rot', '2_5MRGinFsbTjdFw3RGp2inFsbTjdT52p3Rot',$
             '2_5MRGinFsbTjdFw3RGp2inFsbTjdT51p3Rot', '2_5MRGinFsbTjdFw3RGp2inFsbTjdT50p3Rot'] 
  
    outfile= 'M2_5w3p3'
    outtext='M= 2.5Msun, Main Sequence- 150km/s Sb'
    textperrun=['0Gyrs', '.01Gyrs', '0.02Gyrs', '0.03Gyrs', '0.04Gyrs', '0.05Gyrs']

if gtype eq 'Track' then  begin
     xmin= 3.9 ;3.84 ;
    xmax=3.53 ;3.81
    ymin=0 ;.65 
    ymax=3.0 ; .85 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-2
    ymax=1e5
endif
if gtype eq'RotKms' then begin
    xmin=-.3
    xmax=0
    ymin=0
    ymax=20
endif
if gtype eq 'RotLayers' then begin
;    xmin=3
;    xmax=17
    ymin=1e-8
    ymax=1e-3
endif


endif

if type eq 'M2_5w1p3' then begin
;Try to get the 2.5 Msun model working
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=['2_5MRGinFsbTjdFRG69p2inFsbTjdT', '2_5MRGinFsbTjdFRG68p3inFsbTjdT', $  
             '2_5MRGinFsbTjdFRG66p3inFsbTjdT', '2_5MRGinFsbTjdFRG64p3inFsbTjdT', $
             '2_5MRGinFsbTjdFRG62p3inFsbTjdT', '2_5MRGinFsbTjdFRG60p3inFsbTjdT', $
             '2_5MRGinFsbTjdFRG58p3inFsbTjdT', '2_5MRGinFsbTjdFRG56p3inFsbTjdT', $
             '2_5MRGinFsbTjdFRGp2Rot69', '2_5MRGinFsbTjdFRG52p3inFsbTjdT']
  
    outfile= 'M2_5w1p3'
    outtext='M= 2.5Msun, Main Sequence- 50km/s Sb'
    textperrun=['0Gyrs', '.008Gyrs', '0.028Gyrs','0.048Gyrs', '0.068Gyrs', '0.088Gyrs', '0.108Gyrs', '0.128Gyrs', $
                'allrot', '0.168Gyrs']

if gtype eq 'Track' then  begin
     xmin= 3.9 ;3.84 ;
    xmax=3.53 ;3.81
    ymin=0 ;.65 
    ymax=3.0 ; .85 
endif
if gtype eq 'CoreR' then begin
    xmin= 9;3
    xmax=12 ;17
    ymin=100 ;1e-2
    ymax=150 ;1e5
endif
if gtype eq'RotKms' then begin
    xmin=-.3
    xmax=0
    ymin=0
    ymax=20
endif
if gtype eq 'RotLayers' then begin
;    xmin=3
;    xmax=17
    ymin=1e-8
    ymax=4e-4
endif
endif

if type eq 'M2_5w1postp2' then begin
;Try to get the 2.5 Msun model working
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=['2_5MRGinFsbTjdFRGinFsbTjdT68p3Rot70', '2_5MRGinFsbTjdFRGinFsbTjdT68p3Rot72', $  
             '2_5MRGinFsbTjdFRGinFsbTjdT68p3Rot72', '2_5MRGinFsbTjdFRGinFsbTjdT68p3Rot76', $
             '2_5MRGinFsbTjdFRGinFsbTjdT68p3Rot78', '2_5MRGinFsbTjdFRGinFsbTjdT68p3Rot80', $
             '2_5MRGinFsbTjdFRGinFsbTjdT68p3Rot82', '2_5MRGinFsbTjdFRGinFsbTjdT68p3Rot84', $
             '2_5MRGinFsbTjdFRGinFsbTjdT68p3Rot'] 
  
    outfile= 'M2_5w1postp2'
    outtext='M= 2.5Msun, Main Sequence- 300km/s Sb'
    textperrun=['0.70Gyrs', '0.72Gyrs','0.74Gyrs', '0.76Gyrs','0.78Gyrs', '0.80Gyrs', $
                '0.82Gyrs', '0.84Gyrs', 'Crash']

if gtype eq 'Track' then  begin
     xmin= 3.9 ;3.84 ;
    xmax=3.53 ;3.81
    ymin=0 ;.65 
    ymax=3.0 ; .85 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-2
    ymax=1e5
endif
if gtype eq'RotKms' then begin
    xmin=-.3
    xmax=0
    ymin=0
    ymax=20
endif
if gtype eq 'RotLayers' then begin
;    xmin=3
;    xmax=17
    ymin=1e-8
    ymax=1e-3
endif
endif

if type eq 'Otto4kms' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/OttoGrid/'
    infiles=['Ottom80zm100a2EoMS', 'Ottom80zm100a2w2']
    outfile= 'Otto4kms'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=['Original', 'w2']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=2.5
;    xmax=17
    ymin=1e-2
    ymax=1e5
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1
     ymin=1e-8 ;-2e-6
     ymax=1.e-2
endif
if gtype eq'RotKms' then begin
    xmin=-6 ;0.85 ;
    xmax=1.2
    ymin=0
    ymax=100 ;5 ;
endif
endif

if type eq 'Otto2zKW' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/OttoGrid/'
    infiles=['Ottom85zm100a2SbJdfix',$  
             ;'Ottom85zm100a2RotKWt47', $
             ;'Ottom85zm100a2RotKWt111', $
             'Ottom85zm100a2RotKWt47b', $
             'Ottom85zm100a2RotKWt111b', 'Ottom85zm100a2RotKWt18' ]
             ; 'Ottom85zm100a2SbJdfix',  'Ottom85zm100a2Rotw2', 'Ottom85zm100a2RotKWt18','Ottom85zm100a2RotKWt37',
             ;'Ottom85zm100a2SbJdKWt37','Ottom85zm100a2RotKWt57', 'Ottom85zm100a2RotKWt19','Ottom85zm100a2RotKWt110',
    outfile= 'Otto2zKW'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=[$; '2zRot4e7',   '2zRot1e11',
                 'SbJd', '2zRot4e7b',$   
                '2zRot1e11b', '2zRot1e8b']
               ; 'Rot', '2zRott2e7','2zRot3e7', '2zSbJd3e7', '2zRot1e8','2zRot5e7','2zRot1e9', '2zRot1e10',
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
;    xmin=3
;    xmax=17
    ymin=1e-1
    ymax=1e5
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=-2
     ymax=1
endif
if gtype eq'Rot2z' then begin
    xmin=3.
    xmax= 4.8
    ymin=-2.
    ymax=2.
endif
endif

if type eq '2.52zKW' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=['2_5MRGRotKWt47b.dat']
    outfile= '2_5M2zKW'
    outtext='M=2.5Msun'
    textperrun=['4e7']

if gtype eq'Rot2z' then begin
    xmin=3.
    xmax= 4.8
    ymin=-2.
    ymax=2.
endif
endif

if type eq 'SOL2z' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/Sol2zCali/'
    infiles=['SOL207f3.2D0w2.5D-5','SOL407f3.8D0w3.0D-5', 'SOL108f7.0D0w4.5D-5', $
             'SOL109f27.0w9.0D-5','SOL110f6.0D0w4.0D-5','SOL111f0.7D0w1.0D-5'] 
    outfile= 'Sol2zcali'
    outtext='M=Msun '
    textperrun=['2e7', '4e7', '1e8', '1e9', '1e10', '1e11']
if gtype eq'Rot2z' then begin
    xmin=4.43
    xmax= 4.57
    ymin=-.2
    ymax=1.6
endif
endif


if type eq 'OttoBCZ' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/OttoGrid/'
    infiles=[ $
             ;'Ottom85zm100a2SbJdt2A6', 'Ottom85zm100a2SbJdt4A6','Ottom85zm100a2SbJdt8A6', $
             ;'Ottom85zm100a2SbJdt16A6', 'Ottom85zm100a2SbJdt32A6',
             ;'Ottom85zm100a2SbJdt64A6',
;             'Ottom85zm100a2SbJdHPTT1', 'Ottom85zm100a2SbJd1KWt47', $
;             'Ottom85zm100a2SbJdHPTT2', 'Ottom85zm100a2SbJdHPTT3',$
             'Ottom85zm100a2SbJdHPTT4', 'Ottom85zm100a2SbJd4KWt27',$
             'Ottom85zm100a2SbJd4KWt47','Ottom85zm100a2SbJd4KWt18',$
             'Ottom85zm100a2SbJd4KWt19', 'Ottom85zm100a2SbJd4KWt110',$
             'Ottom85zm100a2SbJd4KWt111'$
;             'Ottom85zm100a2SbJdHPTT4HPT1','Ottom85zm100a2SbJd4HPT1KWt47',$ 
;             'Ottom85zm100a2SbJdHPTT4HPT4','Ottom85zm100a2SbJd4HPT4KWt47',$
;             'Ottom85zm100a2SbJdHPTT4HT1','Ottom85zm100a2SbJd4HT1KWt47',$
;             'Ottom85zm100a2SbJd4KWt47'             
             ;'Ottom85zm100a2SbJdfix'
             ]
    outfile= 'Otto2zKW'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=[ $ 
                ;'HPTT1','HPTT1KW47', $
                 ;'HPTT2','HPTT3',
               'HPTT4','HPTT4KW27','HPTT4KW47','HPTT4KW18','HPTT4KW19','HPTT4KW110', $
               'HPTT4KW111' $
 ;,'HPT1','HPT1KW47', 'HPT4','HPT4KW47', 'HT1','HT1KW47',$
                ]

if gtype eq 'BCZLogg' then begin
    xmin=3.705;3.42;10.0;9.2;10.25;10.8
    xmax=3.71;3.44;11.08;10.8;10.35;
    ymin=0.60;0.34 ;1.325;.75
    ymax=0.61;0.36 ;1.362;1.0
endif
if gtype eq'Rot2z' then begin
    xmin=9.5
    xmax=10.25
    ymin=2e2
    ymax=5e1
endif

endif

if type eq 'Otto4kmspub' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/Otto4kms/'
;    infiles=['Ottom85zm100a2SbJd4kmsRGp2inFsbFjdF',  'Ottom85zm100a2SbJd4kmsRGp2inFsbFjdT',$
;             'Ottom85zm100a2RGp2inFsbFjdF','Ottom85zm100a2RGp2inFsbFjdT',$
;             'Ottom85zm100a2Rot4kms','Ottom85zm100a2Rot4kmsJd',$
;             'Ottom85zm100a2inFsbFjdF', 'Ottom85zm100a2inFsbFjdT',$
;             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdF','Ottom85zm100a2SbJd4kmsRGp2inFsbTjdT' ,$
;             'Ottom85zm100a2Sb','Ottom85zm100a2SbJd',$
;             'Ottom85zm100a2SbJd4kmsEoMS' ];,  $
;             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdF','Ottom85zm100a2SbJd4kmsRGp2inFsbFjdT',$
;             'Ottom85zm100a2SbJd4kmsRGp2inTsbFjdF', 'Ottom85zm100a2SbJd4kmsRGp2inTsbTjdF', $
;             'Ottom85zm100a2SbJd4kmsRGp2inTsbFjdT', 'Ottom85zm100a2SbJd4kmsRGp2inTsbTjdT', $


    infiles=['Ottom85zm100a2SbJd4kmsRGp2inFsbFjdF',  $
             'Ottom85zm100a2Rot4kms',$
             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdT' ,$
             'Ottom85zm100a2SbJd4kmsEoMS' ,  $
             'Ottom85zm100a2SbJd4kmsRGp3ea106Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea104Rot', $
              'Ottom85zm100a2SbJd4kmsRGp3ea100Rot', $
             'Ottom85zm100a2SbJd4kmsRGp3ea102Rot', $
              'Ottom85zm100a2SbJd4kmsRGp3ea1050Rot','Ottom85zm100a2SbJd4kmsRGp3ea10470Rot' ]             

    outfile= 'Otto4kmsPub'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=[ 'No Coupling Post-MS', 'No Coupling MS', $
               'Maximal Coupling','','0.07Gyrs','0.27Gyrs', '0.67Gyrs' , '0.47Gyrs',$
                '0.17Gyrs',  '0.20Gyrs']
;     textperrun=[ '4kmsp2Rot', '4kmsp2RotJd', '1kmsRot', '1kmsRotJd',$
;                  '4kmsRot', '4kmsJd', '1kmsRot', '1kmsRotJd',$
;                  '4kmsSb','4kmsSbJd', '1kmsSb','1kmsSbJd','']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=1.5;1. ;
    xmax= 3.;100.0 ;
    ymin=1e3 ;6
    ymax=1e0 ;-3
endif
if gtype eq 'CoreRPub' then begin
    xmin=1. ;1.5;
    xmax=100.0 ; 5.;
    ymin=1e6 ;3
    ymax=1e-3 ;0 
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=-2
     ymax=1
endif
if gtype eq'Rot2z' then begin
    xmin=10.0  ;0
    xmax=11.0  ;13.0
    ymin=-3.0
    ymax=5.0
endif
endif

if type eq 'Otto4kmsWind' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/Otto4kms/'
    infiles=['Ottom85zm100a2SbJd4kmsRGp2inFsbFjdF',  'Ottom85zm100a2SbJd4kmsRGp2inFsbFjdT',$
             'Ottom85zm100a2RGp2inFsbFjdF','Ottom85zm100a2RGp2inFsbFjdT',$
             'Ottom85zm100a2Rot4kms','Ottom85zm100a2Rot4kmsJd',$
             'Ottom85zm100a2inFsbFjdF', 'Ottom85zm100a2inFsbFjdT',$
             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdF','Ottom85zm100a2SbJd4kmsRGp2inFsbTjdT' ,$
             'Ottom85zm100a2RGp2inFsbTjdF','Ottom85zm100a2SbJd',$
             'Ottom85zm100a2SbJd4kmsEoMS' ];,  $
;             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdF','Ottom85zm100a2SbJd4kmsRGp2inFsbFjdT',$
;             'Ottom85zm100a2SbJd4kmsRGp2inTsbFjdF', 'Ottom85zm100a2SbJd4kmsRGp2inTsbTjdF', $
;             'Ottom85zm100a2SbJd4kmsRGp2inTsbFjdT', 'Ottom85zm100a2SbJd4kmsRGp2inTsbTjdT', $


;    infiles=['Ottom85zm100a2SbJd4kmsRGp2inFsbFjdF',  $
;             'Ottom85zm100a2Rot4kms',$
;             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdT' ,$
;             'Ottom85zm100a2SbJd4kmsEoMS' ,  $
;             'Ottom85zm100a2SbJd4kmsRGp3ea106Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea104Rot', $
;              'Ottom85zm100a2SbJd4kmsRGp3ea100Rot', $
;             'Ottom85zm100a2SbJd4kmsRGp3ea102Rot']             

    outfile= 'Otto4kmsPubWind'
    outtext='M=.85Msun [Z/X]=-1'
;    textperrun=[ 'No Coupling Post-MS', 'No Coupling MS', $
;               'Maximal Coupling','','0.07Gyrs','0.27Gyrs', '0.67Gyrs' , '0.47Gyrs'$
;                 ]
     textperrun=[ '4kmsp2Rot', '4kmsp2RotJd', '1kmsRot', '1kmsRotJd',$
                  '4kmsRot', '4kmsJd', '1kmsRot', '1kmsRotJd',$
                  '4kmsSb','4kmsSbJd', '1kmsSb','1kmsSbJd','']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=1. ;1.5
    xmax= 5.;100.0 ;
    ymin=1e3 ;6
    ymax=1e0 ;-3
endif
if gtype eq 'CoreRPub' then begin
    xmin=1. ;1.5;
    xmax=100.0 ; 5.;
    ymin=1e6 ;3
    ymax=1e-3 ;0 
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=-2
     ymax=1
endif
if gtype eq'Rot2z' then begin
    xmin=10.0  ;0
    xmax=11.0  ;13.0
    ymin=-3.0
    ymax=5.0
endif
endif

if type eq 'Otto4kmszoom' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/Otto4kms/'
;    infiles=['Ottom85zm100a2SbJd4kmsRGp2inFsbFjdF',  'Ottom85zm100a2SbJd4kmsRGp2inFsbFjdT',$
;             'Ottom85zm100a2RGp2inFsbFjdF','Ottom85zm100a2RGp2inFsbFjdT',$
;             'Ottom85zm100a2Rot4kms','Ottom85zm100a2Rot4kmsJd',$
;             'Ottom85zm100a2inFsbFjdF', 'Ottom85zm100a2inFsbFjdT',$
;             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdF','Ottom85zm100a2SbJd4kmsRGp2inFsbTjdT' ,$
;             'Ottom85zm100a2Sb','Ottom85zm100a2SbJd',$
;             'Ottom85zm100a2SbJd4kmsEoMS' ];,  $
;             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdF','Ottom85zm100a2SbJd4kmsRGp2inFsbFjdT',$
;             'Ottom85zm100a2SbJd4kmsRGp2inTsbFjdF', 'Ottom85zm100a2SbJd4kmsRGp2inTsbTjdF', $
;             'Ottom85zm100a2SbJd4kmsRGp2inTsbFjdT', 'Ottom85zm100a2SbJd4kmsRGp2inTsbTjdT', $


;    infiles=['Ottom85zm100a2SbJd4kmsRGp2inFsbFjdF',  $
;             'Ottom85zm100a2Rot4kms',$
;             'Ottom85zm100a2SbJd4kmsRGp2inFsbTjdT' ,$
;             'Ottom85zm100a2SbJd4kmsEoMS' ,  $
;             'Ottom85zm100a2SbJd4kmsRGp3ea106Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea104Rot', $
;              'Ottom85zm100a2SbJd4kmsRGp3ea100Rot', $
;             'Ottom85zm100a2SbJd4kmsRGp3ea102Rot', $
;             'Ottom85zm100a2SbJd4kmsRGp3ea1058Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea1056Rot', $
;             'Ottom85zm100a2SbJd4kmsRGp3ea1054Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea1052Rot', $
;             'Ottom85zm100a2SbJd4kmsRGp3ea1050Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea1048Rot', $
;             'Ottom85zm100a2SbJd4kmsRGp3ea1046Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea1044Rot', $
;             'Ottom85zm100a2SbJd4kmsRGp3ea1042Rot' $
;            ]             
    infiles=['Ottom85zm100a2SbJd4kmsRGp3ea1050Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea1048Rot', $
             'Ottom85zm100a2SbJd4kmsRGp3ea1046Rot','Ottom85zm100a2SbJd4kmsRGp3ea10500Rot', $
              'Ottom85zm100a2SbJd4kmsRGp3ea10495Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea10490Rot',$ 
              'Ottom85zm100a2SbJd4kmsRGp3ea10485Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea10480Rot',$ 
              'Ottom85zm100a2SbJd4kmsRGp3ea10475Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea10470Rot',$
              'Ottom85zm100a2SbJd4kmsRGp3ea10465Rot', 'Ottom85zm100a2SbJd4kmsRGp3ea10460Rot'] 
    outfile= 'Otto4kmszoom2'
    outtext='M=.85Msun [Z/X]=-1'
    textperrun=['0.17Gyrs', '0.19Gyrs', '0.21Gyrs', '0.170Gyrs', '0.175Gyrs', '0.180Gyrs', $
                '0.185Gyrs', '0.190Gyrs', '0.195Gyrs', '0.200Gyrs', '0.205Gyrs', '0.210Gyrs']
;    textperrun=[ 'No Coupling Post-MS', 'No Coupling MS', $
;               'Maximal Coupling','','0.07Gyrs','0.27Gyrs', '0.67Gyrs' , '0.47Gyrs', $
;               '0.09Gyrs', '0.11Gyrs', '0.13Gyrs', '0.15Gyrs', '0.17Gyrs', '0.19Gyrs',$
;               '0.21Gyrs', '0.23Gyrs', '0.25Gyrs'   ]
;     textperrun=[ '4kmsp2Rot', '4kmsp2RotJd', '1kmsRot', '1kmsRotJd',$
;                  '4kmsRot', '4kmsJd', '1kmsRot', '1kmsRotJd',$
;                  '4kmsSb','4kmsSbJd', '1kmsSb','1kmsSbJd','']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.9
    xmax=3.45
 ;   ymin=-1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=2.5;1.5;1. ;
    xmax=3.0; 5.;100.0 ;
    ymin=25;1e3 ;6
    ymax=10;1e0 ;-3
endif
if gtype eq 'CoreRPub' then begin
    xmin=1. ;1.5;
    xmax=100.0 ; 5.;
    ymin=1e6 ;3
    ymax=1e-3 ;0 
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=-2
     ymax=1
endif
if gtype eq'Rot2z' then begin
    xmin=10.0  ;0
    xmax=11.0  ;13.0
    ymin=-3.0
    ymax=5.0
endif
endif


if type eq '2.5outline' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $  
             '2_5MRGinFsbTjdFw3', '2_5MRGinFsbTjdFw6', '2_5MRGinFsbTjdF', $
             '2_5MRGinFsbTjdFw3RGp2inFsbFjdF','2_5MRGinFsbTjdFw6RGp2inFsbFjdF','2_5MRGinFsbTjdFRGp2inFsbFjdF']

    outfile= '2_5outline'
    outtext=''
    textperrun=[ 'w3SB', 'w6SB', 'w1SB' , 'w3Rot', 'w6Rot', 'w1Rot']
if gtype eq 'RotKms' then begin
    xmin=3.8
    xmax=1.0
    ymin=0
    ymax=80
endif
if gtype eq 'TeffLogg' then begin
    xmin=6000
    xmax=3500
    ymin=3.5
    ymax=0.0
endif
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.7
    ymax=2.5
endif

endif
if type eq '2.5fix' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $  
             '2_5MRGinFsbTjdFw3', '2_5MRGinFsbTjdFw6']
;            '2_5MRGinFsbTjdFw3RGp2inFsbTjdT', '2_5MRGinFsbTjdFw3RGp2inFsbTjdTt6', $
;            '2_5MRGinFsbTjdFw3RGp2inFsbTjdTt7',$
;             '2_5MRGinFsbTjdFw3RGp2inFsbTjdTtol', '2_5MRGinFsbTjdFw6RGp2inFsbTjdT',$
;             '2_5MRGinFsbTjdFRGp2inFsbTjdT', '2_5MRGinFsbTjdFw3RGp2inFsbTjdTt67struct',$
;             '2_5MRGinFsbTjdFw3RGp2inFsbTjdTt67b','2_5MRGinFsbTjdFw3RGp2inFsbTjdTt67']; 
    outfile= '2_5fix'
    outtext=''
    textperrun=[ 'w3', 'w6', 't7', 'tall', 'w6', 'w1',$
                 't67struct', 't67b','t67']
if gtype eq 'CoreR' then begin
    xmin=1.0 ;3.0;
    xmax=100.0 ;12.0 ;16.0
    ymin=1e4;1e6
    ymax=1e1 ;-2;-3
endif
if gtype eq 'CoreRPub' then begin
    xmin=1.0 ;3.0;
    xmax=100.0 ;12.0 ;16.0
    ymin=1e6;1e2
    ymax=1e-3 ;-2;3
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=-2
     ymax=1
endif
if gtype eq'Rot2z' then begin
    xmin=10.0  ;0
    xmax=11.0  ;13.0
    ymin=-3.0
    ymax=5.0
endif
if gtype eq 'Track' then begin
     xmin=3.9;
    xmax=3.5 ;
    ymin=-.5 ;
    ymax=3.2 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
endif
if type eq '1_25compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $  
              $
             'M2_5w/2_5MRGinFsbTjdFw3RGp2inFsbFjdF','Cali3SbJd/SOLcaliSbJdFk_265RG']

    outfile= ' '
    outtext=''
    textperrun=['2.5 Msun', '1 Msun']
if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=1.0
    ymin=0.0
    ymax=15.0
endif
endif
if type eq '25compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $  
             '2_5MRGinFsbTjdF', $
             '2_5MRGinFsbTjdFw3RGp2inFsbFjdF','2_5MRGinFsbTjdFw6RGp2inFsbFjdF']

    outfile= '2_5outline'
    outtext=''
    textperrun=[ '', '', '' , '', '', '']

if gtype eq'RotKms' then begin
    xmin=3.3
    xmax=0.7
    ymin=0.0
    ymax=15.0
endif
endif

if type eq 'm28compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $ 
               'm280w0Td1e2SbRGp2inFsbTjdT','m280w10e5Td1e3SbRGp2inFsbTjdT',$
               'm280w10e5Td6e4SbRGp2inFsbTjdT', 'm280w10e5Td8e4SbRGp2inFsbTjdT', $ 
                'm280w25e6Td1e3SbRGp2inFsbTjdT','m280w50e6Td1e3SbRGp2inFsbTjdT', $
                'm280w75e6Td1e3SbRGp2inFsbTjdT']

    outfile= '2_8compare'
    outtext=''
    textperrun=[ '0kms', '208kms', '320kms' , '250kms', '51kms', '104kms', '154kms']

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.5
    ymin=0.0
    ymax=20.0
endif
endif

if type eq 'm30compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $ 
               'm300w0Td1e2SbRGp2inFsbTjdT','m300w10e5Td1e3SbRGp2inFsbTjdT',$
               'm300w10e5Td6e4SbRGp2inFsbTjdT', 'm300w10e5Td8e4SbRGp2inFsbTjdT', $ 
                'm300w25e6Td1e3SbRGp2inFsbTjdT','m300w50e6Td1e3SbRGp2inFsbTjdT', $
                'm300w75e6Td1e3SbRGp2inFsbTjdT']

    outfile= '3_0compare'
    outtext=''
    textperrun=[ '0kms', '205kms', '308kms' , '248kms', '51kms', '105kms', '152kms']

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.5
    ymin=0.0
    ymax=20.0
endif
endif

if type eq 'm20compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $ 
               'm200w0Td1e2SbRGp2inFsbTjdT','m200w10e5Td1e3SbRGp2inFsbTjdT',$
               'm200w10e5Td6e4SbRGp2inFsbTjdT', 'm200w10e5Td8e4SbRGp2inFsbTjdT', $ 
                'm200w25e6Td1e3SbRGp2inFsbTjdT','m200w50e6Td1e3SbRGp2inFsbTjdT', $
                'm200w75e6Td1e3SbRGp2inFsbTjdT']

    outfile= '2_0compare'
    outtext=''
    textperrun=[ '0kms', '205kms', '303kms' , '242kms', '50kms', '101kms', '150kms']

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.5
    ymin=0.0
    ymax=20.0
endif
if gtype eq 'CoreR' then begin
    xmin=1.0;1.0
    xmax=100.0; 10.0; 
    ymin=1e6 ;6,4
    ymax=1e-3 ;-3
endif

endif

if type eq 'm22compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $ 
               'm220w0Td1e2SbRGp2inFsbTjdT','m220w10e5Td1e3SbRGp2inFsbTjdT',$
               'm220w10e5Td6e4SbRGp2inFsbTjdT', 'm220w10e5Td8e4SbRGp2inFsbTjdT', $ 
                'm220w25e6Td1e3SbRGp2inFsbTjdT','m220w50e6Td1e3SbRGp2inFsbTjdT', $
                'm220w75e6Td1e3SbRGp2inFsbTjdT']

    outfile= '2_2compare'
    outtext=''
    textperrun=[ '0kms', '201kms', '304kms' , '244kms', '51kms', '104kms', '152kms']

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.5
    ymin=0.0
    ymax=20.0
endif
if gtype eq 'Track' then begin
     xmin=3.67
    xmax=3.645
    ymin=2.0
    ymax=2.3 
endif
endif

if type eq 'mZRcompare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $               
               'm200w10e5Td6e4SbRGp2inFsbTjdT',  'm200w25e6Td1e3SbRGp2inFsbTjdT', 'm200w75e6Td1e3SbRGp2inFsbTjdT', $
               'm220w10e5Td6e4SbRGp2inFsbTjdT',  'm220w25e6Td1e3SbRGp2inFsbTjdT', 'm220w75e6Td1e3SbRGp2inFsbTjdT', $
               'm240w10e5Td6e4SbRGp2inFsbTjdT',  'm240w25e6Td1e3SbRGp2inFsbTjdT', 'm240w75e6Td1e3SbRGp2inFsbTjdT', $
               'm260w10e5Td6e4SbRGp2inFsbTjdT',  'm260w25e6Td1e3SbRGp2inFsbTjdT', 'm260w75e6Td1e3SbRGp2inFsbTjdT', $
               'm280w10e5Td6e4SbRGp2inFsbTjdT',  'm280w25e6Td1e3SbRGp2inFsbTjdT', 'm280w75e6Td1e3SbRGp2inFsbTjdT', $
               'm300w10e5Td6e4SbRGp2inFsbTjdT',  'm300w25e6Td1e3SbRGp2inFsbTjdT', 'm300w75e6Td1e3SbRGp2inFsbTjdT' $
            ]

    outfile= 'mZRcompare'
    outtext=''
    textperrun=[  'm20_w6' ,'M20_w1', 'M20_w3','m22_w6' ,'M22_w1', 'M22_w3', $
                  'm24_w6' ,'M24_w1', 'M24_w3', 'm26_w6' ,'M26_w1', 'M26_w3', $
                  'm28_w6' ,'M28_w1', 'M28_w3', 'm30_w6' ,'M30_w1', 'M30_w3']

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.5
    ymin=0.0
    ymax=20.0
endif
endif
if type eq 'mZRall' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/ZR_out/'
  infiles=['m060w10e5Td6e4Sb','m080w10e5Td6e4Sb','m100w10e5Td6e4Sb','m120w10e5Td6e4Sb', $
           'm140w10e5Td6e4SbRGp2inFsbTjdT','m160w10e5Td6e4SbRGp2inFsbTjdT','m180w10e5Td6e4SbRGp2inFsbTjdT', $
           'm200w10e5Td6e4SbRGp2inFsbTjdT','m220w10e5Td6e4SbRGp2inFsbTjdT','m240w10e5Td6e4SbRGp2inFsbTjdT',$
           'm260w10e5Td6e4SbRGp2inFsbTjdT','m280w10e5Td6e4SbRGp2inFsbTjdT','m300w10e5Td6e4SbRGp2inFsbTjdT']

    outfile= 'mZRall'
    outtext=''
    textperrun=[  '060', '080', '100', '120','140', '160', '180', '200', '220', '240', '260', '280', '300']

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.5
    ymin=0.0
    ymax=20.0
endif
endif
if type eq 'tipRGB' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $ 
               'm100zhm020y264a18al02_nodiff','m180zhm020y264a18al02_nodiff']

    outfile= 'tipRGB'
    outtext=''
    textperrun=[ 'm010', 'm180']
if gtype eq 'Track' then begin
    xmin=3.9
    xmax=3.3
    ymin=2.9
    ymax=3.4
endif

endif

if type eq 'fig2' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $ 
                'ZRmod/m300w10e5Td8e4SbRGp2inFsbTjdT', 'Cali3SbJd/SOLcaliSbJdFk_265RG' $
            ] 

    outfile= 'fig2'
    outtext=''
    textperrun=[ '3.0 msun', '1.0 msun']

if gtype eq'RotKms' then begin
    xmin=3.0
    xmax=1.0
    ymin=-1.0
    ymax=20.0
endif
if gtype eq'RotKmspub' then begin
    xmin=3.0
    xmax=1.0
    ymin=-1.0
    ymax=20.0
endif
endif

if type eq 'm24compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $ 
               'm240w0Td1e2SbRGp2inFsbTjdT','m240w10e5Td1e3SbRGp2inFsbTjdT',$
               'm240w10e5Td6e4SbRGp2inFsbTjdT', 'm240w10e5Td8e4SbRGp2inFsbTjdT', $ 
                'm240w25e6Td1e3SbRGp2inFsbTjdT','m240w50e6Td1e3SbRGp2inFsbTjdT', $
                'm240w75e6Td1e3SbRGp2inFsbTjdT']

    outfile= '2_4compare'
    outtext=''
    textperrun=[ '0kms', '200kms', '300kms' , '250kms', '50kms', '100kms', '150kms']

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.5
    ymin=0.0
    ymax=20.0
endif
if gtype eq 'Track' then begin
     xmin=3.8
    xmax=3.5
    ymin=0.0
    ymax=3.0 
endif
endif

if type eq 'm26compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $ 
               'm260w0Td1e2SbRGp2inFsbTjdT','m260w10e5Td1e3SbRGp2inFsbTjdT',$
               'm260w10e5Td6e4SbRGp2inFsbTjdT', 'm260w10e5Td8e4SbRGp2inFsbTjdT', $ 
                'm260w25e6Td1e3SbRGp2inFsbTjdT','m260w50e6Td1e3SbRGp2inFsbTjdT', $
                'm260w75e6Td1e3SbRGp2inFsbTjdT']

    outfile= '2_6compare'
    outtext=''
    textperrun=[ '0kms', '200kms', '300kms' , '250kms', '50kms', '100kms', '150kms']

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.5
    ymin=0.0
    ymax=20.0
endif
if gtype eq 'Track' then begin
     xmin=3.67
    xmax=3.645
    ymin=2.0
    ymax=2.3 
endif
endif
if type eq 'w5compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $ 
                'm200w10e5Td8e4SbRGp2inFsbTjdT', 'm220w10e5Td8e4SbRGp2inFsbTjdT',$ 
                'm240w10e5Td8e4SbRGp2inFsbTjdT', 'm260w10e5Td8e4SbRGp2inFsbTjdT', $
                'm280w10e5Td8e4SbRGp2inFsbTjdT', 'm300w10e5Td8e4SbRGp2inFsbTjdT' $
                ]

    outfile= 'w5compare'
    outtext=''
    textperrun=[  '2.0', '2.2', '2.4', '2.6', '2.8', '3.0']

if gtype eq'RotKms' then begin
    xmin=3.5
    xmax=0.5
    ymin=0.0
    ymax=20.0
endif
if gtype eq 'Track' then begin
     xmin=3.8
    xmax=3.5
    ymin=0.0
    ymax=3.0 
endif
endif

if type eq 'Convzone' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
             'OttoGrid/Ottom85zm100a2RGp2inFsbFjdF',$
             'OttoGrid/Ottom85zm100a2RGp2inFsbFjdFwm20',$ 
             'ZRmod/m220w10e5Td8e4SbRGp2inFsbTjdT','ZRmod/m220w10e5Td8e4SbRGp2inFsbFjdTwm20',$
             'ZRmod/m220w10e5Td8e4SbRGp2inTsbFjdTwm20']           

    outfile= 'Convzone'
    outtext=''
    textperrun=[$
               'Otto No Coupling Post-MS','oncpms_w-2', '22w5','22w5_w-2FFT', '22w5_w-2TFT' $
                 ]
endif

if type eq 'RafaPlot' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
             'YRECgrid/nodiff/testparams/Cali3SbJdSOLnodiff_out2Rot',$
             'YRECgrid/nodiff/nodiff_out2/m100zhm000y264a18al00_nodiff']           

    outfile= '1MsunRotandNot'
    outtext=''
    textperrun=[$
               '', '' $
                 ]
if gtype eq 'Track' then begin
     xmin=3.8
    xmax=3.5
    ymin=-0.5
    ymax=3.0 
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=30
     xmax=-30
     ymin=4.5
     ymax=1.0
endif
if gtype eq 'Deg' then begin
    xmin=12
    xmax=13
    ymin=.01
    ymax=100
endif

endif

if type eq 'checksolaro3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
             'YRECgrid/nodiff/nodiff_out3/m100zhm000y264a18al00_nodifv']           

    outfile= 'checksolaro3'
    outtext=''
    textperrun=[$
               '', '' $
                 ]
if gtype eq 'Track' then begin
     xmin=3.8
    xmax=3.5
    ymin=-0.5
    ymax=3.0 
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=30
     xmax=-30
     ymin=4.5
     ymax=1.0
endif
if gtype eq 'Deg' then begin
    xmin=12
    xmax=13
    ymin=.01
    ymax=100
endif

endif
if type eq 'CZdiffcheck' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
             'OttoGrid/Ottom85zm100a2RGp2inFsbFjdF',$
             'OttoGrid/Ottom85zm100a2RGp2inFsbFjdFwm20',$ 
             'ZRmod/m220w10e5Td8e4SbRGp2inFsbTjdT','ZRmod/m220w10e5Td8e4SbRGp2inFsbFjdTwm20',$
             'ZRmod/m220w10e5Td8e4SbRGp2inTsbFjdTwm20']           

    outfile= 'CZdiffcheck'
    outtext=''
    textperrun=[$
               'Otto No Coupling Post-MS','oncpms_w-2', '22w5','22w5_w-2FFT', '22w5_w-2TFT' $
                 ]
endif

if type eq 'CZdiff25w3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '2_5Mo3FTFw3',$
             '2_5Mo3FFFw3cz0',$ 
             '2_5Mo3FFFw3cz2']           

    outfile= 'CZdiff25w3'
    outtext=''
    textperrun=[$
               'solid', 'cz0', 'cz2' $
                 ]
if gtype eq 'Track' then begin
     xmin=3.8
    xmax=3.5
    ymin=0.5
    ymax=3.0 
endif
endif

if type eq 'CZdiff25678' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
;             '2_5Mo3FTF_1d6','2_5Mo3FTF_1d7','2_5Mo3FTF_1d8',$
;             '2_5Mo3FFFcz0_1d6','2_5Mo3FFFcz0_1d7','2_5Mo3FFFcz0_1d8',$
             ;'2_5Mo3FFFcz2_1d6',
             '2_5Mo3FFFcz0_1d7','2_5Mo3FFFcz0_1d8']           

    outfile= 'CZdiff25678'
    outtext=''
    textperrun=[$
               '6s', '7s','8s','6c0','7c0','8c0', $;'6c2',
               '7c2','8c2' $
                 ]
if gtype eq 'Track' then begin
     xmin=3.8
    xmax=3.5
    ymin=0.5
    ymax=3.0 
endif
if gtype eq 'CoreR' then begin
     xmin=1
    xmax=100
    ymin=600
    ymax=1 
endif

endif
if type eq 'CZdifftest' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/CZdiffRot/CZd_out/'
    infiles=[ $
             'SOLnd2_solidoff500',$
             'SOLnd2_w2off500',$ 
             'SOLnd2_w19off500',$
             'SOLnd2_w0off500','SOLnd2_w01off500']           

    outfile= 'CZdifftest'
    outtext=''
    textperrun=[$
               'solid', 'cz2', 'cz19', 'cz0', 'cz01' $
                 ]
if gtype eq 'Track' then begin
     xmin=3.8
    xmax=3.5
    ymin=-0.5
    ymax=0.5 
endif
endif

if type eq 'CZ25Mbase' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '2_5Mo3FTFw1EoMS','2_5Mo3FTFw1TIP','2_5Mo3FTFw1CLUMP',$
             '2_5Mo3FTFw3EoMS','2_5Mo3FTFw3TIP','2_5Mo3FTFw3CLUMP',$
             '2_5Mo3FTFw6EoMS','2_5Mo3FTFw6TIP','2_5Mo3FTFw6CLUMP']           

    outfile= 'CZ25Mbase'
    outtext=''
    textperrun=[$
               '1EoMS', '1TIP', '1CLUMP','3EoMS', '3TIP', '3CLUMP','6EoMS', '6TIP', '6CLUMP' $
                 ]
if gtype eq 'Track' then begin
     xmin=4.1
    xmax=3.5
    ymin=0.5
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
     xmin=1
    xmax=100
    ymin=600
    ymax=1 
endif
endif
if type eq 'CZ25Mp2' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '2_5Mo3FTFw1', '2_5Mo3FTFw1RGp2FFFcz0', '2_5Mo3FTFw1TIPp2FFFcz0','2_5Mo3FTFw1CLUMPp2FFFcz0',$
              '2_5Mo3FTFw1RGp2FFFcz2', '2_5Mo3FTFw1TIPp2FFFcz2','2_5Mo3FTFw1CLUMPp2FFFcz2',$
             '2_5Mo3FTFw3', '2_5Mo3FTFw3RGp2FFFcz0', '2_5Mo3FTFw3TIPp2FFFcz0','2_5Mo3FTFw3CLUMPp2FFFcz0',$
             '2_5Mo3FTFw3RGp2FFFcz2', '2_5Mo3FTFw3TIPp2FFFcz2','2_5Mo3FTFw3CLUMPp2FFFcz2',$
             '2_5Mo3FTFw6', '2_5Mo3FTFw6RGp2FFFcz0', '2_5Mo3FTFw6TIPp2FFFcz0','2_5Mo3FTFw6CLUMPp2FFFcz0',$
              '2_5Mo3FTFw6RGp2FFFcz2', '2_5Mo3FTFw6TIPp2FFFcz2','2_5Mo3FTFw6CLUMPp2FFFcz2']           

    outfile= 'CZ25Mp2'
    outtext=''
    textperrun=[$
               '1SB', '1EoMScz0', '1TIPcz0', '1CLUMPcz0', '1EoMScz2', '1TIPcz2', '1CLUMPcz2',$
               '3SB', '3EoMScz0', '3TIPcz0', '3CLUMPcz0', '3EoMScz2', '3TIPcz2', '3CLUMPcz2',$
               '6SB', '6EoMScz0', '6TIPcz0', '6CLUMPcz0', '6EoMScz2', '6TIPcz2', '6CLUMPcz2'$
                 ]
if gtype eq 'Track' then begin
     xmin=4.1
    xmax=3.5
    ymin=0.5
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=5 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif

if type eq 'CZ25Mp2STOP' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/450t/'
    infiles=[ $
;             '2_5Mo3FTFw1', '2_5Mo3FTFw1RGp2FFFcz0', '2_5Mo3FTFw1TIPp2FFFcz0','2_5Mo3FTFw1CLUMPp2FFFcz0',$
;              '2_5Mo3FTFw1RGp2FFFcz2', '2_5Mo3FTFw1TIPp2FFFcz2','2_5Mo3FTFw1CLUMPp2FFFcz2',$
;             '2_5Mo3FTFw3', '2_5Mo3FTFw3RGp2FFFcz0', '2_5Mo3FTFw3TIPp2FFFcz0','2_5Mo3FTFw3CLUMPp2FFFcz0',$
;             '2_5Mo3FTFw3RGp2FFFcz2', 
;             '2_5Mo3FTFw3TIPp2FFFcz2STOP','2_5Mo3FTFw3CLUMPp2FFFcz2STOP'$;,$
;             '2_5Mo3FTFw6', '2_5Mo3FTFw6RGp2FFFcz0', '2_5Mo3FTFw6TIPp2FFFcz0','2_5Mo3FTFw6CLUMPp2FFFcz0',$
;              '2_5Mo3FTFw6RGp2FFFcz2', '2_5Mo3FTFw6TIPp2FFFcz2','2_5Mo3FTFw6CLUMPp2FFFcz2' $
              '2_5Mo3FTFw3CLUMPp2FFFSTOPI3cz1', '2_5Mo3FTFw3CLUMPp2FFFSTOPI3','2_5Mo3FTFw3CLUMPp2FFFSTOPI3cz2' $ 
             ]           

    outfile= 'CZ25Mp2STOPb'
    outtext=''
    textperrun=[$
                ' ', ' ', ' '$
;               '1SB', '1EoMScz0', '1TIPcz0', '1CLUMPcz0', '1EoMScz2', '1TIPcz2', '1CLUMPcz2',$
;               '3SB', '3EoMScz0', '3TIPcz0', '3CLUMPcz0', '3EoMScz2', 
;               '3TIPcz2', '3CLUMPcz2'$;,$
;               '6SB', '6EoMScz0', '6TIPcz0', '6CLUMPcz0', '6EoMScz2', '6TIPcz2', '6CLUMPcz2'$
                 ]
if gtype eq 'Track' then begin
     xmin=4.1
    xmax=3.5
    ymin=0.5
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=5 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
if gtype eq'RotLayers' then begin
    xmin=0.001
    xmax=1.0
    ymin=3e-8
    ymax=1e-6
endif
endif

if type eq 'CZ25Mp2STOPt23' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '442t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '442t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '442t/2_5Mo3FTFw3CLUMPp2FFFcz0STOP', '442t/2_5Mo3FTFw3CLUMPp2TFFSTOP', $
             '442t/2_5Mo3FTFw3CLUMPp2FTFSTOP', '442t/2_5Mo3FTFw3CLUMPp2FFTSTOP' , $
             '443t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '443t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '443t/2_5Mo3FTFw3CLUMPp2FFFcz0STOP', '443t/2_5Mo3FTFw3CLUMPp2TFFSTOP', $
             '443t/2_5Mo3FTFw3CLUMPp2FTFSTOP', '443t/2_5Mo3FTFw3CLUMPp2FFTSTOP' $
              ]           

    outfile= 'CZ25Mp2STOP'
    outtext=''
    textperrun=[$
                 '2cz2', '2cz1', '2cz0', '2In', '2SB', '2JD', $
                 '3cz2', '3cz1', '3cz0', '3In', '3SB', '3JD' $
                 ]
if gtype eq 'Track' then begin
     xmin=4.1
    xmax=3.5
    ymin=0.5
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=5 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
endif
if type eq 'CZ25Mp2STOPt23cz2' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '442t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', $
             '443t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP' $
              ]           

    outfile= 'CZ25Mp2STOPt23cz2'
    outtext=''
    textperrun=[$
                 '2cz2',  $
                 '3cz2' $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
endif

if type eq 'CZ25Mp2STOPt34' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '444t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '444t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '444t/2_5Mo3FTFw3CLUMPp2FFFcz0STOP', '444t/2_5Mo3FTFw3CLUMPp2TFFSTOP', $
             '444t/2_5Mo3FTFw3CLUMPp2FTFSTOP', '444t/2_5Mo3FTFw3CLUMPp2FFTSTOP' , $
             '443t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '443t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '443t/2_5Mo3FTFw3CLUMPp2FFFcz0STOP', '443t/2_5Mo3FTFw3CLUMPp2TFFSTOP', $
             '443t/2_5Mo3FTFw3CLUMPp2FTFSTOP', '443t/2_5Mo3FTFw3CLUMPp2FFTSTOP' $
              ]           

    outfile= 'CZ25Mp2STOPt34'
    outtext=''
    textperrun=[$
                 '4cz2', '4cz1', '4cz0', '4In', '4SB', '4JD', $
                 '3cz2', '3cz1', '3cz0', '3In', '3SB', '3JD' $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
endif
if type eq 'CZ25Mp2STOPt5sb' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '445t/2_5Mo3FTFw3CLUMPp2FTFSTOPI1', $
             '445t/2_5Mo3FTFw3CLUMPp2FTFSTOP' $
              ]           

    outfile= 'CZ25Mp2STOPt23cz2'
    outtext=''
    textperrun=[$
                 'I1',  $
                 'SB' $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
endif
if type eq 'CZ25Mp2STOPt6sb' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '446t/2_5Mo3FTFw3CLUMPp2FFFSTOPI1', $
             '446t/2_5Mo3FTFw3CLUMPp2FTFSTOP' $
              ]           

    outfile= 'CZ25Mp2STOPt6sb'
    outtext=''
    textperrun=[$
                 'I1',  $
                 'SB' $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
endif
if type eq 'CZ25Mp2STOPt7' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '444t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '444t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '444t/2_5Mo3FTFw3CLUMPp2FFFcz0STOP', $
             '444t/2_5Mo3FTFw3CLUMPp2FTFSTOP',  $
             '447t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '447t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '447t/2_5Mo3FTFw3CLUMPp2FFFSTOPI0', $
             '447t/2_5Mo3FTFw3CLUMPp2FFFSTOPI1', '447t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2' $
              ]           

    outfile= 'CZ25Mp2STOPt7'
    outtext=''
    textperrun=[$
                 '4cz2', '4cz1', '4cz0', '4SB', $
                 '7cz2', '7cz1', '3I0', '7I1', '7I2' $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=0
     ymax=100
endif
endif
if type eq 'CZ25Mp2STOPt8' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '447t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '447t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '447t/2_5Mo3FTFw3CLUMPp2FFFSTOPI0', $
             '447t/2_5Mo3FTFw3CLUMPp2FFFSTOPI1', '447t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2', $
             '448t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '448t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '448t/2_5Mo3FTFw3CLUMPp2FFFSTOPI0', '448t/2_5Mo3FTFw3CLUMPp2FFFSTOPI3',$
             '448t/2_5Mo3FTFw3CLUMPp2FFFSTOPI1', '448t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2' $
              ]           

    outfile= 'CZ25Mp2STOPt7'
    outtext=''
    textperrun=[$
                 '7cz2', '7cz1', '7I0', '7I1', '7I2', $
                 '8cz2', '8cz1', '8I0','8I3', '8I1', '8I2' $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
endif

if type eq 'CZ25Mp2STOPt8I2' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '448t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2' $
              ]           

    outfile= 'CZ25Mp2STOPt8I2'
    outtext=''
    textperrun=[$
                  '8I2' $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=5e-8
     ymax=1e-3
endif
endif
if type eq 'CZ25Mp2STOPt9I3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI3cz2', '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2cz2' $
              ]           

    outfile= 'CZ25Mp2STOPt9I3cz2'
    outtext=''
    textperrun=[$
                  '9I3cz2', '9I2cz2' $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
endif
if type eq 'CZ25Mp2STOPt0I3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '2_5Mo3FTFw3','450t/2_5Mo3FTFw3CLUMPp2FFFSTOPI3cz2', '450t/2_5Mo3FTFw3CLUMPp2FFFSTOPI3', '450t/2_5Mo3FTFw3CLUMPp2FFFSTOPI3cz1', $
             '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2cz2', '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2', '450t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2cz1' $
              ]           

    outfile= 'CZ25Mp2STOPt0I3cz2'
    outtext=''
    textperrun=[$
                  'SB','I3cz2', 'I3', 'I3cz1','I2cz2', 'I2', 'I2cz1'  $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=10 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif

endif


if type eq 'CZ25Mp2STOPt9' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
             '447t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '447t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '447t/2_5Mo3FTFw3CLUMPp2FFFSTOPI0', $
             '447t/2_5Mo3FTFw3CLUMPp2FFFSTOPI1', '447t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2', $
             '449t/2_5Mo3FTFw3CLUMPp2FFFcz2STOP', '449t/2_5Mo3FTFw3CLUMPp2FFFcz1STOP', $
             '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI0', '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI3',$
             '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI1', '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2', $
             '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI3cz2', '449t/2_5Mo3FTFw3CLUMPp2FFFSTOPI2cz2' $
              ]           

    outfile= 'CZ25Mp2STOPt7'
    outtext=''
    textperrun=[$
                 '7cz2', '7cz1', '7I0', '7I1', '7I2', $
                 '9cz2', '9cz1', '9I0','9I3', '9I1', '9I2', '9I3cz2', '9I2cz2' $
                 ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
endif
if type eq 'CZ25MallIs' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
$;             '2_5Mo3FTFw1CLUMPp2FFFI0cz0', '2_5Mo3FTFw1CLUMPp2FFFI0cz1', '2_5Mo3FTFw1CLUMPp2FFFI0cz2', '2_5Mo3FTFw1CLUMPp2FFFI2cz0', '2_5Mo3FTFw1CLUMPp2FFFI2cz1', '2_5Mo3FTFw1CLUMPp2FFFI2cz2', '2_5Mo3FTFw1CLUMPp2FFFI3cz0', '2_5Mo3FTFw1CLUMPp2FFFI3cz1', '2_5Mo3FTFw1CLUMPp2FFFI3cz2', '2_5Mo3FTFw1RGp2FFFI0cz0', '2_5Mo3FTFw1RGp2FFFI0cz1', '2_5Mo3FTFw1RGp2FFFI0cz2', '2_5Mo3FTFw1RGp2FFFI2cz0', '2_5Mo3FTFw1RGp2FFFI2cz1', '2_5Mo3FTFw1RGp2FFFI2cz2', '2_5Mo3FTFw1RGp2FFFI3cz0', '2_5Mo3FTFw1RGp2FFFI3cz1', '2_5Mo3FTFw1RGp2FFFI3cz2', '2_5Mo3FTFw1TIPp2FFFI0cz0', '2_5Mo3FTFw1TIPp2FFFI0cz1', '2_5Mo3FTFw1TIPp2FFFI0cz2', '2_5Mo3FTFw1TIPp2FFFI2cz0', '2_5Mo3FTFw1TIPp2FFFI2cz1', '2_5Mo3FTFw1TIPp2FFFI2cz2', '2_5Mo3FTFw1TIPp2FFFI3cz0', '2_5Mo3FTFw1TIPp2FFFI3cz1', '2_5Mo3FTFw1TIPp2FFFI3cz2', '2_5Mo3FTFw3CLUMPp2FFFI0cz0', '2_5Mo3FTFw3CLUMPp2FFFI0cz1', '2_5Mo3FTFw3CLUMPp2FFFI0cz2', '2_5Mo3FTFw3CLUMPp2FFFI2cz0', '2_5Mo3FTFw3CLUMPp2FFFI2cz1', '2_5Mo3FTFw3CLUMPp2FFFI2cz2', '2_5Mo3FTFw3CLUMPp2FFFI3cz0', '2_5Mo3FTFw3CLUMPp2FFFI3cz1', '2_5Mo3FTFw3CLUMPp2FFFI3cz2', '2_5Mo3FTFw3RGp2FFFI0cz0', '2_5Mo3FTFw3RGp2FFFI0cz1', '2_5Mo3FTFw3RGp2FFFI0cz2', '2_5Mo3FTFw3RGp2FFFI2cz0', '2_5Mo3FTFw3RGp2FFFI2cz1', '2_5Mo3FTFw3RGp2FFFI2cz2', '2_5Mo3FTFw3RGp2FFFI3cz0', '2_5Mo3FTFw3RGp2FFFI3cz1', '2_5Mo3FTFw3RGp2FFFI3cz2', '2_5Mo3FTFw3TIPp2FFFI0cz0', '2_5Mo3FTFw3TIPp2FFFI0cz1', '2_5Mo3FTFw3TIPp2FFFI0cz2', '2_5Mo3FTFw3TIPp2FFFI2cz0', '2_5Mo3FTFw3TIPp2FFFI2cz1', '2_5Mo3FTFw3TIPp2FFFI2cz2', '2_5Mo3FTFw3TIPp2FFFI3cz0', '2_5Mo3FTFw3TIPp2FFFI3cz1', '2_5Mo3FTFw3TIPp2FFFI3cz2', '2_5Mo3FTFw6CLUMPp2FFFI0cz0', '2_5Mo3FTFw6CLUMPp2FFFI0cz1', '2_5Mo3FTFw6CLUMPp2FFFI0cz2', '2_5Mo3FTFw6CLUMPp2FFFI2cz0', '2_5Mo3FTFw6CLUMPp2FFFI2cz1', '2_5Mo3FTFw6CLUMPp2FFFI2cz2', '2_5Mo3FTFw6CLUMPp2FFFI3cz0', '2_5Mo3FTFw6CLUMPp2FFFI3cz1', '2_5Mo3FTFw6CLUMPp2FFFI3cz2', '2_5Mo3FTFw6RGp2FFFI0cz0', '2_5Mo3FTFw6RGp2FFFI0cz1', '2_5Mo3FTFw6RGp2FFFI0cz2', '2_5Mo3FTFw6RGp2FFFI2cz0',
 '2_5Mo3FTFw6RGp2FFFI2cz1', '2_5Mo3FTFw6RGp2FFFI2cz2', '2_5Mo3FTFw6RGp2FFFI3cz0', '2_5Mo3FTFw6RGp2FFFI3cz1', '2_5Mo3FTFw6RGp2FFFI3cz2', '2_5Mo3FTFw6TIPp2FFFI0cz0', '2_5Mo3FTFw6TIPp2FFFI0cz1', '2_5Mo3FTFw6TIPp2FFFI0cz2', '2_5Mo3FTFw6TIPp2FFFI2cz0', '2_5Mo3FTFw6TIPp2FFFI2cz1', '2_5Mo3FTFw6TIPp2FFFI2cz2', '2_5Mo3FTFw6TIPp2FFFI3cz0', '2_5Mo3FTFw6TIPp2FFFI3cz1', '2_5Mo3FTFw6TIPp2FFFI3cz2']           

    outfile= 'CZ25MallIs'
    outtext=''
    textperrun=[$
$;'2_5Mo3FTFw1CLUMPp2FFFI0cz0', '2_5Mo3FTFw1CLUMPp2FFFI0cz1', '2_5Mo3FTFw1CLUMPp2FFFI0cz2', '2_5Mo3FTFw1CLUMPp2FFFI2cz0', '2_5Mo3FTFw1CLUMPp2FFFI2cz1', '2_5Mo3FTFw1CLUMPp2FFFI2cz2', '2_5Mo3FTFw1CLUMPp2FFFI3cz0', '2_5Mo3FTFw1CLUMPp2FFFI3cz1', '2_5Mo3FTFw1CLUMPp2FFFI3cz2', '2_5Mo3FTFw1RGp2FFFI0cz0', '2_5Mo3FTFw1RGp2FFFI0cz1', '2_5Mo3FTFw1RGp2FFFI0cz2', '2_5Mo3FTFw1RGp2FFFI2cz0', '2_5Mo3FTFw1RGp2FFFI2cz1', '2_5Mo3FTFw1RGp2FFFI2cz2', '2_5Mo3FTFw1RGp2FFFI3cz0', '2_5Mo3FTFw1RGp2FFFI3cz1', '2_5Mo3FTFw1RGp2FFFI3cz2', '2_5Mo3FTFw1TIPp2FFFI0cz0', '2_5Mo3FTFw1TIPp2FFFI0cz1', '2_5Mo3FTFw1TIPp2FFFI0cz2', '2_5Mo3FTFw1TIPp2FFFI2cz0', '2_5Mo3FTFw1TIPp2FFFI2cz1', '2_5Mo3FTFw1TIPp2FFFI2cz2', '2_5Mo3FTFw1TIPp2FFFI3cz0', '2_5Mo3FTFw1TIPp2FFFI3cz1', '2_5Mo3FTFw1TIPp2FFFI3cz2', '2_5Mo3FTFw3CLUMPp2FFFI0cz0', '2_5Mo3FTFw3CLUMPp2FFFI0cz1', '2_5Mo3FTFw3CLUMPp2FFFI0cz2', '2_5Mo3FTFw3CLUMPp2FFFI2cz0', '2_5Mo3FTFw3CLUMPp2FFFI2cz1', '2_5Mo3FTFw3CLUMPp2FFFI2cz2', '2_5Mo3FTFw3CLUMPp2FFFI3cz0', '2_5Mo3FTFw3CLUMPp2FFFI3cz1', '2_5Mo3FTFw3CLUMPp2FFFI3cz2', '2_5Mo3FTFw3RGp2FFFI0cz0', '2_5Mo3FTFw3RGp2FFFI0cz1', '2_5Mo3FTFw3RGp2FFFI0cz2', '2_5Mo3FTFw3RGp2FFFI2cz0', '2_5Mo3FTFw3RGp2FFFI2cz1', '2_5Mo3FTFw3RGp2FFFI2cz2', '2_5Mo3FTFw3RGp2FFFI3cz0', '2_5Mo3FTFw3RGp2FFFI3cz1', '2_5Mo3FTFw3RGp2FFFI3cz2', '2_5Mo3FTFw3TIPp2FFFI0cz0', '2_5Mo3FTFw3TIPp2FFFI0cz1', '2_5Mo3FTFw3TIPp2FFFI0cz2', '2_5Mo3FTFw3TIPp2FFFI2cz0', '2_5Mo3FTFw3TIPp2FFFI2cz1', '2_5Mo3FTFw3TIPp2FFFI2cz2', '2_5Mo3FTFw3TIPp2FFFI3cz0', '2_5Mo3FTFw3TIPp2FFFI3cz1', '2_5Mo3FTFw3TIPp2FFFI3cz2', '2_5Mo3FTFw6CLUMPp2FFFI0cz0', '2_5Mo3FTFw6CLUMPp2FFFI0cz1', '2_5Mo3FTFw6CLUMPp2FFFI0cz2', '2_5Mo3FTFw6CLUMPp2FFFI2cz0', '2_5Mo3FTFw6CLUMPp2FFFI2cz1', '2_5Mo3FTFw6CLUMPp2FFFI2cz2', '2_5Mo3FTFw6CLUMPp2FFFI3cz0', '2_5Mo3FTFw6CLUMPp2FFFI3cz1', '2_5Mo3FTFw6CLUMPp2FFFI3cz2', '2_5Mo3FTFw6RGp2FFFI0cz0', '2_5Mo3FTFw6RGp2FFFI0cz1', '2_5Mo3FTFw6RGp2FFFI0cz2', '2_5Mo3FTFw6RGp2FFFI2cz0', ;
'2_5Mo3FTFw6RGp2FFFI2cz1', '2_5Mo3FTFw6RGp2FFFI2cz2', '2_5Mo3FTFw6RGp2FFFI3cz0', '2_5Mo3FTFw6RGp2FFFI3cz1', '2_5Mo3FTFw6RGp2FFFI3cz2', '2_5Mo3FTFw6TIPp2FFFI0cz0', '2_5Mo3FTFw6TIPp2FFFI0cz1', '2_5Mo3FTFw6TIPp2FFFI0cz2', '2_5Mo3FTFw6TIPp2FFFI2cz0', '2_5Mo3FTFw6TIPp2FFFI2cz1', '2_5Mo3FTFw6TIPp2FFFI2cz2', '2_5Mo3FTFw6TIPp2FFFI3cz0', '2_5Mo3FTFw6TIPp2FFFI3cz1', '2_5Mo3FTFw6TIPp2FFFI3cz2']

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=10 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif

endif

if type eq 'CZ25Mallstarts' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
            '2_5Mo3FTFw1EoMS','2_5Mo3FTFw3EoMS','2_5Mo3FTFw6EoMS' ]           

    outfile= 'CZ25Mallstarts'
    outtext=''
    textperrun=[$
 $
                '2_5Mo3FTFw1EoMS','2_5Mo3FTFw3EoMS','2_5Mo3FTFw6EoMS' ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=10 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif

endif

if type eq 'CZ25MallI3s' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
 '2_5Mo3FTFw1CLUMPp2FFFI3cz0', '2_5Mo3FTFw1CLUMPp2FFFI3cz1', '2_5Mo3FTFw1CLUMPp2FFFI3cz2', '2_5Mo3FTFw1RGp2FFFI3cz0', '2_5Mo3FTFw1RGp2FFFI3cz1', '2_5Mo3FTFw1RGp2FFFI3cz2', '2_5Mo3FTFw1TIPp2FFFI3cz0', '2_5Mo3FTFw1TIPp2FFFI3cz1', '2_5Mo3FTFw1TIPp2FFFI3cz2',  '2_5Mo3FTFw3CLUMPp2FFFI3cz0', '2_5Mo3FTFw3CLUMPp2FFFI3cz1', '2_5Mo3FTFw3CLUMPp2FFFI3cz2', '2_5Mo3FTFw3RGp2FFFI3cz0', '2_5Mo3FTFw3RGp2FFFI3cz1', '2_5Mo3FTFw3RGp2FFFI3cz2',  '2_5Mo3FTFw3TIPp2FFFI3cz0', '2_5Mo3FTFw3TIPp2FFFI3cz1', '2_5Mo3FTFw3TIPp2FFFI3cz2',  '2_5Mo3FTFw6CLUMPp2FFFI3cz0', '2_5Mo3FTFw6CLUMPp2FFFI3cz1', '2_5Mo3FTFw6CLUMPp2FFFI3cz2', '2_5Mo3FTFw6RGp2FFFI3cz0', '2_5Mo3FTFw6RGp2FFFI3cz1', '2_5Mo3FTFw6RGp2FFFI3cz2',  '2_5Mo3FTFw6TIPp2FFFI3cz0', '2_5Mo3FTFw6TIPp2FFFI3cz1', '2_5Mo3FTFw6TIPp2FFFI3cz2']           

    outfile= 'CZ25MallI3s'
    outtext=''
    textperrun=[$ 
'2_5Mo3FTFw1CLUMPp2FFFI3cz0', '2_5Mo3FTFw1CLUMPp2FFFI3cz1', '2_5Mo3FTFw1CLUMPp2FFFI3cz2', '2_5Mo3FTFw1RGp2FFFI3cz0', '2_5Mo3FTFw1RGp2FFFI3cz1', '2_5Mo3FTFw1RGp2FFFI3cz2', '2_5Mo3FTFw1TIPp2FFFI3cz0', '2_5Mo3FTFw1TIPp2FFFI3cz1', '2_5Mo3FTFw1TIPp2FFFI3cz2',  '2_5Mo3FTFw3CLUMPp2FFFI3cz0', '2_5Mo3FTFw3CLUMPp2FFFI3cz1', '2_5Mo3FTFw3CLUMPp2FFFI3cz2', '2_5Mo3FTFw3RGp2FFFI3cz0', '2_5Mo3FTFw3RGp2FFFI3cz1', '2_5Mo3FTFw3RGp2FFFI3cz2',  '2_5Mo3FTFw3TIPp2FFFI3cz0', '2_5Mo3FTFw3TIPp2FFFI3cz1', '2_5Mo3FTFw3TIPp2FFFI3cz2',  '2_5Mo3FTFw6CLUMPp2FFFI3cz0', '2_5Mo3FTFw6CLUMPp2FFFI3cz1', '2_5Mo3FTFw6CLUMPp2FFFI3cz2', '2_5Mo3FTFw6RGp2FFFI3cz0', '2_5Mo3FTFw6RGp2FFFI3cz1', '2_5Mo3FTFw6RGp2FFFI3cz2',  '2_5Mo3FTFw6TIPp2FFFI3cz0', '2_5Mo3FTFw6TIPp2FFFI3cz1', '2_5Mo3FTFw6TIPp2FFFI3cz2']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=10 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif

endif

if type eq 'CZ25MI3compstart' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
  '2_5Mo3FTFw6CLUMPp2FFFI3cz0', '2_5Mo3FTFw6CLUMPp2FFFI3cz1', '2_5Mo3FTFw6CLUMPp2FFFI3cz2', '2_5Mo3FTFw6RGp2FFFI3cz0', '2_5Mo3FTFw6RGp2FFFI3cz1', '2_5Mo3FTFw6RGp2FFFI3cz2',  '2_5Mo3FTFw6TIPp2FFFI3cz0', '2_5Mo3FTFw6TIPp2FFFI3cz1', '2_5Mo3FTFw6TIPp2FFFI3cz2']           

    outfile= 'CZ25MI3compstart'
    outtext=''
    textperrun=[$ 
  '2_5Mo3FTFw6CLUMPp2FFFI3cz0', '2_5Mo3FTFw6CLUMPp2FFFI3cz1', '2_5Mo3FTFw6CLUMPp2FFFI3cz2', '2_5Mo3FTFw6RGp2FFFI3cz0', '2_5Mo3FTFw6RGp2FFFI3cz1', '2_5Mo3FTFw6RGp2FFFI3cz2',  '2_5Mo3FTFw6TIPp2FFFI3cz0', '2_5Mo3FTFw6TIPp2FFFI3cz1', '2_5Mo3FTFw6TIPp2FFFI3cz2']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.5
    xmax=2.0
    ymin=0.1
    ymax=30 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif

endif


if type eq '50tcheck' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
            'Ottom85zm100a2RGp2FFFI3cz2' ]           

    outfile= '50tcheck'
    outtext=''
    textperrun=[$
 $
                'I3' ]

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-9
     ymax=1e-7
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=10 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
if gtype eq 'Track' then begin
     xmin=3.8
    xmax=3.5
    ymin=0.0
    ymax=3.0 
endif
endif

if type eq 'CZ25MTIPI3s' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
'2_5Mo3FTFw1TIPp2FFFI3cz0', '2_5Mo3FTFw1TIPp2FFFI3cz1', '2_5Mo3FTFw1TIPp2FFFI3cz2',  '2_5Mo3FTFw3TIPp2FFFI3cz0', '2_5Mo3FTFw3TIPp2FFFI3cz1', '2_5Mo3FTFw3TIPp2FFFI3cz2',   '2_5Mo3FTFw6TIPp2FFFI3cz0', '2_5Mo3FTFw6TIPp2FFFI3cz1', '2_5Mo3FTFw6TIPp2FFFI3cz2']           

    outfile= 'CZ25MTIPI3s'
    outtext=''
    textperrun=[$ 
'2_5Mo3FTFw1TIPp2FFFI3cz0', '2_5Mo3FTFw1TIPp2FFFI3cz1', '2_5Mo3FTFw1TIPp2FFFI3cz2',   '2_5Mo3FTFw3TIPp2FFFI3cz0', '2_5Mo3FTFw3TIPp2FFFI3cz1', '2_5Mo3FTFw3TIPp2FFFI3cz2',  '2_5Mo3FTFw6TIPp2FFFI3cz0', '2_5Mo3FTFw6TIPp2FFFI3cz1', '2_5Mo3FTFw6TIPp2FFFI3cz2']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=10 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.5
    ymax=50
endif

endif

if type eq 'CZ25MTIPI3cz0s' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/M2_5w/'
    infiles=[ $
'2_5Mo3FTFw1TIPp2FFFI3cz0', '2_5Mo3FTFw3TIPp2FFFI3cz0',  '2_5Mo3FTFw6TIPp2FFFI3cz0']           

    outfile= 'CZ25MTIPI3cz0s'
    outtext=''
    textperrun=[$ 
'2_5Mo3FTFw1TIPp2FFFI3cz0',  '2_5Mo3FTFw3TIPp2FFFI3cz0',   '2_5Mo3FTFw6TIPp2FFFI3cz0']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif
if gtype eq 'CoreR' then begin
     xmin=8
    xmax=13
    ymin=300
    ymax=3 
endif
if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.5
    ymin=0.1
    ymax=30 
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.5
    ymax=50
endif

endif

if type eq 'm20o3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'2_0Mo3FTFw1', '2_0Mo3FTFw2',  '2_0Mo3FTFw3','2_0Mo3FTFw4','2_0Mo3FTFw5','2_0Mo3FTFw6']           

    outfile= 'm20o3'
    outtext=''
    textperrun=[$ 
'w1',  'w2',  'w3','w4','w5','w6']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif

if gtype eq 'RotKms' then begin
     xmin=3.2
    xmax=2.5
    ymin=0.0
    ymax=30 
endif
if gtype eq'RotRatio' then begin
    xmin=3.20
    xmax=2.5
    ymin=0.5
    ymax=50
endif

endif

if type eq 'm22o3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'2_2Mo3FTFw1', '2_2Mo3FTFw2',  '2_2Mo3FTFw3','2_2Mo3FTFw4','2_2Mo3FTFw5','2_2Mo3FTFw6']           

    outfile= 'm22o3'
    outtext=''
    textperrun=[$ 
'w1',  'w2',  'w3','w4','w5','w6']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif

if gtype eq 'RotKms' then begin
     xmin=3.2
    xmax=2.5
    ymin=0.0
    ymax=30 
endif
if gtype eq'RotRatio' then begin
    xmin=3.20
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif

endif

if type eq 'm24o3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'2_4Mo3FTFw1', '2_4Mo3FTFw2',  '2_4Mo3FTFw3','2_4Mo3FTFw4','2_4Mo3FTFw5','2_4Mo3FTFw6']           

    outfile= 'm24o3'
    outtext=''
    textperrun=[$ 
'w1',  'w2',  'w3','w4','w5','w6']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif

if gtype eq 'RotKms' then begin
     xmin=3.2
    xmax=2.5
    ymin=0.0
    ymax=30 
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif

endif
if type eq 'm26o3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'2_6Mo3FTFw1', '2_6Mo3FTFw2',  '2_6Mo3FTFw3','2_6Mo3FTFw4','2_6Mo3FTFw5','2_6Mo3FTFw6']           

    outfile= 'm26o3'
    outtext=''
    textperrun=[$ 
'w1',  'w2',  'w3','w4','w5','w6']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif

if gtype eq 'RotKms' then begin
     xmin=3.2
    xmax=2.5
    ymin=0.0
    ymax=30 
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif

endif

if type eq 'm28o3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'2_8Mo3FTFw1', '2_8Mo3FTFw2',  '2_8Mo3FTFw3','2_8Mo3FTFw4','2_8Mo3FTFw5','2_8Mo3FTFw6']           

    outfile= 'm28o3'
    outtext=''
    textperrun=[$ 
'w1',  'w2',  'w3','w4','w5','w6']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif

if gtype eq 'RotKms' then begin
     xmin=3.2
    xmax=2.5
    ymin=0.0
    ymax=30 
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif

endif

if type eq 'm30o3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'3_0Mo3FTFw1', '3_0Mo3FTFw2',  '3_0Mo3FTFw3','3_0Mo3FTFw4','3_0Mo3FTFw5','3_0Mo3FTFw6']           

    outfile= 'm30o3'
    outtext=''
    textperrun=[$ 
'w1',  'w2',  'w3','w4','w5','w6']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif

if gtype eq 'RotKms' then begin
     xmin=5.0
    xmax=2.5
    ymin=0.0
    ymax=330 
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif

endif

if type eq 'm24m30o3' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'2_4Mo3FTFw1',   '2_4Mo3FTFw3','2_4Mo3FTFw6','3_0Mo3FTFw1',   '3_0Mo3FTFw4','3_0Mo3FTFw6']           

    outfile= 'm24m30o3'
    outtext=''
    textperrun=[$ 
'24w1',  '24w3',  '24w6','30w1','30w4','30w6']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif

if gtype eq 'RotKms' then begin
     xmin=3.2
    xmax=2.5
    ymin=0.0
    ymax=30 
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif

if type eq 'm22to24' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'2_2Mo3FTFw1','2_25Mo3FTFw6','2_3Mo3FTFw1','2_35Mo3FTFw1','2_4Mo3FTFw1']           

    outfile= 'm22to24'
    outtext=''
    textperrun=[$ 
'2_2', '2_25', '2_3', '2_35', '2_4']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=5e-8
     ymax=1e-5
endif

if gtype eq 'RotKms' then begin
     xmin=5.0
    xmax=2.5
    ymin=0.0
    ymax=330 
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=3.8;3.7
    xmax=3.5;3.63
    ymin=0.7;1.8
    ymax=3.0;2.5
endif
if gtype eq'Deg' then begin
    xmin=0.5
    xmax=1.0
    ymin=0.01
    ymax=100
endif
endif

if type eq 'i3cz2jdotcheck' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'2_4Mo3FTFw1RGp2inFsbTjdT',   '2_4Mo3FTFw1RGp2FFT','2_4Mo3FTFw1RGp2FFF','2_4Mo3FTFw1RGp2FFFI3cz2',   '2_4Mo3FTFw1RGp2FFTI3cz2']           

    outfile= 'i3cz2jdotcheck'
    outtext=''
    textperrun=[$ 
'FTT',  'FFT',  'FFF','FFFI3cz2','FFTI3cz2']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=3.8
    ymin=45
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif


if type eq 'i3czjdotcheck' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
'2_4Mo3FTFw6RGp2FFTI3cz00',  '2_4Mo3FTFw6RGp2FFTI3cz05','2_4Mo3FTFw6RGp2FFTI3cz10','2_4Mo3FTFw6RGp2FFTI3cz15','2_4Mo3FTFw6RGp2FFTI3cz20']           
;print, outfile
    outfile= 'i3czjdotcheck'
    outtext=''
    textperrun=[$ 
'00', '05', '10', '15', '20']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif

if type eq 'i3cz0jdot' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw1RGp2FFTI3cz00', '2_4Mo3FTFw2RGp2FFTI3cz00','2_4Mo3FTFw3RGp2FFTI3cz00',$
     '2_4Mo3FTFw4RGp2FFTI3cz00','2_4Mo3FTFw5RGp2FFTI3cz00','2_4Mo3FTFw6RGp2FFTI3cz00', $
     '2_6Mo3FTFw1RGp2FFTI3cz00', '2_6Mo3FTFw2RGp2FFTI3cz00','2_6Mo3FTFw3RGp2FFTI3cz00',$
     '2_6Mo3FTFw4RGp2FFTI3cz00','2_6Mo3FTFw5RGp2FFTI3cz00','2_6Mo3FTFw6RGp2FFTI3cz00', $
     '2_8Mo3FTFw1RGp2FFTI3cz00', '2_8Mo3FTFw2RGp2FFTI3cz00','2_8Mo3FTFw3RGp2FFTI3cz00',$
     '2_8Mo3FTFw4RGp2FFTI3cz00','2_8Mo3FTFw5RGp2FFTI3cz00','2_8Mo3FTFw6RGp2FFTI3cz00', $
     '3_0Mo3FTFw1RGp2FFTI3cz00', '3_0Mo3FTFw2RGp2FFTI3cz00','3_0Mo3FTFw3RGp2FFTI3cz00',$
     '3_0Mo3FTFw4RGp2FFTI3cz00','3_0Mo3FTFw5RGp2FFTI3cz00','3_0Mo3FTFw6RGp2FFTI3cz00' $
]           
;print, outfile
    outfile= 'i3cz0jdot'
    outtext=''
    textperrun=[$ 
'2_4w1', '2_4w2', '2_4w3', '2_4w4', '2_4w5', '2_4w6', $
'2_6w1', '2_6w2', '2_6w3', '2_6w4', '2_6w5', '2_6w6', $
'2_8w1', '2_8w2', '2_8w3', '2_8w4', '2_8w5', '2_8w6', $
'3_0w1', '3_0w2', '3_0w3', '3_0w4', '3_0w5', '3_0w6' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif

if type eq 'i3cz0compare' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw1RGp2FFTI3cz00', '2_4Mo3FTFw2RGp2FFTI3cz00','2_4Mo3FTFw3RGp2FFTI3cz00',$
     '2_4Mo3FTFw4RGp2FFTI3cz00','2_4Mo3FTFw5RGp2FFTI3cz00','2_4Mo3FTFw6RGp2FFTI3cz00', $
    '2_4Mo3FTFw1', '2_4Mo3FTFw2','2_4Mo3FTFw3',$
     '2_4Mo3FTFw4','2_4Mo3FTFw5','2_4Mo3FTFw6']           
;print, outfile
    outfile= 'i3cz0jdot'
    outtext=''
    textperrun=[$ 
'2_4w1T', '2_4w2T', '2_4w3T', '2_4w4T', '2_4w5T', '2_4w6T', $
'2_4w1F', '2_4w2F', '2_4w3F', '2_4w4F', '2_4w5F', '2_4w6F']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif


if type eq 'i3cz0jdot' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw1RGp2FFTI3cz00', '2_4Mo3FTFw2RGp2FFTI3cz00','2_4Mo3FTFw3RGp2FFTI3cz00',$
     '2_4Mo3FTFw4RGp2FFTI3cz00','2_4Mo3FTFw5RGp2FFTI3cz00','2_4Mo3FTFw6RGp2FFTI3cz00', $
     '2_6Mo3FTFw1RGp2FFTI3cz00', '2_6Mo3FTFw2RGp2FFTI3cz00','2_6Mo3FTFw3RGp2FFTI3cz00',$
     '2_6Mo3FTFw4RGp2FFTI3cz00','2_6Mo3FTFw5RGp2FFTI3cz00','2_6Mo3FTFw6RGp2FFTI3cz00', $
     '2_8Mo3FTFw1RGp2FFTI3cz00', '2_8Mo3FTFw2RGp2FFTI3cz00','2_8Mo3FTFw3RGp2FFTI3cz00',$
     '2_8Mo3FTFw4RGp2FFTI3cz00','2_8Mo3FTFw5RGp2FFTI3cz00','2_8Mo3FTFw6RGp2FFTI3cz00', $
     '3_0Mo3FTFw1RGp2FFTI3cz00', '3_0Mo3FTFw2RGp2FFTI3cz00','3_0Mo3FTFw3RGp2FFTI3cz00',$
     '3_0Mo3FTFw4RGp2FFTI3cz00','3_0Mo3FTFw5RGp2FFTI3cz00','3_0Mo3FTFw6RGp2FFTI3cz00' $
]           
;print, outfile
    outfile= 'i3cz0jdot'
    outtext=''
    textperrun=[$ 
'2_4w1', '2_4w2', '2_4w3', '2_4w4', '2_4w5', '2_4w6', $
'2_6w1', '2_6w2', '2_6w3', '2_6w4', '2_6w5', '2_6w6', $
'2_8w1', '2_8w2', '2_8w3', '2_8w4', '2_8w5', '2_8w6', $
'3_0w1', '3_0w2', '3_0w3', '3_0w4', '3_0w5', '3_0w6' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif

if type eq 'i3cz05jdot' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw1RGp2FFTI3cz05', '2_4Mo3FTFw2RGp2FFTI3cz05','2_4Mo3FTFw3RGp2FFTI3cz05',$
     '2_4Mo3FTFw4RGp2FFTI3cz05','2_4Mo3FTFw5RGp2FFTI3cz05','2_4Mo3FTFw6RGp2FFTI3cz05', $
     '2_6Mo3FTFw1RGp2FFTI3cz05', '2_6Mo3FTFw2RGp2FFTI3cz05','2_6Mo3FTFw3RGp2FFTI3cz05',$
     '2_6Mo3FTFw4RGp2FFTI3cz05','2_6Mo3FTFw5RGp2FFTI3cz05','2_6Mo3FTFw6RGp2FFTI3cz05', $
     '2_8Mo3FTFw1RGp2FFTI3cz05', '2_8Mo3FTFw2RGp2FFTI3cz05','2_8Mo3FTFw3RGp2FFTI3cz05',$
     '2_8Mo3FTFw4RGp2FFTI3cz05','2_8Mo3FTFw5RGp2FFTI3cz05','2_8Mo3FTFw6RGp2FFTI3cz05', $
     '3_0Mo3FTFw1RGp2FFTI3cz05', '3_0Mo3FTFw2RGp2FFTI3cz05','3_0Mo3FTFw3RGp2FFTI3cz05',$
     '3_0Mo3FTFw4RGp2FFTI3cz05','3_0Mo3FTFw5RGp2FFTI3cz05','3_0Mo3FTFw6RGp2FFTI3cz05' $
]           
;print, outfile
    outfile= 'i3cz05jdot'
    outtext=''
    textperrun=[$ 
'2_4w1', '2_4w2', '2_4w3', '2_4w4', '2_4w5', '2_4w6', $
'2_6w1', '2_6w2', '2_6w3', '2_6w4', '2_6w5', '2_6w6', $
'2_8w1', '2_8w2', '2_8w3', '2_8w4', '2_8w5', '2_8w6', $
'3_0w1', '3_0w2', '3_0w3', '3_0w4', '3_0w5', '3_0w6' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif


endif

if type eq 'i3cz10jdot' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw0RGp2FFTI3cz10','2_4Mo3FTFw1RGp2FFTI3cz10', '2_4Mo3FTFw2RGp2FFTI3cz10','2_4Mo3FTFw3RGp2FFTI3cz10',$
     '2_4Mo3FTFw4RGp2FFTI3cz10','2_4Mo3FTFw5RGp2FFTI3cz10','2_4Mo3FTFw6RGp2FFTI3cz10', '2_4Mo3FTFw12RGp2FFTI3cz10',$
     '2_6Mo3FTFw0RGp2FFTI3cz10','2_6Mo3FTFw1RGp2FFTI3cz10', '2_6Mo3FTFw2RGp2FFTI3cz10','2_6Mo3FTFw3RGp2FFTI3cz10',$
     '2_6Mo3FTFw4RGp2FFTI3cz10','2_6Mo3FTFw5RGp2FFTI3cz10','2_6Mo3FTFw6RGp2FFTI3cz10', '2_6Mo3FTFw12RGp2FFTI3cz10',$
     '2_8Mo3FTFw0RGp2FFTI3cz10','2_8Mo3FTFw1RGp2FFTI3cz10', '2_8Mo3FTFw2RGp2FFTI3cz10','2_8Mo3FTFw3RGp2FFTI3cz10',$
     '2_8Mo3FTFw4RGp2FFTI3cz10','2_8Mo3FTFw5RGp2FFTI3cz10','2_8Mo3FTFw6RGp2FFTI3cz10', '2_8Mo3FTFw12RGp2FFTI3cz10',$
     '3_0Mo3FTFw0RGp2FFTI3cz10','3_0Mo3FTFw1RGp2FFTI3cz10', '3_0Mo3FTFw2RGp2FFTI3cz10','3_0Mo3FTFw3RGp2FFTI3cz10',$
     '3_0Mo3FTFw4RGp2FFTI3cz10','3_0Mo3FTFw5RGp2FFTI3cz10','3_0Mo3FTFw6RGp2FFTI3cz10', '3_0Mo3FTFw12RGp2FFTI3cz10'$
]           
;print, outfile
    outfile= 'i3cz10jdot'
    outtext=''
    textperrun=[$ 
'2_4w0','2_4w1', '2_4w2', '2_4w3', '2_4w4', '2_4w5', '2_4w6', '2_4w12',$
'2_6w0','2_6w1', '2_6w2', '2_6w3', '2_6w4', '2_6w5', '2_6w6', '2_6w12',$
'2_8w0','2_8w1', '2_8w2', '2_8w3', '2_8w4', '2_8w5', '2_8w6','2_8w12', $
'3_0w0','3_0w1', '3_0w2', '3_0w3', '3_0w4', '3_0w5', '3_0w6' ,'3_0w12']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif

if type eq 'i3cz15jdot' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw1RGp2FFTI3cz15', '2_4Mo3FTFw2RGp2FFTI3cz15','2_4Mo3FTFw3RGp2FFTI3cz15',$
     '2_4Mo3FTFw4RGp2FFTI3cz15','2_4Mo3FTFw5RGp2FFTI3cz15','2_4Mo3FTFw6RGp2FFTI3cz15', $
     '2_6Mo3FTFw1RGp2FFTI3cz15', '2_6Mo3FTFw2RGp2FFTI3cz15','2_6Mo3FTFw3RGp2FFTI3cz15',$
     '2_6Mo3FTFw4RGp2FFTI3cz15','2_6Mo3FTFw5RGp2FFTI3cz15','2_6Mo3FTFw6RGp2FFTI3cz15', $
     '2_8Mo3FTFw1RGp2FFTI3cz15', '2_8Mo3FTFw2RGp2FFTI3cz15','2_8Mo3FTFw3RGp2FFTI3cz15',$
     '2_8Mo3FTFw4RGp2FFTI3cz15','2_8Mo3FTFw5RGp2FFTI3cz15','2_8Mo3FTFw6RGp2FFTI3cz15', $
     '3_0Mo3FTFw1RGp2FFTI3cz15', '3_0Mo3FTFw2RGp2FFTI3cz15','3_0Mo3FTFw3RGp2FFTI3cz15',$
     '3_0Mo3FTFw4RGp2FFTI3cz15','3_0Mo3FTFw5RGp2FFTI3cz15','3_0Mo3FTFw6RGp2FFTI3cz15' $
]           
;print, outfile
    outfile= 'i3cz15jdot'
    outtext=''
    textperrun=[$ 
'2_4w1', '2_4w2', '2_4w3', '2_4w4', '2_4w5', '2_4w6', $
'2_6w1', '2_6w2', '2_6w3', '2_6w4', '2_6w5', '2_6w6', $
'2_8w1', '2_8w2', '2_8w3', '2_8w4', '2_8w5', '2_8w6', $
'3_0w1', '3_0w2', '3_0w3', '3_0w4', '3_0w5', '3_0w6' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif


endif

if type eq 'i3cz20jdot' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw0RGp2FFTI3cz20','2_4Mo3FTFw1RGp2FFTI3cz20', '2_4Mo3FTFw2RGp2FFTI3cz20','2_4Mo3FTFw3RGp2FFTI3cz20',$
     '2_4Mo3FTFw4RGp2FFTI3cz20','2_4Mo3FTFw5RGp2FFTI3cz20','2_4Mo3FTFw6RGp2FFTI3cz20', '2_4Mo3FTFw12RGp2FFTI3cz20',$
     '2_6Mo3FTFw0RGp2FFTI3cz20','2_6Mo3FTFw1RGp2FFTI3cz20', '2_6Mo3FTFw2RGp2FFTI3cz20','2_6Mo3FTFw3RGp2FFTI3cz20',$
     '2_6Mo3FTFw4RGp2FFTI3cz20','2_6Mo3FTFw5RGp2FFTI3cz20','2_6Mo3FTFw6RGp2FFTI3cz20', '2_6Mo3FTFw12RGp2FFTI3cz20',$
     '2_8Mo3FTFw0RGp2FFTI3cz20','2_8Mo3FTFw1RGp2FFTI3cz20', '2_8Mo3FTFw2RGp2FFTI3cz20','2_8Mo3FTFw3RGp2FFTI3cz20',$
     '2_8Mo3FTFw4RGp2FFTI3cz20','2_8Mo3FTFw5RGp2FFTI3cz20','2_8Mo3FTFw6RGp2FFTI3cz20', '2_8Mo3FTFw12RGp2FFTI3cz20',$
     '3_0Mo3FTFw0RGp2FFTI3cz20','3_0Mo3FTFw1RGp2FFTI3cz20', '3_0Mo3FTFw2RGp2FFTI3cz20','3_0Mo3FTFw3RGp2FFTI3cz20',$
     '3_0Mo3FTFw4RGp2FFTI3cz20','3_0Mo3FTFw5RGp2FFTI3cz20','3_0Mo3FTFw6RGp2FFTI3cz20', '3_0Mo3FTFw12RGp2FFTI3cz20'$
]           
;print, outfile
    outfile= 'i3cz20jdot'
    outtext=''
    textperrun=[$ 
'2_4w0','2_4w1', '2_4w2', '2_4w3', '2_4w4', '2_4w5', '2_4w6', '2_4w12',$
'2_6w0','2_6w1', '2_6w2', '2_6w3', '2_6w4', '2_6w5', '2_6w6', '2_6w12',$
'2_8w0','2_8w1', '2_8w2', '2_8w3', '2_8w4', '2_8w5', '2_8w6','2_8w12', $
'3_0w0','3_0w1', '3_0w2', '3_0w3', '3_0w4', '3_0w5', '3_0w6' ,'3_0w12']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif

if type eq 'i3allcztestjdot' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw1RGp2FFTI3cz00', '2_4Mo3FTFw6RGp2FFTI3cz00',$
     '2_4Mo3FTFw1RGp2FFTI3cz10','2_4Mo3FTFw6RGp2FFTI3cz10', $
     '2_4Mo3FTFw1RGp2FFTI3cz20', '2_4Mo3FTFw6RGp2FFTI3cz20'$
]           
;print, outfile
    outfile= 'i3allcztestjdot'
    outtext=''
    textperrun=[$ 
'2_4w1cz00',  '2_4w6cz00', $
'2_4w1cz10',  '2_4w6cz10', $
'2_4w1cz20',  '2_4w6cz20' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif


endif

if type eq '2_6I3cz20FFT' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_6Mo3FTFw1RGp2FFTI3cz20', '2_6Mo3FTFw2RGp2FFTI3cz20',$
     '2_6Mo3FTFw3RGp2FFTI3cz20', '2_6Mo3FTFw4RGp2FFTI3cz20', $
     '2_6Mo3FTFw5RGp2FFTI3cz20', '2_6Mo3FTFw6RGp2FFTI3cz20'$
]           
;print, outfile
    outfile= '2_6i3allcz20'
    outtext=''
    textperrun=[$ 
'2_4w1cz20',  '2_6w2cz20', $
'2_4w3cz20',  '2_6w4cz20', $
'2_4w5cz20',  '2_6w6cz20' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=3.2
    xmax=2.0
    ymin=0
    ymax=40
endif


endif

if type eq '2_6I3w3cz00FFT' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_6Mo3FTFw3RGp2FFTI3cz00', '2_6Mo3FTFw3EoMS']

    outfile= '2_6i3w3cz00'
    outtext=''
    textperrun=[$ 
 	' ', ' ' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.5
    xmax=2.0
    ymin=0
    ymax=160
endif

if gtype eq 'CoreR' then begin
     xmin=1.0
    xmax=100
    ymin=1e4
    ymax=0.01
endif

if gtype eq 'CoreRpub2' then begin
     xmin=1.0
    xmax=100
    ymin=1e4
    ymax=0.01
endif

if gtype eq'Tracknopmspub' then begin
    xmin=3.71;4.1
    xmax=3.64;3.6
    ymin=1.5
    ymax=2.5;3.0
endif
if gtype eq 'RotKmspub2' then begin
    xmin=3.1
    xmax=1.0
    ymin=0.0
    ymax=15
endif
if gtype eq 'CoreRpub2' then begin
     xmin=8;1
     xmax=20;100
     ymin=300;3e3
     ymax=30;7e-2
endif
endif



if type eq '3_0I3cz20FFT' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '3_0Mo3FTFw1RGp2FFTI3cz20', '3_0Mo3FTFw2RGp2FFTI3cz20',$
     '3_0Mo3FTFw3RGp2FFTI3cz20', '3_0Mo3FTFw4RGp2FFTI3cz20', $
     '3_0Mo3FTFw5RGp2FFTI3cz20', '3_0Mo3FTFw6RGp2FFTI3cz20'$
]           
;print, outfile
    outfile= '3_0i3allcz20'
    outtext=''
    textperrun=[$ 
'3_0w1cz20',  '3_0w2cz20', $
'3_0w3cz20',  '3_0w4cz20', $
'3_0w5cz20',  '3_0w6cz20' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=3.2
    xmax=2.0
    ymin=0
    ymax=40
endif


endif



if type eq 'i3cz0noloss' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
    '2_4Mo3FTFw1', '2_4Mo3FTFw2','2_4Mo3FTFw3',$
     '2_4Mo3FTFw4','2_4Mo3FTFw5','2_4Mo3FTFw6', $
     '2_6Mo3FTFw1', '2_6Mo3FTFw2','2_6Mo3FTFw3',$
     '2_6Mo3FTFw4','2_6Mo3FTFw5','2_6Mo3FTFw6', $
     '2_8Mo3FTFw1', '2_8Mo3FTFw2','2_8Mo3FTFw3',$
     '2_8Mo3FTFw4','2_8Mo3FTFw5','2_8Mo3FTFw6', $
     '3_0Mo3FTFw1', '3_0Mo3FTFw2','3_0Mo3FTFw3',$
     '3_0Mo3FTFw4','3_0Mo3FTFw5','3_0Mo3FTFw6' $
]           
;print, outfile
    outfile= 'i3cz0noloss'
    outtext=''
    textperrun=[$ 
'2_4w1', '2_4w2', '2_4w3', '2_4w4', '2_4w5', '2_4w6', $
'2_6w1', '2_6w2', '2_6w3', '2_6w4', '2_6w5', '2_6w6', $
'2_8w1', '2_8w2', '2_8w3', '2_8w4', '2_8w5', '2_8w6', $
'3_0w1', '3_0w2', '3_0w3', '3_0w4', '3_0w5', '3_0w6' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif

if type eq '2_6w6STOP' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
    '2_6Mo3FTFw6RGp2FFTI0cz00STOP','2_6Mo3FTFw6RGp2FFTI0cz10STOP','2_6Mo3FTFw6RGp2FFTI0cz20STOP', $
    '2_6Mo3FTFw6RGp2FFTI2cz00STOP','2_6Mo3FTFw6RGp2FFTI2cz10STOP','2_6Mo3FTFw6RGp2FFTI2cz20STOP', $
    '2_6Mo3FTFw6RGp2FFTI3cz00STOP','2_6Mo3FTFw6RGp2FFTI3cz10STOP','2_6Mo3FTFw6RGp2FFTI3cz20STOP' $
]           
;print, outfile
    outfile= '2_6w6STOPIall'
    outtext=''
    textperrun=[$ 
'I0cz00', 'I0cz10', 'I0cz20' ,'I2cz00', 'I2cz10', 'I2cz20' ,'I3cz00', 'I3cz10', 'I3cz20' ]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-7
     ymax=1e-1
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif

if type eq '2_6Mo3FTFw6RGp2FFTI2cz10STOPstore' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    '2_6Mo3FTFw6RGp2FFTI2cz10STOPstore0','2_6Mo3FTFw6RGp2FFTI2cz10STOPstore5','2_6Mo3FTFw6RGp2FFTI2cz10STOPstore10', $
    '2_6Mo3FTFw6RGp2FFTI2cz10STOPstore15','2_6Mo3FTFw6RGp2FFTI2cz10STOPstore20','2_6Mo3FTFw6RGp2FFTI2cz10STOPstore25', $
    '2_6Mo3FTFw6RGp2FFTI2cz10STOPstore25','2_6Mo3FTFw6RGp2FFTI2cz10STOPstore30','2_6Mo3FTFw6RGp2FFTI2cz10STOPstore35', $
    '2_6Mo3FTFw6RGp2FFTI2cz10STOPstore40','2_6Mo3FTFw6RGp2FFTI2cz10STOPstore45','2_6Mo3FTFw6RGp2FFTI2cz10STOPstore50' $
]           
;print, outfile
    outfile= '2_6Mo3FTFw6RGp2FFTI2cz10STOPstore'
    outtext=''
    textperrun=[$ 
'00', '05', '10', '15', '20', '25', '30', '35', '40', '45','50', '55','60', '65','70', '75','80', '85','90', '95','100', '105','110', '115']  

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-7
     ymax=1e-1
endif

endif


if type eq '2_6Mo3FTFw6RGp2FFTI0cz10STOPstore' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
;   '2_6Mo3FTFw6RGp2FFTI0cz10STOPstore0','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore5','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore10', $
;   '2_6Mo3FTFw6RGp2FFTI0cz10STOPstore15','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore20','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore25', $
;    '2_6Mo3FTFw6RGp2FFTI0cz10STOPstore25','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore30','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore35', $
    '2_6Mo3FTFw6RGp2FFTI0cz10STOPstore40','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore45','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore50', $
    '2_6Mo3FTFw6RGp2FFTI0cz10STOPstore55','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore60','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore65'$ ;, $
;    '2_6Mo3FTFw6RGp2FFTI0cz10STOPstore70','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore75','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore80', $
;    '2_6Mo3FTFw6RGp2FFTI0cz10STOPstore85','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore90','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore95' $
]           
;print, outfile
    outfile= '2_6Mo3FTFw6RGp2FFTI0cz10STOPstore'
    outtext=''
    textperrun=[$ 
;'00', '05', '10', '15', '20', 
;'25', '30', '35', 
'40', '45','50', '55','60', '65'];,'70', '75','80', '85','90', '95','100', '105','110', '115']  

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-7
     ymax=1e-1
endif

endif


if type eq '2_6w6STOPcz10Is' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    '2_6Mo3FTFw6RGp2FFTI0cz10STOP','2_6Mo3FTFw6RGp2FFTI2cz10STOP','2_6Mo3FTFw6RGp2FFTI3cz10STOP' $
]           
;print, outfile
    outfile= '2_6w6STOPIcz10Is'
    outtext=''
    textperrun=[$ 
'I0', 'I2', 'I3' ]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-7
     ymax=1e-1
endif

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=55
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif


if type eq '2_6Mo3FTFw6RGp2FFTcz10STOPallIslogg285' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    '2_6Mo3FTFw6RGp2FFTI2cz10STOPstore90','2_6Mo3FTFw6RGp2FFTI3cz10STOPstore21','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore41' $
]           
;print, outfile
    outfile= '2_6Mo3FTFw6RGp2FFTcz10STOPallIslogg285'
    outtext=''
    textperrun=[$ 
'I2', 'I3', 'I0']  

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-8
     ymax=1e-2
endif

endif

if type eq '2_6Mo3FTFw6RGp2FFTcz10STOPallIslogg285' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    '2_6Mo3FTFw6RGp2FFTI2cz10STOPstore90','2_6Mo3FTFw6RGp2FFTI3cz10STOPstore21','2_6Mo3FTFw6RGp2FFTI0cz10STOPstore41' $
]           
;print, outfile
    outfile= '2_6Mo3FTFw6RGp2FFTcz10STOPallIslogg285'
    outtext=''
    textperrun=[$ 
'I2', 'I3', 'I0']  

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-8
     ymax=1e-2
endif

endif

if type eq 'flashMcoretest' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    'ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw1','ZRmod/1_4Mo3FTFw1','ZRmod/1_6Mo3FTFw1','ZRmod/1_8Mo3FTFw1', $
    'ZRmod/2_0Mo3FTFw1','ZRmod/2_2Mo3FTFw1','ZRmod/2_4Mo3FTFw1','ZRmod/2_6Mo3FTFw1','ZRmod/2_8Mo3FTFw1', $
    'ZRmod/3_0Mo3FTFw1', 'YRECgrid/nodiff/nodiff_out3/m160zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m170zhm000y264a18al00_nodifv', $
    'YRECgrid/nodiff/nodiff_out3/m180zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m190zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m200zhm000y264a18al00_nodifv',$
    'YRECgrid/nodiff/nodiff_out3/m210zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m220zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m230zhm000y264a18al00_nodifv',$
    'YRECgrid/nodiff/nodiff_out3/m240zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m250zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m260zhm000y264a18al00_nodifv', $
    'YRECgrid/nodiff/nodiff_out3/m090zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m100zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m110zhm000y264a18al00_nodifv',$
    'YRECgrid/nodiff/nodiff_out3/m120zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m130zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m140zhm000y264a18al00_nodifv',$
    'YRECgrid/nodiff/nodiff_out3/m150zhm000y264a18al00_nodifv'$
]           
;print, outfile
    outfile= 'flashMcoretest'
    outtext=''
    textperrun=[$ 
'1.0', '1.2','1.4','1.6', '1.8','2.0', '2.2','2.4','2.6', '2.8', '3.0', '1.6g', '1.7g', '1.8g', '1.9g', '2.0g', '2.1g', '2.2g', '2.3g', '2.4g','2.5g','2.6g','0.9g','1.0g','1.1g', $
'1.2g','1.3g','1.4g','1.5g', '0.6g', '0.7g', '0.8g', '0.9g' ]  

if gtype eq 'Track' then begin
     xmin=4.2
     xmax=3.48
     ymin=-0.5
     ymax=3.5
endif
if gtype eq 'CoreM' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.2
    ymax=0.5
endif
endif


if type eq 'flashMcoretestmhp02' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/'
    infiles=[ $
    'output/RotGrid_rh2/2_0fhp03rhFTFw3','output/RotGrid_rh2/2_2fhp03rhFTFw3','output/RotGrid_rh2/2_4fhp03rhFTFw3','output/RotGrid_rh2/2_6fhp03rhFTFw3','output/RotGrid_rh2/2_8fhp03rhFTFw3', $
    'output/RotGrid_rh2/3_0fhp03rhFTFw3','output/RotGrid_rh2/1_8fhp03rhFTFw3','output/RotGrid_rh2/1_6fhp03rhFTFw3','output/RotGrid_rh2/1_4fhp03rhFTFw3', $
    'output/RotGrid_rh2/1_2fhp03rhFTKw3', 'output/RotGrid_rh2/1_0fhp03rhFTKw3', 'output/RotGrid_rh2/0_8fhp03rhFTKw3', $
;    'ZRmod/3_0Mo3FTFw1', 'YRECgrid/nodiff/nodiff_out3/m160zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m170zhm000y264a18al00_nodifv', $
    'zuul/0/tayar/YRECgrid/nodiff_out4z/m160fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m170fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m180fhp020y273a17al00_grnodf',$
    'zuul/0/tayar/YRECgrid/nodiff_out4z/m190fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m200fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m210fhp020y273a17al00_grnodf',$
    'zuul/0/tayar/YRECgrid/nodiff_out4z/m220fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m230fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m240fhp020y273a17al00_grnodf', $
    'zuul/0/tayar/YRECgrid/nodiff_out4z/m250fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m260fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m090fhp020y273a17al00_grnodf',$
    'zuul/0/tayar/YRECgrid/nodiff_out4z/m100fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m110fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m120fhp020y273a17al00_grnodf',$
    'zuul/0/tayar/YRECgrid/nodiff_out4z/m130fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m140fhp020y273a17al00_grnodf','zuul/0/tayar/YRECgrid/nodiff_out4z/m150fhp020y273a17al00_grnodf'$
]           
;print, outfile
    outfile= 'flashMcoretestmhp02'
    outtext=''
    textperrun=[$ 
'2.0', '2.2','2.4','2.6', '2.8', '3.0', '1.8', '1.6','1.4','1.2', '1.0', '0.8','1.6g', '1.7g', '1.8g', '1.9g', '2.0g', '2.1g', '2.2g', '2.3g', '2.4g','2.5g','2.6g','0.9g','1.0g','1.1g', $
'1.2g','1.3g','1.4g','1.5g' ]  

if gtype eq 'Track' then begin
     xmin=4.2
     xmax=3.48
     ymin=-0.5
     ymax=3.5
endif
if gtype eq 'CoreM' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.2
    ymax=0.5
endif
endif


if type eq 'flashMcoretestlow' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    'YRECgrid/nodiff/nodiff_out3/m060zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m070zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m080zhm000y264a18al00_nodifv'$
]           
;print, outfile
    outfile= 'flashMcoretestlow'
    outtext=''
    textperrun=[$ 
 '0.6g', '0.7g', '0.8g' ]  

if gtype eq 'Deg' then begin
     xmin=24
     xmax=85
     ymin=.0001
     ymax=100
endif
if gtype eq 'CoreM' then begin
    xmin=0.5
    xmax=3.9
    ymin=0.2
    ymax=0.5
endif
endif


if type eq 'flashMcoretest2s' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    'ZRmod/2_0Mo3FTFw1','ZRmod/2_2Mo3FTFw1','YRECgrid/nodiff/nodiff_out3/m200zhm000y264a18al00_nodifv',$
    'YRECgrid/nodiff/nodiff_out3/m210zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m220zhm000y264a18al00_nodifv' $
]           
;print, outfile
    outfile= 'flashMcoretest2s'
    outtext=''
    textperrun=[$ 
'2.0', '2.2', '2.0g', '2.1g', '2.2g' ]  

if gtype eq 'TeffLogg' then begin
     xmin=4500
     xmax=3500
     ymin=3.5
     ymax=0.0
endif
if gtype eq 'CoreM' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.2
    ymax=0.5
endif
endif

if type eq 'flash22test' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
    '2_2Mo3FTFw1preEX2','2_2Mo3FTFw1','2_2Mo3FTFw1EX','2_2Mo3FTFw1EXa','2_2Mo3FTFw1EX1','2_2Mo3FTFw1EXa1' $
]           
;print, outfile
    outfile= 'flash22test'
    outtext=''
    textperrun=[$ 
'preEX2', 'base', 'EX', 'EXa','EX1', 'EXa1'  ]  

if gtype eq 'TeffLogg' then begin
     xmin=4500
     xmax=3500
     ymin=3.5
     ymax=0.0
endif
if gtype eq 'CoreM' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.2
    ymax=0.5
endif

if gtype eq 'Deg' then begin
    xmin=0.81
    xmax=0.82
    ymin=0.01
    ymax=100
endif

endif

if type eq 'Heburntest' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    'Heburn/0_6Mo3STARTZAHBtest','Heburn/1_5Mo3STARTZAHBtestu', 'Heburn/2_4Mo3rsclcm', 'Heburn/1_1Mo3rsclcm', 'YRECgrid/nodiff/nodiff_out3/m240zhm000y264a18al00_nodifv','YRECgrid/nodiff/nodiff_out3/m260zhm000y264a18al00_nodifv' $
]           
;print, outfile
    outfile= 'Heburntest'
    outtext=''
    textperrun=[$ 
'0.6', '1.5', '2.4r', '1.1r', '2.4d', '2.6d'  ]  

if gtype eq 'TeffLogg' then begin
     xmin=5200
     xmax=4200
     ymin=3.0
     ymax=2.0
endif
if gtype eq 'CoreM' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.2
    ymax=0.5
endif

if gtype eq 'Deg' then begin
    xmin=0.81
    xmax=0.82
    ymin=0.01
    ymax=100
endif

if gtype eq 'Track' then begin
     xmin=3.71
     xmax=3.58
     ymin=1.4
     ymax=3.0
endif

endif

if type eq 'Heburn24test' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    'Heburn/2_4Mo3rsclcm', 'Heburn/2_4Mo3rsclcmSurfZ','Heburn/2_4Mo3rsclcmBigSurfZ','Heburn/2_4Mo3rsclcmBigSurfZCCorchem', 'YRECgrid/nodiff/nodiff_out3/m240zhm000y264a18al00_nodifv' $
]           
;print, outfile
    outfile= 'Heburn24test'
    outtext=''
    textperrun=[$ 
  '2.4r', '2.4rZ','2.4rbigZ' ,'2.4rbigZcorchem', '2.4d'  ]  

if gtype eq 'TeffLogg' then begin
     xmin=5200
     xmax=4200
     ymin=3.0
     ymax=2.0
endif
if gtype eq 'CoreM' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.2
    ymax=0.5
endif

if gtype eq 'Deg' then begin
    xmin=0.81
    xmax=0.82
    ymin=0.01
    ymax=100
endif

if gtype eq 'Track' then begin
     xmin=3.712
     xmax=3.67
     ymin=1.4
     ymax=2.0
endif

endif

if type eq 'Heburn26testr' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    'Heburn/2_6from2_4bigrun', 'Heburn/2_6from2_4run','YRECgrid/nodiff/nodiff_out3/m260zhm000y264a18al00_nodifv', 'Heburn/m240zhm000y264a18al00_nodifvCLUMP','Heburn/2_6from2_4bigrunpaintcore','Heburn/2_6from2_4bigrunpaint' $
]           
;print, outfile
    outfile= 'Heburn26testr'
    outtext=''
    textperrun=[$ 
  '2.6rbig', '2.6r', '2.6d', '2.4d', '2.6bigpaintc', '2.6bigpaint'  ]  

if gtype eq 'TeffLogg' then begin
     xmin=5200
     xmax=4200
     ymin=3.0
     ymax=2.0
endif
if gtype eq 'CoreM' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.2
    ymax=0.5
endif

if gtype eq 'Deg' then begin
    xmin=0.81
    xmax=0.82
    ymin=0.01
    ymax=100
endif

if gtype eq 'Track' then begin
     xmin=3.712
     xmax=3.67
     ymin=1.4
     ymax=2.0
endif


endif

if type eq 'Heburnpainttest' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    'Heburn/2_4CLUMPfrom2_4tip', 'Heburn/2_6from2_6paintself','YRECgrid/nodiff/nodiff_out3/m260zhm000y264a18al00_nodifv', 'Heburn/m240zhm000y264a18al00_nodifvCLUMP','Heburn/2_6from2_4bigrunpaintcore','Heburn/2_6from2_4bigrunpaint', 'Heburn/2_4CLUMPrestartnochem', 'Heburn/2_6CLUMPrestartnochem', 'Heburn/2_4CLUMPrestart','Heburn/2_6CLUMPrestart'$
]           
;print, outfile
    outfile= 'Heburnpainttest'
    outtext=''
    textperrun=[$ 
  '2.4cpaintt', '2.6paintself', '2.6d', '2.4d', '2.6bigpaintc', '2.6bigpaint', 'nochem2.4r', 'nochem2.6r', '2.4r', '2.6r'  ]  

if gtype eq 'TeffLogg' then begin
     xmin=5000
     xmax=4700
     ymin=3.0
     ymax=2.4
endif
if gtype eq 'CoreM' then begin
    xmin=0.9
    xmax=3.1
    ymin=0.2
    ymax=0.5
endif

if gtype eq 'Deg' then begin
    xmin=0.81
    xmax=0.82
    ymin=0.01
    ymax=100
endif

if gtype eq 'Track' then begin
     xmin=3.70
     xmax=3.67
     ymin=1.53
     ymax=2.0
endif


endif

if type eq 'Heburn26test' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ $
    'Heburn/2_6from2_4big', 'Heburn/2_6from2_4','Heburn/m240zhm000y264a18al00_nodifvCLUMP',  'Heburn/2_6from2_4bigrunpaintcore' $
]           
;print, outfile
    outfile= 'Heburn26test'
    outtext=''
    textperrun=[$ 
  '2.6rbig', '2.6r', '2.4d', '2.6bigpaintc'  ]  
if gtype eq 'HLayers' then begin
     xmin=0.1
     xmax=1.0
     ymin=0.001
     ymax=1.0
endif

endif


if type eq 'mdottest' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '1_4Mo3FTFw5','1_6Mo3FTFw5','1_8Mo3FTFw5','2_0Mo3FTFw5','2_2Mo3FTFw5', '3_0Mo3FTFw5','2_0Mo3FTFw4','2_0Mo3FTFw2'$
]           
;print, outfile
    outfile= 'mdottest'
    outtext=''
    textperrun=[$ 
  '1.4', '1.6', '1.8', '2.0', '2.2' , '3.0','2.0w4', '2.0w2' ]  
if gtype eq 'Reimers' then begin
     xmin=1.3
     xmax=2.3
     ymin=0.001
     ymax=1.0
endif

endif




if type eq 'subgiants' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=['ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw1','ZRmod/1_2Mo3FTFw5','ZRmod/1_6Mo3FTFw1','ZRmod/1_6Mo3FTFw5', 'OttoGrid/Ottom85zm100a2RGp2FFFI3cz2' ,'ZRmod/1_0Mo3FTTw1RGp2FFT', 'ZRmod/1_0Mo3FTTw1RGp2FTTI3cz20', $
;'ZRmod/1_4Mo3FTFw1RGp2FTTI3cz20','ZRmod/1_4Mo3FTFw1RGp2FFT', 'ZRmod/1_4Mo3FTFw1RGp2FTTI3cz00',  'ZRmod/1_4Mo3FTFw5RGp2FFT', 'ZRmod/1_4Mo3FTFw5RGp2FTTI3cz00', 'ZRmod/1_4Mo3FTFw5RGp2FTTI3cz20', $
'ZRmod/1_8Mo3FTFw1RGp2FFT', 'ZRmod/1_8Mo3FTFw1RGp2FTTI3cz20', 'ZRmod/1_8Mo3FTFw5RGp2FFT', 'ZRmod/1_8Mo3FTFw5RGp2FTTI3cz00', 'ZRmod/1_8Mo3FTFw5RGp2FTTI3cz20', 'ZRmod/1_4Mo3FTFw1RGp2FTTI3cz00'] 
;1_0s are actually FTT
    outfile= 'subgiants'
    outtext=' '
    textperrun=['1.0w1','1.2w1', '1.2w5','1.6w1', '1.6w5', 'ottoI3cz2', '1.0w1D', '1.0cz2', $
;'1.4w1cz2','1.4w1D', '1.4w1',  '1.4w5D', '1.4w5', '1.4w5cz2', $
'1.8w1D', '1.8w1cz2', '1.8w5D', '1.8w5', '1.8w5cz2', '1.4w1']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.7;3.9
    xmax=3.5;3.45
    ymin=3.0;  -1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=1.5
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceRKms' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e0
    ymax=1e3
endif
if gtype eq 'SurfacePMass' then begin
    xmin=1.0
    xmax=2.0
    ymin=1e4
    ymax=1e1
endif
if gtype eq 'CoreRPub' then begin
    xmin=1.5;1. ;
    xmax= 7.0;4.5;100.0 ;
    ymin=1e3;6;
    ymax=1e00;-3;
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=1e-9
     ymax=1e-5
endif
if gtype eq 'StructLayers' then begin
     xmin=0
     xmax=5.0
     ymin=0
     ymax=5.0
endif
if gtype eq'Rot2z' then begin
    xmin=10.0  ;0
    xmax=11.0  ;13.0
    ymin=-3.0
    ymax=5.0
endif
if gtype eq'RotKms' then begin
    xmin=4.0 ;0
    xmax=3.5  ;13.0
    ymin=0.2
    ymax=3.0
endif
endif


if type eq 'Paulbases' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw1RGp2FFT','2_6Mo3FTFw6RGp2FFTI3cz00','2_8Mo3FTFw1RGp2FFT','3_0Mo3FTFw1RGp2FFTI3cz00'$
]           
;print, outfile
    outfile= 'Paulbases'
    outtext=''
    textperrun=[$ 
  '2.4','2.6', '2.8', '3.0' ]  
if gtype eq 'TeffLogg' then begin
     xmin=5100
     xmax=4800
     ymin=3.1
     ymax=2.5
endif

endif



if type eq 'subgiants2' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=['ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw1','ZRmod/1_4Mo3FTFw2RGp2FTTI3cz00', 'ZRmod/1_6Mo3FTFw3RGp2FFT','ZRmod/1_8Mo3FTFw3RGp2FFT', 'ZRmod/2_4Mo3FTFw3RGp2FFTI3cz00', 'ZRmod/2_6Mo3FTFw3RGp2FFTI3cz00' ] 
;1_0s are actually FTT
    outfile= 'subgiants2'
    outtext=' '
    textperrun=['1.0w1', '1.2w1','1.4w2', '1.6w3', '1.8w3', '2.4w3', '2.6w3']

if gtype eq 'SurfacePMass' then begin
    xmin=1.0
    xmax=2.0
    ymin=1e4
    ymax=1e1
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
endif


if type eq 'subgiants3pmmcz2' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=['ZRmod/1_0Mo3FTFw1','ZRmod/1_0Mo3FTTw1RGp2FTTI3cz20','ZRmod/1_2Mo3FTFw1', 'ZRmod/1_2Mo3FTTw1RGp2FTTI3cz20', 'RotGrid_rh2/1_4fhm00rhFTFw3RGp2VI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw3RGp2VI3cz00','RotGrid_rh2/1_8fhm00rhFTFw3RGp2VI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw3RGp2VI3cz00','RotGrid_rh2/1_4fhm00rhFTFw3RGp2VI3cz20', 'RotGrid_rh2/1_6fhm00rhFTFw3RGp2VI3cz20','RotGrid_rh2/1_8fhm00rhFTFw3RGp2VI3cz20', 'RotGrid_rh2/2_0fhm00rhFTFw3RGp2VI3cz20' ] 
;1_0s are actually FTT
    outfile= 'subgiants3pmmcz2'
    outtext=' '
    textperrun=['1.0', '1.0cz2', '1.2','1.2cz2', '1.4', '1.6', '1.8', '2.0', '1.4cz2', '1.6cz2', '1.8cz2', '2.0cz2']

if gtype eq 'CoreR' then begin
    xmin=1.5
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.5
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfacePMass' then begin
    xmin=1.0
    xmax=2.0
    ymin=1e4
    ymax=1e1
endif
if gtype eq 'SurfaceRKms' then begin
    xmin=1.0
    xmax=7.0
    ymin=1
    ymax=40
endif
endif

if type eq 'subgiants3pmm' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=['ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw1','RotGrid_rh2/1_4fhm00rhFTFw3RGp2VI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw3RGp2VI3cz00','RotGrid_rh2/1_8fhm00rhFTFw3RGp2VI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw3RGp2VI3cz00', 'RotGrid_rh2/1_4fhm00rhFTFw3EoMS', 'RotGrid_rh2/1_6fhm00rhFTFw3EoMS','RotGrid_rh2/1_8fhm00rhFTFw3EoMS', 'RotGrid_rh2/2_0fhm00rhFTFw3EoMS'];,'ZRmod/1_4Mo3FTFw3' ] 
;1_0s are actually FTT
    outfile= 'subgiants3pmm'
    outtext=' '
    textperrun=['1.0', '1.2','1.4', '1.6', '1.8', '2.0','1.4', '1.6', '1.8', '2.0' ];, '1.4b']

if gtype eq 'SurfacePMass' then begin
    xmin=1.0
    xmax=2.0
    ymin=1e4
    ymax=1e1
endif

if gtype eq 'TeffLoggData' then begin
    xmin=6300
    xmax=4700
    ymin=4.5
    ymax=3.0
endif
if gtype eq 'TeffLogg' then begin
    xmin=8000;6300
    xmax=5500;4700
    ymin=5;4.5
    ymax=3;3.0
endif
if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=2.7
    ymin=-1.0
    ymax=0.5
endif

if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceRKms' then begin
    xmin=1.0
    xmax=7.0
    ymin=1
    ymax=40
endif
endif

if type eq 'subgiants3kaw' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=['ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw1','RotGrid_rh2/1_4fhm00rhFTFw3RGp2KI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw3RGp2KI3cz00','RotGrid_rh2/1_8fhm00rhFTFw3RGp2KI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw3RGp2KI3cz00' ] 
;1_0s are actually FTT
    outfile= 'subgiants3kaw'
    outtext=' '
    textperrun=['1.0', '1.2','1.4', '1.6', '1.8', '2.0']

if gtype eq 'SurfacePMass' then begin
    xmin=1.0
    xmax=2.0
    ymin=1e4
    ymax=1e1
endif
if gtype eq 'TeffLoggData' then begin
    xmin=6300
    xmax=4700
    ymin=4.5
    ymax=3.0
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceRKms' then begin
    xmin=1.0
    xmax=7.0
    ymin=1
    ymax=40
endif

if gtype eq 'RotKms' then begin
    xmin=4.5
    xmax=3.5
    ymin=0
    ymax=40
endif
endif

if type eq 'previewSurfs' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ $
     '2_4Mo3FTFw3RGp2FFTI3cz00','2_6Mo3FTFw3RGp2FFTI3cz00','2_8Mo3FTFw3RGp2FFTI3cz00',$
     '3_0Mo3FTFw3RGp2FFTI3cz00', $
     '2_4Mo3FTFw3RGp2FFTI3cz20','2_6Mo3FTFw3RGp2FFTI3cz20','2_8Mo3FTFw3RGp2FFTI3cz20',$
     '3_0Mo3FTFw3RGp2FFTI3cz20'$
]           
;print, outfile
    outfile= 'previewsurfs'
    outtext=''
    textperrun=[$ 
'kaw', 'kaw','kaw','kaw', 'cz2', 'cz2','cz2', 'cz2']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKmsM' then begin
     xmin=2.0
    xmax=3.0
    ymin=1
    ymax=20
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif

endif

if type eq 'previewM3fast' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ '3_0Mo3FTFw6RGp2FFTI3cz00', '3_0Mo3FTFw6RGp2FFTI3cz20']           
    outfile= 'previewM3fast'
    outtext='m3fast'
    textperrun=['kaw',  'cz2']  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif

endif

if type eq 'previewM3slow' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ '3_0Mo3FTFw1RGp2FFTI3cz00', '3_0Mo3FTFw1RGp2FFTI3cz20']           
    outfile= 'previewM3slow'
    outtext='m3slow'
    textperrun=['kaw',  'cz2']  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif

endif

if type eq 'previewM2fast' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ '2_4Mo3FTFw6RGp2FFTI3cz00', '2_4Mo3FTFw6RGp2FFTI3cz20']           
    outfile= 'previewM2fast'
    outtext='m2fast'
    textperrun=['kaw',  'cz2']  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif

endif

if type eq 'previewM2slow' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ '2_4Mo3FTFw1RGp2FFTI3cz00', '2_4Mo3FTFw1RGp2FFTI3cz20']           
    outfile= 'previewM2slow'
    outtext='m2slow'
    textperrun=['kaw',  'cz2']  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif

endif

if type eq 'checkrh1' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '3_0MrhFTFw1','3_0MrhFTFw1Sem', '3_0MrhFTFw1SemnoOv','3_0MrhFTFw1noOv']           
    outfile= 'checkrh1'
    outtext=''
    textperrun=['Ov',  'SemiOv', 'Sem','none']  

if gtype eq 'Track' then begin
    xmin=3.7
    xmax=3.63
    ymin=1.8
    ymax=3.0
endif
if gtype eq 'TeffLogg' then begin
    xmin=5500
    xmax=4500
    ymin=3.5
    ymax=2.0
endif
endif

if type eq 'checkOvMH' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_4MrhFTFw1OvN']; '2_4MrhFTFw1'];,          
    outfile= 'checkOvMH'
    outtext=''
    textperrun=['N', 'Ov' ]  

if gtype eq 'Track' then begin
    xmin=3.7
    xmax=3.63
    ymin=1.8
    ymax=3.0
endif
if gtype eq 'TeffLogg' then begin
    xmin=5500
    xmax=4500
    ymin=3.5
    ymax=2.0
endif
if gtype eq 'Deg2' then begin
    xmin=0.5
    xmax=1.0
    ymin=1e-2
    ymax=1e2
endif
if gtype eq 'Deg' then begin
    xmin=0.5
    xmax=1.0
    ymin=1e-2
    ymax=1e2
endif
endif




if type eq 'checkrh1mass' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '3_0MrhFTFw1','2_8MrhFTFw1', '2_6MrhFTFw1','2_4MrhFTFw1']           
    outfile= 'checkrh1mass'
    outtext=''
    textperrun=['3.0',  '2.8', '2.6','2.4']  

if gtype eq 'Track' then begin
    xmin=3.7
    xmax=3.63
    ymin=1.8
    ymax=3.0
endif
if gtype eq 'TeffLogg' then begin
    xmin=5500
    xmax=4500
    ymin=3.5
    ymax=2.0
endif
endif

if type eq 'checkrh20s' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1', '2_0fhm00rhFTFw2','2_0fhm00rhFTFw3','2_0fhm00rhFTFw4','2_0fhm00rhFTFw5','2_0fhm00rhFTFw6', '2_0fhm00rhFTFw1_flash',  '2_0fhm00rhFTFw1_flash2','2_2fhm00rhFTFw3']           ; ,
    outfile= 'checkrh120s'
    outtext=''
    textperrun=['w1','w2','w3','w4','w5','w6', 'fl', 'fl2','2.2']  ;

if gtype eq 'Track' then begin
    xmin=3.7
    xmax=3.63
    ymin=1.8
    ymax=3.0
endif
if gtype eq 'TeffLogg' then begin
    xmin=5000
    xmax=4870
    ymin=3.0
    ymax=2.85
endif
if gtype eq 'Deg' then begin
    xmin=0.8
    xmax=1.25
    ymin=1e-2
    ymax=1e2
endif

endif


if type eq '20flash' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1_flash',  '2_0fhm00rhFTFw1_flash2']           ; ,
    outfile= '20flash'
    outtext=''
    textperrun=[ 'fl', 'fl2']  ;

if gtype eq 'Track' then begin
    xmin=3.7
    xmax=3.63
    ymin=1.8
    ymax=3.0
endif
if gtype eq 'TeffLogg' then begin
    xmin=5000
    xmax=4870
    ymin=3.0
    ymax=2.85
endif
if gtype eq 'Deg2' then begin
    xmin=1.1569;1.155;
    xmax=1.15697;1.165;
    ymin=4;8;5;1e-1 ;4;4;5;
    ymax=25;8.1; 6; 1e2;40;9;25;
endif

endif

if type eq 'checkrhw3KI3cz00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw3RGp2KI3cz00', '2_2fhm00rhFTFw3RGp2KI3cz00','2_4fhm00rhFTFw3RGp2KI3cz00','2_6fhm00rhFTFw3RGp2KI3cz00','2_8fhm00rhFTFw3RGp2KI3cz00','3_0fhm00rhFTFw3RGp2KI3cz00']           ; ,
    outfile= 'checkrhw3KI3cz00'
    outtext=''
    textperrun=['2.0','2.2', '2.4', '2.6', '2.8', '3.0']  ;

if gtype eq 'Track' then begin
    xmin=3.7
    xmax=3.63
    ymin=1.8
    ymax=3.0
endif
if gtype eq 'TeffLogg' then begin
    xmin=5000
    xmax=4870
    ymin=3.0
    ymax=2.85
endif
if gtype eq 'Deg' then begin
    xmin=0.8
    xmax=1.25
    ymin=1e-2
    ymax=1e2
endif

endif

if type eq 'M3fast' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw6RGp2KI3cz00', '3_0fhm00rhFTFw6RGp2KI3cz20','3_0fhm00rhFTFw6RGp2VI3cz00','3_0fhm00rhFTFw6RGp2VI3cz20']           
    outfile= 'M3fast'
    outtext='m3fast'
    textperrun=['KawSB',  'Kawcz2','PMMSB',  'PMMcz2']  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif

endif


if type eq 'M3slow' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw1RGp2KI3cz00', '3_0fhm00rhFTFw1RGp2KI3cz20','3_0fhm00rhFTFw1RGp2VI3cz00','3_0fhm00rhFTFw1RGp2VI3cz20']           
    outfile= 'M3slow'
    outtext='m3slow'
    textperrun=['KawSB',  'Kawcz2','PMMSB',  'PMMcz2']  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif

endif

if type eq 'M22fast' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_2fhm00rhFTFw6RGp2KI3cz00', '2_2fhm00rhFTFw6RGp2KI3cz20','2_2fhm00rhFTFw6RGp2VI3cz00','2_2fhm00rhFTFw6RGp2VI3cz20']           
    outfile= 'M22fast'
    outtext='m22fast'
    textperrun=['KawSB',  'Kawcz2','PMMSB',  'PMMcz2']  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif

endif


if type eq 'M22slow' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_2fhm00rhFTFw1RGp2KI3cz00', '2_2fhm00rhFTFw1RGp2KI3cz20','2_2fhm00rhFTFw1RGp2VI3cz00','2_2fhm00rhFTFw1RGp2VI3cz20']           
    outfile= 'M22slow'
    outtext='m22slow'
    textperrun=['KawSB',  'Kawcz2','PMMSB',  'PMMcz2']  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif

endif

if type eq 'SurfsMw6' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '2_2fhm00rhFTFw6RGp2KI3cz00','2_4fhm00rhFTFw6RGp2KI3cz00','2_6fhm00rhFTFw6RGp2KI3cz00','2_8fhm00rhFTFw6RGp2KI3cz00','3_0fhm00rhFTFw6RGp2KI3cz00',$
     '2_2fhm00rhFTFw6RGp2KI3cz20','2_4fhm00rhFTFw6RGp2KI3cz20','2_6fhm00rhFTFw6RGp2KI3cz20','2_8fhm00rhFTFw6RGp2KI3cz20','3_0fhm00rhFTFw6RGp2KI3cz20',$   
     '2_2fhm00rhFTFw6RGp2VI3cz00','2_4fhm00rhFTFw6RGp2VI3cz00','2_6fhm00rhFTFw6RGp2VI3cz00','2_8fhm00rhFTFw6RGp2VI3cz00','3_0fhm00rhFTFw6RGp2VI3cz00',$
     '2_2fhm00rhFTFw6RGp2VI3cz20','2_4fhm00rhFTFw6RGp2VI3cz20','2_6fhm00rhFTFw6RGp2VI3cz20','2_8fhm00rhFTFw6RGp2VI3cz20','3_0fhm00rhFTFw6RGp2VI3cz20'$  
]           
;print, outfile
    outfile= 'surfsMw6'
    outtext=''
    textperrun=[$ 
 'KawSB','KawSB','KawSB','KawSB','KawSB',  'Kawcz2','Kawcz2','Kawcz2','Kawcz2','Kawcz2', 'PMMSB','PMMSB','PMMSB','PMMSB','PMMSB', 'PMMcz2', 'PMMcz2','PMMcz2','PMMcz2','PMMcz2']  

if gtype eq 'RotKmsM' then begin
     xmin=1.95
    xmax=3.0
    ymin=1
    ymax=20
endif

endif
if type eq 'SurfsMw1' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '2_2fhm00rhFTFw1RGp2KI3cz00','2_4fhm00rhFTFw1RGp2KI3cz00','2_6fhm00rhFTFw1RGp2KI3cz00','2_8fhm00rhFTFw1RGp2KI3cz00','3_0fhm00rhFTFw1RGp2KI3cz00',$
     '2_2fhm00rhFTFw1RGp2KI3cz20','2_4fhm00rhFTFw1RGp2KI3cz20','2_6fhm00rhFTFw1RGp2KI3cz20','2_8fhm00rhFTFw1RGp2KI3cz20','3_0fhm00rhFTFw1RGp2KI3cz20',$   
     '2_2fhm00rhFTFw1RGp2VI3cz00','2_4fhm00rhFTFw1RGp2VI3cz00','2_6fhm00rhFTFw1RGp2VI3cz00','2_8fhm00rhFTFw1RGp2VI3cz00','3_0fhm00rhFTFw1RGp2VI3cz00',$
     '2_2fhm00rhFTFw1RGp2VI3cz20','2_4fhm00rhFTFw1RGp2VI3cz20','2_6fhm00rhFTFw1RGp2VI3cz20','2_8fhm00rhFTFw1RGp2VI3cz20','3_0fhm00rhFTFw1RGp2VI3cz20'$  
]           
;print, outfile
    outfile= 'surfsMw1'
    outtext=''
    textperrun=[$ 
 'KawSB','KawSB','KawSB','KawSB','KawSB',  'Kawcz2','Kawcz2','Kawcz2','Kawcz2','Kawcz2', 'PMMSB','PMMSB','PMMSB','PMMSB','PMMSB', 'PMMcz2', 'PMMcz2','PMMcz2','PMMcz2','PMMcz2']  

if gtype eq 'RotKmsM' then begin
     xmin=1.95
    xmax=3.0
    ymin=1
    ymax=20
endif

endif




if type eq 'SurfsM' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '2_0fhm00rhFTFw3RGp2KI3cz00flash2','2_2fhm00rhFTFw3RGp2KI3cz00','2_4fhm00rhFTFw3RGp2KI3cz00','2_6fhm00rhFTFw3RGp2KI3cz00','2_8fhm00rhFTFw3RGp2KI3cz00','3_0fhm00rhFTFw3RGp2KI3cz00',$
     '2_0fhm00rhFTFw3RGp2KI3cz20flash2','2_2fhm00rhFTFw3RGp2KI3cz20','2_4fhm00rhFTFw3RGp2KI3cz20','2_6fhm00rhFTFw3RGp2KI3cz20','2_8fhm00rhFTFw3RGp2KI3cz20','3_0fhm00rhFTFw3RGp2KI3cz20',$   
     '2_0fhm00rhFTFw3RGp2VI3cz00flash2','2_2fhm00rhFTFw3RGp2VI3cz00','2_4fhm00rhFTFw3RGp2VI3cz00','2_6fhm00rhFTFw3RGp2VI3cz00','2_8fhm00rhFTFw3RGp2VI3cz00','3_0fhm00rhFTFw3RGp2VI3cz00',$
     '2_0fhm00rhFTFw3RGp2VI3cz20flash2','2_2fhm00rhFTFw3RGp2VI3cz20','2_4fhm00rhFTFw3RGp2VI3cz20','2_6fhm00rhFTFw3RGp2VI3cz20','2_8fhm00rhFTFw3RGp2VI3cz20','3_0fhm00rhFTFw3RGp2VI3cz20'$  
]           
;print, outfile
    outfile= 'surfsM'
    outtext=''
    textperrun=[$ 
'KawSB', 'KawSB','KawSB','KawSB','KawSB','KawSB', 'Kawcz2', 'Kawcz2','Kawcz2','Kawcz2','Kawcz2','Kawcz2', 'PMMSB','PMMSB','PMMSB','PMMSB','PMMSB','PMMSB','PMMcz2', 'PMMcz2', 'PMMcz2','PMMcz2','PMMcz2','PMMcz2']  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKmsM' then begin
     xmin=1.95
    xmax=3.0
    ymin=1
    ymax=20
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif
if gtype eq'JdotM' then begin
    xmin=1.95 ;2.0
    xmax=3.0
    ymin=1D28
    ymax=1D37
endif
endif

if type eq 'KawSBm00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_0fhm00rhFTFw0RGp2KI3cz00flash3','2_2fhm00rhFTFw0RGp2KI3cz00','2_4fhm00rhFTFw0RGp2KI3cz00','2_6fhm00rhFTFw0RGp2KI3cz00','2_8fhm00rhFTFw0RGp2KI3cz00','3_0fhm00rhFTFw0RGp2KI3cz00',$
              '2_0fhm00rhFTFw1RGp2KI3cz00flash3','2_2fhm00rhFTFw1RGp2KI3cz00','2_4fhm00rhFTFw1RGp2KI3cz00','2_6fhm00rhFTFw1RGp2KI3cz00','2_8fhm00rhFTFw1RGp2KI3cz00','3_0fhm00rhFTFw1RGp2KI3cz00',$
              '2_0fhm00rhFTFw2RGp2KI3cz00flash3','2_2fhm00rhFTFw2RGp2KI3cz00','2_4fhm00rhFTFw2RGp2KI3cz00','2_6fhm00rhFTFw2RGp2KI3cz00','2_8fhm00rhFTFw2RGp2KI3cz00','3_0fhm00rhFTFw2RGp2KI3cz00',$
              '2_0fhm00rhFTFw3RGp2KI3cz00flash3','2_2fhm00rhFTFw3RGp2KI3cz00','2_4fhm00rhFTFw3RGp2KI3cz00','2_6fhm00rhFTFw3RGp2KI3cz00','2_8fhm00rhFTFw3RGp2KI3cz00','3_0fhm00rhFTFw3RGp2KI3cz00',$
              '2_0fhm00rhFTFw4RGp2KI3cz00flash3','2_2fhm00rhFTFw4RGp2KI3cz00','2_4fhm00rhFTFw4RGp2KI3cz00','2_6fhm00rhFTFw4RGp2KI3cz00','2_8fhm00rhFTFw4RGp2KI3cz00','3_0fhm00rhFTFw4RGp2KI3cz00',$
              '2_0fhm00rhFTFw5RGp2KI3cz00flash3','2_2fhm00rhFTFw5RGp2KI3cz00','2_4fhm00rhFTFw5RGp2KI3cz00','2_6fhm00rhFTFw5RGp2KI3cz00','2_8fhm00rhFTFw5RGp2KI3cz00','3_0fhm00rhFTFw5RGp2KI3cz00',$
                                                 '2_2fhm00rhFTFw6RGp2KI3cz00','2_4fhm00rhFTFw6RGp2KI3cz00','2_6fhm00rhFTFw6RGp2KI3cz00','2_8fhm00rhFTFw6RGp2KI3cz00','3_0fhm00rhFTFw6RGp2KI3cz00']           
    outfile= 'KawSBm00'
    outtext=''
    textperrun=['20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                        '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
if gtype eq 'Reimers' then begin
     xmin=1.9
     xmax=3.1
     ymin=0.001
     ymax=1.0
endif

endif

if type eq 'Kawcz20m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_0fhm00rhFTFw0RGp2KI3cz20flash3','2_2fhm00rhFTFw0RGp2KI3cz20','2_4fhm00rhFTFw0RGp2KI3cz20','2_6fhm00rhFTFw0RGp2KI3cz20','2_8fhm00rhFTFw0RGp2KI3cz20','3_0fhm00rhFTFw0RGp2KI3cz20',$
              '2_0fhm00rhFTFw1RGp2KI3cz20flash3','2_2fhm00rhFTFw1RGp2KI3cz20','2_4fhm00rhFTFw1RGp2KI3cz20','2_6fhm00rhFTFw1RGp2KI3cz20','2_8fhm00rhFTFw1RGp2KI3cz20','3_0fhm00rhFTFw1RGp2KI3cz20',$
              '2_0fhm00rhFTFw2RGp2KI3cz20flash3','2_2fhm00rhFTFw2RGp2KI3cz20','2_4fhm00rhFTFw2RGp2KI3cz20','2_6fhm00rhFTFw2RGp2KI3cz20','2_8fhm00rhFTFw2RGp2KI3cz20','3_0fhm00rhFTFw2RGp2KI3cz20',$
              '2_0fhm00rhFTFw3RGp2KI3cz20flash3','2_2fhm00rhFTFw3RGp2KI3cz20','2_4fhm00rhFTFw3RGp2KI3cz20','2_6fhm00rhFTFw3RGp2KI3cz20','2_8fhm00rhFTFw3RGp2KI3cz20','3_0fhm00rhFTFw3RGp2KI3cz20',$
              '2_0fhm00rhFTFw4RGp2KI3cz20flash3','2_2fhm00rhFTFw4RGp2KI3cz20','2_4fhm00rhFTFw4RGp2KI3cz20','2_6fhm00rhFTFw4RGp2KI3cz20','2_8fhm00rhFTFw4RGp2KI3cz20','3_0fhm00rhFTFw4RGp2KI3cz20',$
              '2_0fhm00rhFTFw5RGp2KI3cz20flash3','2_2fhm00rhFTFw5RGp2KI3cz20','2_4fhm00rhFTFw5RGp2KI3cz20','2_6fhm00rhFTFw5RGp2KI3cz20','2_8fhm00rhFTFw5RGp2KI3cz20','3_0fhm00rhFTFw5RGp2KI3cz20',$
                                                 '2_2fhm00rhFTFw6RGp2KI3cz20','2_4fhm00rhFTFw6RGp2KI3cz20','2_6fhm00rhFTFw6RGp2KI3cz20','2_8fhm00rhFTFw6RGp2KI3cz20','3_0fhm00rhFTFw6RGp2KI3cz20']           
    outfile= 'Kawcz20m00'
    outtext=''
    textperrun=['20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                        '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif

if type eq 'PMMSBm00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_0fhm00rhFTFw0RGp2VI3cz00flash3','2_2fhm00rhFTFw0RGp2VI3cz00','2_4fhm00rhFTFw0RGp2VI3cz00','2_6fhm00rhFTFw0RGp2VI3cz00','2_8fhm00rhFTFw0RGp2VI3cz00','3_0fhm00rhFTFw0RGp2VI3cz00',$
              '2_0fhm00rhFTFw1RGp2VI3cz00flash3','2_2fhm00rhFTFw1RGp2VI3cz00','2_4fhm00rhFTFw1RGp2VI3cz00','2_6fhm00rhFTFw1RGp2VI3cz00','2_8fhm00rhFTFw1RGp2VI3cz00','3_0fhm00rhFTFw1RGp2VI3cz00',$
              '2_0fhm00rhFTFw2RGp2VI3cz00flash3','2_2fhm00rhFTFw2RGp2VI3cz00','2_4fhm00rhFTFw2RGp2VI3cz00','2_6fhm00rhFTFw2RGp2VI3cz00','2_8fhm00rhFTFw2RGp2VI3cz00','3_0fhm00rhFTFw2RGp2VI3cz00',$
              '2_0fhm00rhFTFw3RGp2VI3cz00flash3','2_2fhm00rhFTFw3RGp2VI3cz00','2_4fhm00rhFTFw3RGp2VI3cz00','2_6fhm00rhFTFw3RGp2VI3cz00','2_8fhm00rhFTFw3RGp2VI3cz00','3_0fhm00rhFTFw3RGp2VI3cz00',$
              '2_0fhm00rhFTFw4RGp2VI3cz00flash3','2_2fhm00rhFTFw4RGp2VI3cz00','2_4fhm00rhFTFw4RGp2VI3cz00','2_6fhm00rhFTFw4RGp2VI3cz00','2_8fhm00rhFTFw4RGp2VI3cz00','3_0fhm00rhFTFw4RGp2VI3cz00',$
              '2_0fhm00rhFTFw5RGp2VI3cz00flash3','2_2fhm00rhFTFw5RGp2VI3cz00','2_4fhm00rhFTFw5RGp2VI3cz00','2_6fhm00rhFTFw5RGp2VI3cz00','2_8fhm00rhFTFw5RGp2VI3cz00','3_0fhm00rhFTFw5RGp2VI3cz00',$
                                                 '2_2fhm00rhFTFw6RGp2VI3cz00','2_4fhm00rhFTFw6RGp2VI3cz00','2_6fhm00rhFTFw6RGp2VI3cz00','2_8fhm00rhFTFw6RGp2VI3cz00','3_0fhm00rhFTFw6RGp2VI3cz00']           
    outfile= 'PMMSBm00'
    outtext=''
    textperrun=['20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                        '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
if gtype eq 'RotLogg' then begin
   xmin=3.5
   xmax=2.0
   ymin=400
   ymax=4
endif

endif

if type eq 'PMMSBm303' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_0fhm03rhFTFw0RGp2VI3cz00flash2','2_2fhm03rhFTFw0RGp2VI3cz00','2_4fhm03rhFTFw0RGp2VI3cz00','2_6fhm03rhFTFw0RGp2VI3cz00','2_8fhm03rhFTFw0RGp2VI3cz00','3_0fhm03rhFTFw0RGp2VI3cz00',$
              '2_0fhm03rhFTFw1RGp2VI3cz00','2_2fhm03rhFTFw1RGp2VI3cz00','2_4fhm03rhFTFw1RGp2VI3cz00','2_6fhm03rhFTFw1RGp2VI3cz00','2_8fhm03rhFTFw1RGp2VI3cz00','3_0fhm03rhFTFw1RGp2VI3cz00',$
              '2_0fhm03rhFTFw2RGp2VI3cz00flash2','2_2fhm03rhFTFw2RGp2VI3cz00','2_4fhm03rhFTFw2RGp2VI3cz00','2_6fhm03rhFTFw2RGp2VI3cz00','2_8fhm03rhFTFw2RGp2VI3cz00','3_0fhm03rhFTFw2RGp2VI3cz00',$
              '2_0fhm03rhFTFw3RGp2VI3cz00flash2','2_2fhm03rhFTFw3RGp2VI3cz00','2_4fhm03rhFTFw3RGp2VI3cz00','2_6fhm03rhFTFw3RGp2VI3cz00','2_8fhm03rhFTFw3RGp2VI3cz00','3_0fhm03rhFTFw3RGp2VI3cz00',$
              '2_0fhm03rhFTFw4RGp2VI3cz00flash2','2_2fhm03rhFTFw4RGp2VI3cz00','2_4fhm03rhFTFw4RGp2VI3cz00','2_6fhm03rhFTFw4RGp2VI3cz00','2_8fhm03rhFTFw4RGp2VI3cz00','3_0fhm03rhFTFw4RGp2VI3cz00',$
              '2_0fhm03rhFTFw5RGp2VI3cz00flash2','2_2fhm03rhFTFw5RGp2VI3cz00','2_4fhm03rhFTFw5RGp2VI3cz00','2_6fhm03rhFTFw5RGp2VI3cz00','2_8fhm03rhFTFw5RGp2VI3cz00','3_0fhm03rhFTFw5RGp2VI3cz00',$
              '2_0fhm03rhFTFw6RGp2VI3cz00','2_2fhm03rhFTFw6RGp2VI3cz00','2_4fhm03rhFTFw6RGp2VI3cz00','2_6fhm03rhFTFw6RGp2VI3cz00','2_8fhm03rhFTFw6RGp2VI3cz00','3_0fhm03rhFTFw6RGp2VI3cz00',$
	      '2_0fhm00rhFTFw0RGp2VI3cz00flash3','2_2fhm00rhFTFw0RGp2VI3cz00','2_4fhm00rhFTFw0RGp2VI3cz00','2_6fhm00rhFTFw0RGp2VI3cz00','2_8fhm00rhFTFw0RGp2VI3cz00','3_0fhm00rhFTFw0RGp2VI3cz00',$
              '2_0fhm00rhFTFw1RGp2VI3cz00flash3','2_2fhm00rhFTFw1RGp2VI3cz00','2_4fhm00rhFTFw1RGp2VI3cz00','2_6fhm00rhFTFw1RGp2VI3cz00','2_8fhm00rhFTFw1RGp2VI3cz00','3_0fhm00rhFTFw1RGp2VI3cz00',$
              '2_0fhm00rhFTFw2RGp2VI3cz00flash3','2_2fhm00rhFTFw2RGp2VI3cz00','2_4fhm00rhFTFw2RGp2VI3cz00','2_6fhm00rhFTFw2RGp2VI3cz00','2_8fhm00rhFTFw2RGp2VI3cz00','3_0fhm00rhFTFw2RGp2VI3cz00',$
              '2_0fhm00rhFTFw3RGp2VI3cz00flash3','2_2fhm00rhFTFw3RGp2VI3cz00','2_4fhm00rhFTFw3RGp2VI3cz00','2_6fhm00rhFTFw3RGp2VI3cz00','2_8fhm00rhFTFw3RGp2VI3cz00','3_0fhm00rhFTFw3RGp2VI3cz00',$
              '2_0fhm00rhFTFw4RGp2VI3cz00flash3','2_2fhm00rhFTFw4RGp2VI3cz00','2_4fhm00rhFTFw4RGp2VI3cz00','2_6fhm00rhFTFw4RGp2VI3cz00','2_8fhm00rhFTFw4RGp2VI3cz00','3_0fhm00rhFTFw4RGp2VI3cz00',$
              '2_0fhm00rhFTFw5RGp2VI3cz00flash3','2_2fhm00rhFTFw5RGp2VI3cz00','2_4fhm00rhFTFw5RGp2VI3cz00','2_6fhm00rhFTFw5RGp2VI3cz00','2_8fhm00rhFTFw5RGp2VI3cz00','3_0fhm00rhFTFw5RGp2VI3cz00',$
                                                 '2_2fhm00rhFTFw6RGp2VI3cz00','2_4fhm00rhFTFw6RGp2VI3cz00','2_6fhm00rhFTFw6RGp2VI3cz00','2_8fhm00rhFTFw6RGp2VI3cz00','3_0fhm00rhFTFw6RGp2VI3cz00', $
	      '2_0fhp03rhFTFw0RGp2VI3cz00','2_2fhp03rhFTFw0RGp2VI3cz00','2_4fhp03rhFTFw0RGp2VI3cz00','2_6fhp03rhFTFw0RGp2VI3cz00','2_8fhp03rhFTFw0RGp2VI3cz00','3_0fhp03rhFTFw0RGp2VI3cz00',$
              '2_0fhp03rhFTFw1RGp2VI3cz00','2_2fhp03rhFTFw1RGp2VI3cz00','2_4fhp03rhFTFw1RGp2VI3cz00','2_6fhp03rhFTFw1RGp2VI3cz00','2_8fhp03rhFTFw1RGp2VI3cz00','3_0fhp03rhFTFw1RGp2VI3cz00',$
              '2_0fhp03rhFTFw2RGp2VI3cz00flash','2_2fhp03rhFTFw2RGp2VI3cz00','2_4fhp03rhFTFw2RGp2VI3cz00','2_6fhp03rhFTFw2RGp2VI3cz00','2_8fhp03rhFTFw2RGp2VI3cz00','3_0fhp03rhFTFw2RGp2VI3cz00',$
              '2_0fhp03rhFTFw3RGp2VI3cz00flash','2_2fhp03rhFTFw3RGp2VI3cz00','2_4fhp03rhFTFw3RGp2VI3cz00','2_6fhp03rhFTFw3RGp2VI3cz00','2_8fhp03rhFTFw3RGp2VI3cz00','3_0fhp03rhFTFw3RGp2VI3cz00',$
              '2_0fhp03rhFTFw4RGp2VI3cz00','2_2fhp03rhFTFw4RGp2VI3cz00','2_4fhp03rhFTFw4RGp2VI3cz00','2_6fhp03rhFTFw4RGp2VI3cz00','2_8fhp03rhFTFw4RGp2VI3cz00','3_0fhp03rhFTFw4RGp2VI3cz00',$
              '2_0fhp03rhFTFw5RGp2VI3cz00flash','2_2fhp03rhFTFw5RGp2VI3cz00','2_4fhp03rhFTFw5RGp2VI3cz00','2_6fhp03rhFTFw5RGp2VI3cz00','2_8fhp03rhFTFw5RGp2VI3cz00','3_0fhp03rhFTFw5RGp2VI3cz00',$
              '2_0fhp03rhFTFw6RGp2VI3cz00','2_2fhp03rhFTFw6RGp2VI3cz00','2_4fhp03rhFTFw6RGp2VI3cz00','2_6fhp03rhFTFw6RGp2VI3cz00','2_8fhp03rhFTFw6RGp2VI3cz00','3_0fhp03rhFTFw6RGp2VI3cz00']           
    outfile= 'PMMSBm303'
    outtext=''
    textperrun=['20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6',$
		'20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                        '22w6', '24w6', '26w6', '28w6', '30w6',$
	        '20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif


if type eq 'PMMcz20m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_0fhm00rhFTFw0RGp2VI3cz20flash3','2_2fhm00rhFTFw0RGp2VI3cz20','2_4fhm00rhFTFw0RGp2VI3cz20','2_6fhm00rhFTFw0RGp2VI3cz20','2_8fhm00rhFTFw0RGp2VI3cz20','3_0fhm00rhFTFw0RGp2VI3cz20',$
	      '2_0fhm00rhFTFw1RGp2VI3cz20flash3','2_2fhm00rhFTFw1RGp2VI3cz20','2_4fhm00rhFTFw1RGp2VI3cz20','2_6fhm00rhFTFw1RGp2VI3cz20','2_8fhm00rhFTFw1RGp2VI3cz20','3_0fhm00rhFTFw1RGp2VI3cz20',$
              '2_0fhm00rhFTFw2RGp2VI3cz20flash3','2_2fhm00rhFTFw2RGp2VI3cz20','2_4fhm00rhFTFw2RGp2VI3cz20','2_6fhm00rhFTFw2RGp2VI3cz20','2_8fhm00rhFTFw2RGp2VI3cz20','3_0fhm00rhFTFw2RGp2VI3cz20',$
              '2_0fhm00rhFTFw3RGp2VI3cz20flash3','2_2fhm00rhFTFw3RGp2VI3cz20','2_4fhm00rhFTFw3RGp2VI3cz20','2_6fhm00rhFTFw3RGp2VI3cz20','2_8fhm00rhFTFw3RGp2VI3cz20','3_0fhm00rhFTFw3RGp2VI3cz20',$
              '2_0fhm00rhFTFw4RGp2VI3cz20flash3','2_2fhm00rhFTFw4RGp2VI3cz20','2_4fhm00rhFTFw4RGp2VI3cz20','2_6fhm00rhFTFw4RGp2VI3cz20','2_8fhm00rhFTFw4RGp2VI3cz20','3_0fhm00rhFTFw4RGp2VI3cz20',$
              '2_0fhm00rhFTFw5RGp2VI3cz20flash3','2_2fhm00rhFTFw5RGp2VI3cz20','2_4fhm00rhFTFw5RGp2VI3cz20','2_6fhm00rhFTFw5RGp2VI3cz20','2_8fhm00rhFTFw5RGp2VI3cz20','3_0fhm00rhFTFw5RGp2VI3cz20',$
                                                 '2_2fhm00rhFTFw6RGp2VI3cz20','2_4fhm00rhFTFw6RGp2VI3cz20','2_6fhm00rhFTFw6RGp2VI3cz20','2_8fhm00rhFTFw6RGp2VI3cz20','3_0fhm00rhFTFw6RGp2VI3cz20']           
    outfile= 'PMMcz20m00'
    outtext=''
    textperrun=['20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                        '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif

if type eq 'PMMcz10m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
              '2_0fhm00rhFTFw6RGp2VI3cz10','2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10']           
    outfile= 'PMMcz10m00'
    outtext=''
    textperrun=['20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif

if type eq 'PMMcz10m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
              '2_0fhm00rhFTFw6RGp2VI3cz10','2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10']           
    outfile= 'PMMcz10m00'
    outtext=''
    textperrun=['20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif
if type eq 'PMMcz10m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
              '2_0fhm00rhFTFw6RGp2VI3cz10','2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10']           
    outfile= 'PMMcz10m00'
    outtext=''
    textperrun=['20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif
if type eq 'PMMcz10m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
              '2_0fhm00rhFTFw6RGp2VI3cz10','2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10']           
    outfile= 'PMMcz10m00'
    outtext=''
    textperrun=['20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif
if type eq 'PMMcz10m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
              '2_0fhm00rhFTFw6RGp2VI3cz10','2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10']           
    outfile= 'PMMcz10m00'
    outtext=''
    textperrun=['20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif
if type eq 'PMMcz10m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
              '2_0fhm00rhFTFw6RGp2VI3cz10','2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10']           
    outfile= 'PMMcz10m00'
    outtext=''
    textperrun=['20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif
if type eq 'PMMcz10m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
              '2_0fhm00rhFTFw6RGp2VI3cz10','2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10']           
    outfile= 'PMMcz10m00'
    outtext=''
    textperrun=['20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif
if type eq 'PMMcz10m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
              '2_0fhm00rhFTFw6RGp2VI3cz10','2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10']           
    outfile= 'PMMcz10m00'
    outtext=''
    textperrun=['20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif
if type eq 'PMMcz10m00' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
              '2_0fhm00rhFTFw6RGp2VI3cz10','2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10']           
    outfile= 'PMMcz10m00'
    outtext=''
    textperrun=['20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif
if type eq 'PMMcz10m303' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_0fhm03rhFTFw0RGp2VI3cz10flash2','2_2fhm03rhFTFw0RGp2VI3cz10','2_4fhm03rhFTFw0RGp2VI3cz10','2_6fhm03rhFTFw0RGp2VI3cz10','2_8fhm03rhFTFw0RGp2VI3cz10','3_0fhm03rhFTFw0RGp2VI3cz10',$
              '2_0fhm03rhFTFw1RGp2VI3cz10','2_2fhm03rhFTFw1RGp2VI3cz10','2_4fhm03rhFTFw1RGp2VI3cz10','2_6fhm03rhFTFw1RGp2VI3cz10','2_8fhm03rhFTFw1RGp2VI3cz10','3_0fhm03rhFTFw1RGp2VI3cz10',$
              '2_0fhm03rhFTFw2RGp2VI3cz10flash2','2_2fhm03rhFTFw2RGp2VI3cz10','2_4fhm03rhFTFw2RGp2VI3cz10','2_6fhm03rhFTFw2RGp2VI3cz10','2_8fhm03rhFTFw2RGp2VI3cz10','3_0fhm03rhFTFw2RGp2VI3cz10',$
              '2_0fhm03rhFTFw3RGp2VI3cz10flash4','2_2fhm03rhFTFw3RGp2VI3cz10','2_4fhm03rhFTFw3RGp2VI3cz10','2_6fhm03rhFTFw3RGp2VI3cz10','2_8fhm03rhFTFw3RGp2VI3cz10','3_0fhm03rhFTFw3RGp2VI3cz10',$
              '2_0fhm03rhFTFw4RGp2VI3cz10flash4','2_2fhm03rhFTFw4RGp2VI3cz10','2_4fhm03rhFTFw4RGp2VI3cz10','2_6fhm03rhFTFw4RGp2VI3cz10','2_8fhm03rhFTFw4RGp2VI3cz10','3_0fhm03rhFTFw4RGp2VI3cz10',$
              '2_0fhm03rhFTFw5RGp2VI3cz10flash4','2_2fhm03rhFTFw5RGp2VI3cz10','2_4fhm03rhFTFw5RGp2VI3cz10','2_6fhm03rhFTFw5RGp2VI3cz10','2_8fhm03rhFTFw5RGp2VI3cz10','3_0fhm03rhFTFw5RGp2VI3cz10',$
              '2_0fhm03rhFTFw6RGp2VI3cz10','2_2fhm03rhFTFw6RGp2VI3cz10','2_4fhm03rhFTFw6RGp2VI3cz10','2_6fhm03rhFTFw6RGp2VI3cz10','2_8fhm03rhFTFw6RGp2VI3cz10','3_0fhm03rhFTFw6RGp2VI3cz10', $

              '2_0fhm00rhFTFw0RGp2VI3cz10flash2','2_2fhm00rhFTFw0RGp2VI3cz10','2_4fhm00rhFTFw0RGp2VI3cz10','2_6fhm00rhFTFw0RGp2VI3cz10','2_8fhm00rhFTFw0RGp2VI3cz10','3_0fhm00rhFTFw0RGp2VI3cz10',$
              '2_0fhm00rhFTFw1RGp2VI3cz10','2_2fhm00rhFTFw1RGp2VI3cz10','2_4fhm00rhFTFw1RGp2VI3cz10','2_6fhm00rhFTFw1RGp2VI3cz10','2_8fhm00rhFTFw1RGp2VI3cz10','3_0fhm00rhFTFw1RGp2VI3cz10',$
              '2_0fhm00rhFTFw2RGp2VI3cz10flash2','2_2fhm00rhFTFw2RGp2VI3cz10','2_4fhm00rhFTFw2RGp2VI3cz10','2_6fhm00rhFTFw2RGp2VI3cz10','2_8fhm00rhFTFw2RGp2VI3cz10','3_0fhm00rhFTFw2RGp2VI3cz10',$
              '2_0fhm00rhFTFw3RGp2VI3cz10flash4','2_2fhm00rhFTFw3RGp2VI3cz10','2_4fhm00rhFTFw3RGp2VI3cz10','2_6fhm00rhFTFw3RGp2VI3cz10','2_8fhm00rhFTFw3RGp2VI3cz10','3_0fhm00rhFTFw3RGp2VI3cz10',$
              '2_0fhm00rhFTFw4RGp2VI3cz10flash4','2_2fhm00rhFTFw4RGp2VI3cz10','2_4fhm00rhFTFw4RGp2VI3cz10','2_6fhm00rhFTFw4RGp2VI3cz10','2_8fhm00rhFTFw4RGp2VI3cz10','3_0fhm00rhFTFw4RGp2VI3cz10',$
              '2_0fhm00rhFTFw5RGp2VI3cz10flash4','2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10','2_6fhm00rhFTFw5RGp2VI3cz10','2_8fhm00rhFTFw5RGp2VI3cz10','3_0fhm00rhFTFw5RGp2VI3cz10',$
                                         '2_2fhm00rhFTFw6RGp2VI3cz10','2_4fhm00rhFTFw6RGp2VI3cz10','2_6fhm00rhFTFw6RGp2VI3cz10','2_8fhm00rhFTFw6RGp2VI3cz10','3_0fhm00rhFTFw6RGp2VI3cz10',$

              '2_0fhp03rhFTFw0RGp2VI3cz10','2_2fhp03rhFTFw0RGp2VI3cz10','2_4fhp03rhFTFw0RGp2VI3cz10','2_6fhp03rhFTFw0RGp2VI3cz10','2_8fhp03rhFTFw0RGp2VI3cz10','3_0fhp03rhFTFw0RGp2VI3cz10',$
              '2_0fhp03rhFTFw1RGp2VI3cz10','2_2fhp03rhFTFw1RGp2VI3cz10','2_4fhp03rhFTFw1RGp2VI3cz10','2_6fhp03rhFTFw1RGp2VI3cz10','2_8fhp03rhFTFw1RGp2VI3cz10','3_0fhp03rhFTFw1RGp2VI3cz10',$
              '2_0fhp03rhFTFw2RGp2VI3cz10','2_2fhp03rhFTFw2RGp2VI3cz10','2_4fhp03rhFTFw2RGp2VI3cz10','2_6fhp03rhFTFw2RGp2VI3cz10','2_8fhp03rhFTFw2RGp2VI3cz10','3_0fhp03rhFTFw2RGp2VI3cz10',$
              '2_0fhp03rhFTFw3RGp2VI3cz10','2_2fhp03rhFTFw3RGp2VI3cz10','2_4fhp03rhFTFw3RGp2VI3cz10','2_6fhp03rhFTFw3RGp2VI3cz10','2_8fhp03rhFTFw3RGp2VI3cz10','3_0fhp03rhFTFw3RGp2VI3cz10',$
              '2_0fhp03rhFTFw4RGp2VI3cz10','2_2fhp03rhFTFw4RGp2VI3cz10','2_4fhp03rhFTFw4RGp2VI3cz10','2_6fhp03rhFTFw4RGp2VI3cz10','2_8fhp03rhFTFw4RGp2VI3cz10','3_0fhp03rhFTFw4RGp2VI3cz10',$
              '2_0fhp03rhFTFw5RGp2VI3cz10','2_2fhp03rhFTFw5RGp2VI3cz10','2_4fhp03rhFTFw5RGp2VI3cz10','2_6fhp03rhFTFw5RGp2VI3cz10','2_8fhp03rhFTFw5RGp2VI3cz10','3_0fhp03rhFTFw5RGp2VI3cz10',$
              '2_0fhp03rhFTFw6RGp2VI3cz10','2_2fhp03rhFTFw6RGp2VI3cz10','2_4fhp03rhFTFw6RGp2VI3cz10','2_6fhp03rhFTFw6RGp2VI3cz10','2_8fhp03rhFTFw6RGp2VI3cz10','3_0fhp03rhFTFw6RGp2VI3cz10' $
]           
    outfile= 'PMMcz10m303'
    outtext=''
    textperrun=['20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6', $
	         '20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                        '22w6', '24w6', '26w6', '28w6', '30w6', $
	        '20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5',$
                '20w6', '22w6', '24w6', '26w6', '28w6', '30w6'   ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif






if type eq 'PMMcz10m00find' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh/'
    infiles=[ '2_2fhm00rhFTFw5RGp2VI3cz10','2_4fhm00rhFTFw5RGp2VI3cz10']           
    outfile= 'PMMcz10m00find'
    outtext=''
    textperrun=[ '22w5', '24w5' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
endif


if type eq 'intuitionModel' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '3_0fhm00rhFTFw3RGp2KI3cz00', '3_0fhm00rhFTFw3EoMS'] ;,'2_6fhm00rhFTFw3RGp2KI3cz00flash']

    outfile= 'intuitionModel'
    outtext=''
    textperrun=[$ 
 	' ', ' ' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.5
    xmax=2.0
    ymin=0
    ymax=160
endif

if gtype eq 'CoreR' then begin
     xmin=8
    xmax=15
    ymin=1e3
    ymax=0.1
endif

if gtype eq 'CoreRpub2' then begin
     xmin=1.0
    xmax=100
    ymin=1e4
    ymax=0.01
endif

if gtype eq'Tracknopmspub' then begin
    xmin=3.71;4.1 ;
    xmax=3.63;3.6;
    ymin=1.9 ;1.75
    ymax=2.8;3.0;
endif
if gtype eq 'RotKmspub2' then begin
    xmin=4.5 ;3.1
    xmax=1.0
    ymin=0.0
    ymax=180 ;15
endif
if gtype eq 'CoreRpub2' then begin
     xmin=1 ;10;
     xmax=100;40;
     ymin=3e3;500;
     ymax=7e-0;50;
endif
endif


if type eq 'intuitionModel20max' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '2_0fhm00rhFTFw3RGp2KI3cz00', '2_0fhm00rhFTFw3EoMS'] ;,'2_6fhm00rhFTFw3RGp2KI3cz00flash']

    outfile= 'intuitionModel'
    outtext=''
    textperrun=[$ 
 	' ', ' ' ]  

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.5
    xmax=2.0
    ymin=0
    ymax=160
endif

if gtype eq 'CoreR' then begin
     xmin=8
    xmax=15
    ymin=1e3
    ymax=0.1
endif

if gtype eq 'CoreRpub2' then begin
     xmin=1.0
    xmax=100
    ymin=1e4
    ymax=0.01
endif

if gtype eq'Tracknopmspub' then begin
    xmin=3.71;4.1 ;
    xmax=3.63;3.6;
    ymin=1.9 ;1.75
    ymax=2.8;3.0;
endif
if gtype eq 'RotKmspub2' then begin
    xmin=4.5 ;3.1
    xmax=2.5
    ymin=0.0
    ymax=180 ;15
endif
if gtype eq 'CoreRpub2' then begin
     xmin=1 ;10;
     xmax=100;40;
     ymin=3e3;500;
     ymax=7e-0;50;
endif
endif

if type eq 'samstar' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '2_0fhm03rhFTFw3RGp2VI3cz00','2_0fhm00rhFTFw3RGp2VI3cz00','2_0fhm00rhFTFw3RGp2VI3cz00flash','2_0fhm00rhFTFw3RGp2VI3cz00flash2', $
     '2_0fhm00rhFTFw1RGp2VI3cz00','2_0fhm00rhFTFw1RGp2VI3cz00flash','2_0fhm00rhFTFw1RGp2VI3cz00flash2',$
     '2_0fhm00rhFTFw5RGp2VI3cz00','2_0fhm00rhFTFw5RGp2VI3cz00flash' ] ;,'2_6fhm00rhFTFw3RGp2KI3cz00flash']

    outfile= 'samstar'
    outtext=''
    textperrun=[$ 
 	 '2m3w3',' 2m0w3', ' ',' ']  

if gtype eq 'TeffLogg' then begin
     xmin=5500
     xmax=4500
     ymin=3.5
     ymax=2.5
endif

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKms' then begin
     xmin=4.5
    xmax=2.0
    ymin=0
    ymax=160
endif

if gtype eq 'CoreR' then begin
     xmin=8
    xmax=15
    ymin=1e3
    ymax=0.1
endif

if gtype eq 'CoreRpub2' then begin
     xmin=1.0
    xmax=100
    ymin=1e4
    ymax=0.01
endif

if gtype eq'Tracknopmspub' then begin
    xmin=3.71;4.1 ;
    xmax=3.63;3.6;
    ymin=1.9 ;1.75
    ymax=2.8;3.0;
endif
if gtype eq 'RotKmspub2' then begin
    xmin=3.5 ;3.1
    xmax=2.5
    ymin=0.0
    ymax=15 ;15
endif
if gtype eq 'CoreRpub2' then begin
     xmin=1 ;10;
     xmax=100;40;
     ymin=3e3;500;
     ymax=7e-0;50;
endif
endif



if type eq 'intuitionglitchModelSTOP' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '3_0fhm00rhFTFw6RGp2KI3cz00STOP'] ;,'2_6fhm00rhFTFw3RGp2KI3cz00flash']

    outfile= 'intuitionglitchModelSTOP'
    outtext=''
    textperrun=[$ 
 	' ', ' ' ]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-8
     ymax=1e-2
endif
endif

if type eq 'intuitionglitchModelSTOP2' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '3_0fhm00rhFTFw6RGp2KI3cz00STOP2'] ;,'2_6fhm00rhFTFw3RGp2KI3cz00flash']

    outfile= 'intuitionglitchModelSTOP2'
    outtext=''
    textperrun=[$ 
 	' ', ' ' ]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-8
     ymax=1e-2
endif
endif


if type eq 'intuitionModelSTOP' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '3_0fhm00rhFTFw3RGp2KI3cz00STOP'] ;,'2_6fhm00rhFTFw3RGp2KI3cz00flash']

    outfile= 'intuitionModelSTOP'
    outtext=''
    textperrun=[$ 
 	' ', ' ' ]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
     xmax=1.0
     ymin=1e-8
     ymax=1e-2
endif

if gtype eq 'RotKms' then begin
     xmin=4.5
    xmax=2.0
    ymin=0
    ymax=160
endif

if gtype eq 'CoreR' then begin
     xmin=8
    xmax=15
    ymin=1e3
    ymax=0.1
endif

if gtype eq 'CoreRpub2' then begin
     xmin=1.0
    xmax=100
    ymin=1e4
    ymax=0.01
endif

if gtype eq'Tracknopmspub' then begin
    xmin=3.71;4.1 ;
    xmax=3.63;3.6;
    ymin=1.9 ;1.75
    ymax=2.8;3.0;
endif
if gtype eq'TracknopmsTess' then begin
    xmin=6000;4.1 ;
    xmax=4000;3.6;
    ymin=1;.75
    ymax=10 ;2.8;3.0;
endif
if gtype eq 'RotKmspub2' then begin
    xmin=4.5 ;3.1
    xmax=1.0
    ymin=0.0
    ymax=180 ;15
endif
if gtype eq 'CoreRpub2' then begin
     xmin=1 ;10;
     xmax=100;40;
     ymin=3e3;500;
     ymax=7e-2;50;
endif
endif


if type eq 'flash20' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '2_0fhm00rhFTFw3RGp2KI3cz00', '2_0fhm00rhFTFw3RGp2KI3cz00flash']           
;print, outfile
    outfile= 'flash20'
    outtext=''
    textperrun=[ 'pre', 'K00']  

if gtype eq 'Deg' then begin
    xmin=1.175
    xmax=1.18
    ymin=1
    ymax=1E1
endif

endif

if type eq 'flash20w1' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '2_0fhm00rhFTFw1RGp2KI3cz00flash2', '2_0fhm00rhFTFw1RGp2VI3cz00flash2','2_0fhm00rhFTFw1RGp2KI3cz20flash2','2_0fhm00rhFTFw2RGp2VI3cz20flash2']           
;print, outfile
    outfile= 'flash20w1'
    outtext=''
    textperrun=[ 'K00', 'V00','K20', 'V20']  

if gtype eq 'Deg' then begin
    xmin=1.1
    xmax=1.5
    ymin=1
    ymax=1E2
endif

if gtype eq 'TeffLogg' then begin
    xmin=1.1
    xmax=1.5
    ymin=1
    ymax=1E2
endif

endif

if type eq 'I00check' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw6RGp2KI3cz00', '3_0fhm00rhFTFw6RGp2KI0cz00','2_8fhm00rhFTFw6RGp2KI3cz00', '2_8fhm00rhFTFw6RGp2KI0cz00']           
    outfile= 'I00check'
    outtext=''
    textperrun=['KawSB', 'PMMSB', 'KawSB', 'PMMSB']  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=10
    ymax=30
endif

if gtype eq 'RotKms' then begin
     xmin=3.0
    xmax=2.0
    ymin=10
    ymax=25
endif

endif

if type eq 'diffrotcheck' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_4fhm00rhFTFw3RGp2VI3cz00', '2_4fhm00rhFTFw3RGp2VI3cz10', '2_4fhm00rhFTFw3RGp2VI3cz20']           
    outfile= 'diffrotcheck'
    outtext=''
    textperrun=['cz00', 'cz10', 'cz20']  

if gtype eq 'RotKms' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=15
endif

endif



if type eq 'layersSTOP' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_4fhm00rhFTFw3RGp2FI3cz00STOP', '2_4fhm00rhFTFw3RGp2FI3cz10STOP', '2_4fhm00rhFTFw3RGp2FI3cz20STOP']           
    outfile= 'layersSTOP'
    outtext=''
    textperrun=['cz00', 'cz10', 'cz20']  

if gtype eq 'RotLayers' then begin
     xmin=0.001
    xmax=1.0
    ymin=3E-7
    ymax=1E-5
endif

endif

if type eq 'layersSTOPIs' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_4fhm00rhFTFw3RGp2FI0cz20STOP', '2_4fhm00rhFTFw3RGp2FI2cz20STOP', '2_4fhm00rhFTFw3RGp2FI3cz20STOP']           
    outfile= 'layersSTOPIs'
    outtext=''
    textperrun=['I0', 'I2', 'I3']  

if gtype eq 'RotLayers' then begin
     xmin=0.001
    xmax=1.0
    ymin=3E-7
    ymax=1E-2
endif

endif


if type eq 'layersSTOPIs3M' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw3RGp2KI3cz20', '3_0fhm00rhFTFw3RGp2FI2cz20', '3_0fhm00rhFTFw3RGp2FI3cz20','3_0fhm00rhFTFw1RGp2KI3cz20']           
    outfile= 'layersSTOPIs3M'
    outtext=''
    textperrun=['Kaw', 'I2', 'I3','w1']  

if gtype eq 'RotLayers' then begin
     xmin=0.001
    xmax=1.0
    ymin=3E-9
    ymax=3E-5
endif

endif


if type eq 'layersSTOPIs3Mw1' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw1RGp2KI3cz20', '3_0fhm00rhFTFw1RGp2FI2cz20', '3_0fhm00rhFTFw1RGp2FI3cz20']           
    outfile= 'layersSTOPIs3Mw1'
    outtext=''
    textperrun=['Kaw', 'I2', 'I3']  

if gtype eq 'RotLayers' then begin
     xmin=0.001
    xmax=1.0
    ymin=3E-9
    ymax=3E-5
endif

if gtype eq 'TeffLogg' then begin
     xmin=4420
    xmax=4300
    ymin=1.9
    ymax=1.8
endif

endif

if type eq 'SurfsMkawsb' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ $
     '2_0fhm00rhFTFw3RGp2KI3cz00flash2','2_2fhm00rhFTFw3RGp2KI3cz00','2_4fhm00rhFTFw3RGp2KI3cz00','2_6fhm00rhFTFw3RGp2KI3cz00','2_8fhm00rhFTFw3RGp2KI3cz00','3_0fhm00rhFTFw3RGp2KI3cz00'$
]           
;print, outfile
    outfile= 'surfsMkawsb'
    outtext=''
    textperrun=[$ 
'KawSB', 'KawSB','KawSB','KawSB','KawSB','KawSB']  

if gtype eq 'CN' then begin
    xmin=3.2
    xmax=1.8
    ymin=-1.0
    ymax=0.3
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=350
     ymax=25
endif

if gtype eq 'RotKmsM' then begin
     xmin=1.95
    xmax=3.0
    ymin=1
    ymax=20
endif
if gtype eq 'Deg' then begin
    xmin=.5
    xmax=1.0
    ymin=.01
    ymax=100
endif
if gtype eq'RotRatio' then begin
    xmin=3.2
    xmax=2.5
    ymin=0.5
    ymax=50
endif
if gtype eq'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=0.8
    ymax=3.0
endif
if gtype eq'JdotM' then begin
    xmin=1.95 ;2.0
    xmax=3.0
    ymin=1D5
    ymax=1D15
endif
endif



if type eq 'fehcheck' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_4fhm03rhFTFw4RGp2KI3cz20', '2_4fhm00rhFTFw4RGp2KI3cz20','2_4fhp03rhFTFw4RGp2KI3cz20']           
    outfile= 'fehcheck'
    outtext=''
    textperrun=['m03', 'm00', 'p03']  

if gtype eq 'RotKmspub2' then begin
     xmin=3.0
    xmax=2.2
    ymin=0
    ymax=10
endif

endif


if type eq 'MarcModels' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= ''
    infiles=[ $
     '~/EVOLUTION/output/RotGrid_rh2/2_0fhm00rhFTFw1RGp2VI3cz00','~/EVOLUTION/output/RotGrid_rh2/2_0fhm00rhFTFw1RGp2VI3cz00flash', $ ; stops bf flash, gets through flash
      '~/EVOLUTION/output/RotGrid_rh2/2_0fhm00rhFTFw1RGp2VI3cz00flash2', $ ;(flash2 crashed in later stages of He burning)
     '~/EVOLUTION/output/RotGrid_rh2/2_0fhm00rhFTFw3RGp2VI3cz00','~/EVOLUTION/output/RotGrid_rh2/2_0fhm00rhFTFw3RGp2VI3cz00flash',$ ;bad- didnt get through flash
     '~/EVOLUTION/output/RotGrid_rh2/3_0fhm00rhFTFw5RGp2VI3cz00', $ ; good through he burning
     '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m100fhm000y273a17al00_grnodf',$  ;good to tip
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m060fhm200y273a17al00_grnodf', $ ; good to tip
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m260fhm200y273a17al00_grnodf', $ ; good blue loops
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m060fhp060y273a17al00_grnodf', $ ; crash on lower gb
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m260fhp060y273a17al00_grnodf' $ ; good to ~end of he burning
] ;,'2_6fhm00rhFTFw3RGp2KI3cz00flash']

    outfile= 'MarcModels'
    outtext=''
    textperrun=[$ 
 	 '2w1','2w1f', '2w1f2', '2w3', '2w3f','3w5', '10m00', '06m20', '26m20', '06p06', '26p06' ]  

if gtype eq 'TeffLogg' then begin
     xmin=8500
     xmax=2500
     ymin=5.0
     ymax=-1.0
endif
if gtype eq 'Deg' then begin
     xmin=0
     xmax=5
     ymin=.01
     ymax=100
endif

endif


if type eq 'I2referee' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw1RGp2FI2cz20', '3_0fhm00rhFTFw1RGp2FI2cz20', $
;'3_0fhm00rhFTFw1RGp2FI2cz20_STOPrgb','3_0fhm00rhFTFw1RGp2FI2cz20_STOPtip', 
'3_0fhm00rhFTFw1RGp2FI2cz20_STOPzahb', '3_0fhm00rhFTFw1RGp2FI2cz20_STOPheburn',$
;'3_0fhm00rhFTFw1RGp2FI3cz20_STOPrgb','3_0fhm00rhFTFw1RGp2FI3cz20_STOPtip',
 '3_0fhm00rhFTFw1RGp2FI3cz20_STOPzahb', '3_0fhm00rhFTFw1RGp2FI3cz20_STOPheburn'$
]           
    outfile= 'I2referee'
    outtext=''
    textperrun=[ 'I2', 'I3', $
;'I2rgb', 'I2tip',
 'I2zahb', 'I2heburn',$
;'I3rgb', 'I3tip', 
'I3zahb', 'I3heburn'$
]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
    xmax=1.0
    ymin=3E-9
    ymax=3E-5
endif
if gtype eq 'Track' then begin
    xmin=3.9
    xmax=3.6
    ymin=1.8
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=5200
    xmax=4000
    ymin=3.0
    ymax=1.0
endif

endif

if type eq 'I2refereetip' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw1RGp2FI2cz20_STOPtip', '3_0fhm00rhFTFw1RGp2FI3cz20_STOPtip' $
]           
    outfile= 'I2refereetip'
    outtext=''
    textperrun=[ 'I2', 'I3', $
'I2rgb', 'I2tip', 'I2zahb', 'I2heburn',$
'I3rgb', 'I3tip', 'I3zahb', 'I3heburn'$
]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
    xmax=1.0
    ymin=3E-9
    ymax=3E-5
endif
if gtype eq 'Track' then begin
    xmin=3.9
    xmax=3.6
    ymin=1.8
    ymax=3.5
endif
endif

if type eq 'I2refereezahb' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw1RGp2FI2cz20_STOPzahb', '3_0fhm00rhFTFw1RGp2FI3cz20_STOPzahb' $
]           
    outfile= 'I2refereezahb'
    outtext=''
    textperrun=[ 'I2', 'I3', $
'I2rgb', 'I2tip', 'I2zahb', 'I2heburn',$
'I3rgb', 'I3tip', 'I3zahb', 'I3heburn'$
]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
    xmax=1.0
    ymin=3E-9
    ymax=3E-5
endif
if gtype eq 'Track' then begin
    xmin=3.9
    xmax=3.6
    ymin=1.8
    ymax=3.5
endif
endif



if type eq 'I2refereergb' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw1RGp2FI2cz20_STOPrgb', '3_0fhm00rhFTFw1RGp2FI3cz20_STOPrgb' $
]           
    outfile= 'I2refereergb'
    outtext=''
    textperrun=[ 'I2', 'I3', $
'I2rgb', 'I2tip', 'I2zahb', 'I2heburn',$
'I3rgb', 'I3tip', 'I3zahb', 'I3heburn'$
]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
    xmax=1.0
    ymin=3E-9
    ymax=3E-5
endif
if gtype eq 'Track' then begin
    xmin=3.9
    xmax=3.6
    ymin=1.8
    ymax=3.5
endif
endif

if type eq 'I2refereeheburn' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '3_0fhm00rhFTFw1RGp2FI2cz20_STOPheburn', '3_0fhm00rhFTFw1RGp2FI3cz20_STOPheburn' $
]           
    outfile= 'I2refereeheburn'
    outtext=''
    textperrun=[ 'I2', 'I3', $
'I2rgb', 'I2tip', 'I2zahb', 'I2heburn',$
'I3rgb', 'I3tip', 'I3zahb', 'I3heburn'$
]  

if gtype eq 'RotLayers' then begin
     xmin=0.001
    xmax=1.0
    ymin=3E-9
    ymax=3E-5
endif
if gtype eq 'Track' then begin
    xmin=3.9
    xmax=3.6
    ymin=1.8
    ymax=3.5
endif
endif


if type eq 'avgspeed' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[$; 'RotGrid_rh/1_0fhm00rhFTKw3RGp2VI3cz00','RotGrid_rh/1_2fhm00rhFTKw3RGp2VI3cz00',$
'ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw1',$
'RotGrid_rh/1_4fhm00rhFTFw3RGp2VI3cz00','RotGrid_rh2/1_6fhm00rhFTFw3RGp2VI3cz00','RotGrid_rh/1_8fhm00rhFTFw3RGp2VI3cz00','RotGrid_rh/2_0fhm00rhFTFw3RGp2VI3cz00','RotGrid_rh2/2_2fhm00rhFTFw3RGp2VI3cz00']           
    outfile= 'avgspeed'
    outtext=''
    textperrun=['1.0','1.2', '1.4','1.6','1.8','2.0','2.2']  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'SurfaceRKms' then begin
     xmin=2;6;3;7
    xmax=6 ;16;25;15
    ymin=1
    ymax=20;100;30
endif

if gtype eq 'SurfaceTeffKms' then begin
     xmin=5700;6;3;7
    xmax=4700 ;16;25;15
    ymin=1
    ymax=20;100;30
endif


endif


if type eq 'subgiant16pmm' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[$;
'RotGrid_rh2/1_6fhm00rhFTFw1RGp2VI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw2RGp2VI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw3RGp2VI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw4RGp2VI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw5RGp2VI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw6RGp2VI3cz00']           
    outfile= 'subgiant16pmm'
    outtext=''
    textperrun=['50','', '150','','','300']  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'SurfaceRKms' then begin
     xmin=2;6;3;7
    xmax=6 ;16;25;15
    ymin=1
    ymax=20;100;30
endif

if gtype eq 'SurfaceTeffKms' then begin
     xmin=7000;6;3;7
    xmax=5000 ;16;25;15
    ymin=1
    ymax=400;100;30
endif


endif


if type eq 'subgiant16kaw' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[$;
'RotGrid_rh2/1_6fhm00rhFTFw1RGp2KI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw2RGp2KI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw3RGp2KI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw4RGp2KI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw5RGp2KI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw6RGp2KI3cz00']           
    outfile= 'subgiant16kaw'
    outtext=''
    textperrun=['50','', '150','','','300']  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'SurfaceRKms' then begin
     xmin=2;6;3;7
    xmax=6 ;16;25;15
    ymin=1
    ymax=20;100;30
endif

if gtype eq 'SurfaceTeffKms' then begin
     xmin=7000;6;3;7
    xmax=5000 ;16;25;15
    ymin=1
    ymax=400;100;30
endif


endif


if type eq 'subgiant20pmm' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[$;
'RotGrid_rh2/2_0fhm00rhFTFw1RGp2VI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw2RGp2VI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw3RGp2VI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw4RGp2VI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw5RGp2VI3cz00']
;, 'RotGrid_rh2/2_0fhm00rhFTFw6RGp2VI3cz00']           ; bad model
    outfile= 'subgiant20pmm'
    outtext='PMM'
    textperrun=['50','', '150','','','300']  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'SurfaceRKms' then begin
     xmin=2;6;3;7
    xmax=6 ;16;25;15
    ymin=1
    ymax=20;100;30
endif

if gtype eq 'SurfaceTeffKms' then begin
     xmin=8200;6;3;7
    xmax=5200 ;16;25;15
    ymin=1
    ymax=400;100;30
endif


endif


if type eq 'subgiant20kaw' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[$;
'RotGrid_rh2/2_0fhm00rhFTFw1RGp2KI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw2RGp2KI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw3RGp2KI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw4RGp2KI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw5RGp2KI3cz00'] 
;, 'RotGrid_rh2/2_0fhm00rhFTFw6RGp2KI3cz00']     ; bad model      
    outfile= 'subgiant20kaw'
    outtext=''
    textperrun=['50','', '150','','','300']  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'SurfaceRKms' then begin
     xmin=2;6;3;7
    xmax=6 ;16;25;15
    ymin=1
    ymax=20;100;30
endif

if gtype eq 'SurfaceTeffKms' then begin
     xmin=8200;6;3;7
    xmax=5200 ;16;25;15
    ymin=1
    ymax=400;100;30
endif


endif


if type eq 'maxspeed' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ 'RotGrid_rh/1_4fhm00rhFTFw6RGp2VI3cz00','RotGrid_rh2/1_6fhm00rhFTFw6RGp2VI3cz00','RotGrid_rh/1_8fhm00rhFTFw6RGp2VI3cz00','RotGrid_rh/2_0fhm00rhFTFw6RGp2VI3cz00','RotGrid_rh2/2_2fhm00rhFTFw6RGp2VI3cz00']           
    outfile= 'maxspeed'
    outtext=''
    textperrun=['1.4','1.6','1.8','2.0','2.2']  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'SurfaceRKms' then begin
     xmin=6;3;7
    xmax=16;25;15
    ymin=1
    ymax=20;100;30
endif

endif


if type eq 'maxspeedkaw' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[ 'RotGrid_rh/1_4fhm00rhFTFw6RGp2KI3cz00','RotGrid_rh2/1_6fhm00rhFTFw6RGp2KI3cz00','RotGrid_rh/1_8fhm00rhFTFw6RGp2KI3cz00','RotGrid_rh/2_0fhm00rhFTFw6RGp2KI3cz00','RotGrid_rh2/2_2fhm00rhFTFw6RGp2KI3cz00']           
    outfile= 'maxspeedkaw'
    outtext=''
    textperrun=['1.4','1.6','1.8','2.0','2.2']  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'SurfaceRKms' then begin
     xmin=6;3;7
    xmax=16;25;15
    ymin=1
    ymax=20;100;30
endif

endif

if type eq 'TOI197' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= ''
    infiles=[  '~/EVOLUTION/output/RotGrid_rh2/1_4fhm00rhFTFw0RGp2VI3cz00','~/EVOLUTION/output/RotGrid_rh2/1_6fhm00rhFTFw0RGp2VI3cz00', '~/EVOLUTION/output/RotGrid_rh2/1_4fhm00rhFTFw5RGp2VI3cz00','~/EVOLUTION/output/RotGrid_rh2/1_6fhm00rhFTFw5RGp2VI3cz00', $
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m120fhm000y273a17al00_grnodf', '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m140fhm000y273a17al00_grnodf', $
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m160fhm000y273a17al00_grnodf', $
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m120fhm020y273a17al00_grnodf', '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m140fhm020y273a17al00_grnodf', $
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m160fhm020y273a17al00_grnodf', $
       '~/EVOLUTION/output/RGRotbyMassold/1_1MRGinFsbFjdF','~/EVOLUTION/output/RGRotbyMassold/1_3MRGinFsbFjdF', '~/EVOLUTION/output/RGRotbyMassold/1_5MRGinFsbFjdF', $
      '~/EVOLUTION/output/ZRmod/1_0Mo3FTFw1', '~/EVOLUTION/output/ZRmod/1_2Mo3FTFw1', '~/EVOLUTION/output/ZRmod/1_4Mo3FTFw1', '~/EVOLUTION/output/ZRmod/1_6Mo3FTFw1', $
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m120fhm020y273a22al00_grnodf', '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m140fhm020y273a22al00_grnodf', $
      '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m160fhm020y273a22al00_grnodf' ]
           
    outfile= 'TOI197'
    outtext=''
    textperrun=['1.4w0','1.6w0', '1.4w5','1.6w5', '1.2m0', '1.4m0', '1.6m0', '1.2m2', '1.4m2', '1.6m2', '1.1o',  '1.3o', '1.5o', '1.0ZR','1.2ZR', '1.4ZR', '1.6ZR', $
                '1.2m2a22', '1.4m2a22', '1.6m2a22']  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'TracknopmsTess' then begin
     xmin=5500
    xmax=4500
    ymin=4
    ymax=9
endif
endif


if type eq 'TOI197new' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/toi197/'
    infiles=[  '1_10fhm000rhFTVw3', '1_10fhm008rhFTVw3','1_10fhm016rhFTVw3',$
               '1_15fhm000rhFTVw3', '1_15fhm008rhFTVw3', '1_15fhm016rhFTVw3',$  
               '1_20fhm000rhFTVw3', '1_20fhm008rhFTVw3','1_20fhm016rhFTVw3',$   
               '1_25fhm000rhFTVw3', '1_25fhm008rhFTVw3','1_25fhm016rhFTVw3',$    
               '1_30fhm000rhFTVw3', '1_30fhm008rhFTVw3','1_30fhm016rhFTVw3',$ 
               '1_35fhm000rhFTVw3', '1_35fhm008rhFTVw3','1_35fhm016rhFTVw3',$  
               '1_40fhm000rhFTVw3', '1_40fhm008rhFTVw3','1_40fhm016rhFTVw3',$   
               '1_45fhm000rhFTVw3', '1_45fhm008rhFTVw3','1_45fhm016rhFTVw3',$ 
               '1_50fhm000rhFTVw3', '1_50fhm008rhFTVw3','1_50fhm016rhFTVw3'$  
      ]
           
    outfile= 'TOI197new'
    outtext=''
    textperrun=['1.10-000', '1.10-008', '1.10-016', '1.15-000', '1.15-008', '1.15-016', $
                '1.20-000', '1.20-008', '1.20-016', '1.25-000', '1.25-008', '1.25-016', $
                '1.30-000', '1.30-008', '1.30-016', '1.35-000', '1.35-008', '1.35-016', $
                '1.40-000', '1.40-008', '1.40-016', '1.45-000', '1.45-008', '1.45-016', $
                '1.50-000', '1.50-008', '1.50-016'$
]  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'TracknopmsTess' then begin
     xmin=5500
    xmax=4800
    ymin=3
    ymax=7
endif
endif

if type eq 'TOI197m008' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/toi197/'
    infiles=[   '1_10fhm008rhFTVw3', '1_15fhm008rhFTVw3',  '1_20fhm008rhFTVw3', '1_25fhm008rhFTVw3','1_30fhm008rhFTVw3', '1_35fhm008rhFTVw3',$  
               '1_40fhm008rhFTVw3', '1_45fhm008rhFTVw3', '1_50fhm008rhFTVw3'$  
      ]
           
    outfile= 'TOI197m008'
    outtext=''
    textperrun=[ '1.10-008',  '1.15-008', '1.20-008', '1.25-008', '1.30-008',  '1.35-008',  '1.40-008', '1.45-008',  '1.50-008'$
]  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif

if gtype eq 'TracknopmsTess' then begin
     xmin=5500
    xmax=4800
    ymin=3
    ymax=7
endif
endif

if type eq 'TOI197m016' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/toi197/'
    infiles=[   '1_10fhm016rhFTVw3', '1_15fhm016rhFTVw3',  '1_20fhm016rhFTVw3', '1_25fhm016rhFTVw3','1_30fhm016rhFTVw3', '1_35fhm016rhFTVw3',$  
               '1_40fhm016rhFTVw3', '1_45fhm016rhFTVw3', '1_50fhm016rhFTVw3'$  
      ]
           
    outfile= 'TOI197m016'
    outtext=''
    textperrun=[ '1.10-016',  '1.15-016', '1.20-016', '1.25-016', '1.30-016',  '1.35-016',  '1.40-016', '1.45-016',  '1.50-016'$
]  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'TracknopmsTess' then begin
     xmin=5500
    xmax=4800
    ymin=3
    ymax=7
endif
endif

if type eq 'TOI197m000' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/toi197/'
    infiles=[   '1_10fhm000rhFTVw3', '1_15fhm000rhFTVw3',  '1_20fhm000rhFTVw3', '1_25fhm000rhFTVw3','1_30fhm000rhFTVw3', '1_35fhm000rhFTVw3',$  
               '1_40fhm000rhFTVw3', '1_45fhm000rhFTVw3', '1_50fhm000rhFTVw3'$  
      ]
           
    outfile= 'TOI197m000'
    outtext=''
    textperrun=[ '1.10-000',  '1.15-000', '1.20-000', '1.25-000', '1.30-000',  '1.35-000',  '1.40-000', '1.45-000',  '1.50-000'$
]  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'TracknopmsTess' then begin
     xmin=5500
    xmax=4800
    ymin=3
    ymax=7
endif
endif

if type eq 'medspeed' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '1_4fhm00rhFTFw3RGp2VI3cz00','1_8fhm00rhFTFw3RGp2VI3cz00','2_2fhm00rhFTFw3RGp2VI3cz00',  '2_6fhm00rhFTFw3RGp2VI3cz00',  '3_0fhm00rhFTFw3RGp2VI3cz00']           
    outfile= 'medspeed'
    outtext=''
    textperrun=['1.4','1.8','2.2','2.6', '3.0']  

if gtype eq 'RotKms' then begin
     xmin=4.0
    xmax=2.2
    ymin=0
    ymax=10
endif

if gtype eq 'TracknopmsTess' then begin
     xmin=8000
    xmax=3000
    ymin=0
    ymax=100
endif

if gtype eq 'SurfaceR' then begin
     xmin=5
    xmax=20
    ymin=100
    ymax=30
endif

if gtype eq 'Rossby' then begin
     xmin=4.0
    xmax=1.0
    ymin=0
    ymax=10
endif

endif


if type eq 'nuInditestm148' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/nuIndi/'
    infiles=[ $
	      '0_60fhm148al04grrhFTVw3','0_65fhm148al04grrhFTVw3','0_70fhm148al04grrhFTVw3',$
              '0_75fhm148al04grrhFTVw3','0_80fhm148al04grrhFTVw3','0_85fhm148al04grrhFTVw3','0_90fhm148al04grrhFTVw3'];,'0_75fhm148al04grrhFTVw3diff' ] 
 
           
    outfile= 'nuInditest148'
    outtext=''
    textperrun=[ '60', '65', '70', '75', '80', '85', '90'];, '75diff']  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif

if gtype eq 'TracknopmsTess' then begin
     xmin=5700
    xmax=5000
    ymin=4
    ymax=8
endif
endif

if type eq 'nuInditestm137' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/nuIndi/'
    infiles=[ $
	      '0_60fhm137al04grrhFTVw3','0_65fhm137al04grrhFTVw3','0_70fhm137al04grrhFTVw3',$
              '0_75fhm137al04grrhFTVw3','0_80fhm137al04grrhFTVw3','0_85fhm137al04grrhFTVw3','0_90fhm137al04grrhFTVw3' ] 
 
           
    outfile= 'nuInditest137'
    outtext=''
    textperrun=[ '60', '65', '70', '75', '80', '85', '90' $
]  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif

if gtype eq 'TracknopmsTess' then begin
     xmin=5700
    xmax=5000
    ymin=4
    ymax=8
endif
endif


if type eq 'nuInditestm159' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/nuIndi/'
    infiles=[ $
	      '0_60fhm159al04grrhFTVw3','0_65fhm159al04grrhFTVw3','0_70fhm159al04grrhFTVw3',$
              '0_75fhm159al04grrhFTVw3','0_80fhm159al04grrhFTVw3','0_85fhm159al04grrhFTVw3','0_90fhm159al04grrhFTVw3'] 
 
           
    outfile= 'nuInditest159'
    outtext=''
    textperrun=[ '60', '65', '70', '75', '80', '85', '90' $
]  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif

if gtype eq 'TracknopmsTess' then begin
     xmin=5700
    xmax=5000
    ymin=4
    ymax=8
endif
endif


if type eq 'subgiantp050' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/Planetgrid1/'
    infiles=[ $
	      '2_00fhp050al00grrhFTFw3','1_90fhp050al00grrhFTFw3','1_80fhp050al00grrhFTFw3',$
              '1_70fhp050al00grrhFTFw3','1_60fhp050al00grrhFTFw3','1_50fhp050al00grrhFTFw3',$
              '1_40fhp050al00grrhFTFw3','1_30fhp050al00grrhFTVw3', '1_20fhp050al00grrhFTVw3','1_10fhp050al00grrhFTVw3', $
	      '1_00fhp050al00grrhFTVw3','0_90fhp050al00grrhFTVw3','0_80fhp050al00grrhFTVw3',$
              '0_70fhp050al00grrhFTVw3','0_60fhp050al00grrhFTVw3','0_50fhp050al00grrhFTVw3'$
] 
 
           
    outfile= 'subgiantp050'
    outtext=''
    textperrun=[ '2.0', '1.9', '1.8', '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8', '0.7', '0.6', '0.5' $
]  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif

if gtype eq 'Tracknopms' then begin
     xmin=3.8
    xmax=3.3
    ymin=-0.5
    ymax=2
endif
endif


if type eq 'subgiantsolar' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/Planetgrid1/'
    infiles=[ $
	     ; '2_00fhm000al00grrhFTFw3','1_90fhm000al00grrhFTFw3','1_80fhm000al00grrhFTFw3',$
              ;'1_70fhm000al00grrhFTFw3','1_60fhm000al00grrhFTFw3','1_50fhm000al00grrhFTFw3',$
              ;'1_40fhm000al00grrhFTFw3','1_30fhm000al00grrhFTVw3', '1_20fhm000al00grrhFTVw3', $
	      '1_10fhm000al00grrhFTVw3','1_00fhm000al00grrhFTVw3'$;,'0_90fhm000al00grrhFTVw3','0_80fhm000al00grrhFTVw3',$
            ;  '0_70fhm000al00grrhFTVw3','0_60fhm000al00grrhFTVw3','0_50fhm000al00grrhFTVw3'$
] 
 
           
    outfile= 'subgiantsolar'
    outtext=''
    textperrun=['1.1', '1.0']; '2.0', '1.9', '1.8', '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8', '0.7', '0.6', '0.5' $
;]  

if gtype eq 'Deg' then begin
     xmin=12.35685
     xmax=12.35695
     ymin=.99
     ymax=100
endif
if gtype eq 'Tracknopms' then begin
     xmin=3.513
    xmax=3.5034
    ymin=3.355
    ymax=3.3634
endif
endif


if type eq 'subgiantm000' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/Planetgrid1/'
    infiles=[ $
	      '2_00fhm000al00grrhFTFw3','1_90fhm000al00grrhFTFw3','1_80fhm000al00grrhFTFw3',$
              '1_70fhm000al00grrhFTFw3','1_60fhm000al00grrhFTFw3','1_50fhm000al00grrhFTFw3',$
              '1_40fhm000al00grrhFTFw3','1_30fhm000al00grrhFTVw3', '1_20fhm000al00grrhFTVw3','1_10fhm000al00grrhFTVw3', $
	      '1_00fhm000al00grrhFTVw3','0_90fhm000al00grrhFTVw3','0_80fhm000al00grrhFTVw3',$
              '0_70fhm000al00grrhFTVw3','0_60fhm000al00grrhFTVw3','0_50fhm000al00grrhFTVw3'$
] 
 
           
    outfile= 'subgiantm000'
    outtext=''
    textperrun=[ '2.0', '1.9', '1.8', '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8', '0.7', '0.6', '0.5' $
]  

if gtype eq 'Deg' then begin
     xmin=0
     xmax=5
     ymin=.01
     ymax=100
endif

if gtype eq 'Tracknopms' then begin
     xmin=3.6
    xmax=3.45
    ymin=3.0
    ymax=3.4
endif

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif

;if gtype eq 'Tracknopms' then begin
;     xmin=4.0
;    xmax=3.6
;    ymin=-1.0
;    ymax=2
;endif

if gtype eq 'H2Age' then begin
    xmin=0
    xmax=0.0015
    ymin=1e-12;0.000373;0;-0.001
    ymax=1e-4;0.000374;0.003
endif

endif


if type eq 'subgiant2m000' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/Planetgrid2/'
    infiles=[ $
	      '2_00fhm000al00grrhFTVw3','1_90fhm000al00grrhFTVw3','1_80fhm000al00grrhFTVw3',$
              '1_70fhm000al00grrhFTVw3','1_60fhm000al00grrhFTVw3','1_50fhm000al00grrhFTVw3',$
              '1_40fhm000al00grrhFTVw3','1_30fhm000al00grrhFTVw3', '1_20fhm000al00grrhFTVw3','1_10fhm000al00grrhFTVw3', $
	      '1_00fhm000al00grrhFTVw3','0_90fhm000al00grrhFTVw3','0_80fhm000al00grrhFTVw3'$
] 
 
           
    outfile= 'subgiant2m000'
    outtext=''
    textperrun=[ '2.0', '1.9', '1.8',$
          '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8' $
]  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif

if gtype eq 'Tracknopms' then begin
     xmin=4.0
    xmax=3.6
    ymin=-1.0
    ymax=2
endif
endif

if type eq 'subgiants3pmmcomp' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=['ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw1','RotGrid_rh2/1_4fhm00rhFTFw3RGp2VI3cz00', 'RotGrid_rh2/1_6fhm00rhFTFw3RGp2VI3cz00','RotGrid_rh2/1_8fhm00rhFTFw3RGp2VI3cz00', 'RotGrid_rh2/2_0fhm00rhFTFw3RGp2VI3cz00', 'subgiant/Planetgrid2/2_00fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_80fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_60fhm000al00grrhFTVw3', $
'subgiant/Planetgrid2/1_40fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_20fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_00fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'subgiants3pmmcomp'
    outtext=' '
    textperrun=['1.0', '1.2','1.4', '1.6', '1.8', '2.0', 's2', 's18', 's16', 's14', 's12', 's10']

if gtype eq 'SurfacePMass' then begin
    xmin=1.0
    xmax=2.0
    ymin=1e4
    ymax=1e1
endif

if gtype eq 'TeffLoggData' then begin
    xmin=6300
    xmax=4700
    ymin=4.5
    ymax=3.0
endif


if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=15.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceRKms' then begin
    xmin=1.0
    xmax=7.0
    ymin=1
    ymax=40
endif
endif


if type eq 'subgiantsbest' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=['ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw3', 'subgiant/Planetgrid2/2_00fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_80fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_60fhm000al00grrhFTVw3', $
'subgiant/Planetgrid2/1_40fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'subgiantsbest'
    outtext=' '
    textperrun=['1.0', '1.2', '2.0', '1.8', '1.6','1.4', 's2', 's18', 's16', 's14', 's12', 's10']



if gtype eq 'Surfacelogg' then begin
    xmin=4.5;4.0;9.0;5.0;4.0;
    xmax=2.5;3.0;7.0;2.0;3.5;
    ymin=1e4;1000;1e3;3e2;
    ymax=1;3e-1;3e0;
endif

if gtype eq 'SurfaceRKms' then begin
    xmin=2.0;5.0;4.0;
    xmax=8.0;2.0;3.5;
    ymin=1;1e3;3e2;
    ymax=20;3e-1;3e0;
print, 'yes'
endif

endif

if type eq 'subgiantsdiffrot' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=[$ ;'ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw3', 'subgiant/Planetgrid2/2_00fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_80fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_60fhm000al00grrhFTVw3', $
;'subgiant/Planetgrid2/1_40fhm000al00grrhFTVw3' 
;'subgiant/Planetgrid1/1_20fhm000al00grrhFTVw3',$
;'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTF',$
;'subgiant/Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTF',$
'subgiant/Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTFI3'];,$
;'ZRmod/1_2Mo3FTTw1RGp2FTTI3cz20']

 
;1_0s are actually FTT
    outfile= 'subgiantsdiffrot'
    outtext=' '
    textperrun=['w3', 'contftf', 'contftfi3', 'cz20']



if gtype eq 'Surfacelogg' then begin
    xmin=4.5;4.0;9.0;5.0;4.0;
    xmax=2.5;3.0;7.0;2.0;3.5;
    ymin=4000;1000;1e3;3e2;
    ymax=3;1;3e-1;3e0;
endif
if gtype eq 'SurfaceloggCE' then begin
    xmin=4.5;4.0;9.0;5.0;4.0;
    xmax=2.5;3.0;7.0;2.0;3.5;
    ymin=4000;1000;1e3;3e2;
    ymax=3;1;3e-1;3e0;
endif

if gtype eq 'SurfaceRKms' then begin
    xmin=2.0;5.0;4.0;
    xmax=8.0;2.0;3.5;
    ymin=1;1e3;3e2;
    ymax=20;3e-1;3e0;
print, 'yes'
endif

endif

if type eq 'subgiantsdiffrot15' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=[$ ;'ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw3', 'subgiant/Planetgrid2/2_00fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_80fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_60fhm000al00grrhFTVw3', $
;'subgiant/Planetgrid2/1_40fhm000al00grrhFTVw3' 
;'subgiant/Planetgrid1/1_20fhm000al00grrhFTVw3',$
;'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTF',$
;'subgiant/Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTF',$
'RotGrid_rh2/1_6fhm00rhFTFw1EoMS', 'RotGrid_rh2/1_6fhm00rhFTFw1RGp2VI3cz20'];,$
;'ZRmod/1_2Mo3FTTw1RGp2FTTI3cz20']

 
;1_0s are actually FTT
    outfile= 'subgiantsdiffrot15'
    outtext=' '
    textperrun=['w3', 'contftf', 'contftfi3', 'cz20']



if gtype eq 'Surfacelogg' then begin
    xmin=4.5;4.0;9.0;5.0;4.0;
    xmax=2.5;3.0;7.0;2.0;3.5;
    ymin=4000;1000;1e3;3e2;
    ymax=0.1;1;3e-1;3e0;
endif
if gtype eq 'SurfaceloggCE' then begin
    xmin=4.5;4.0;9.0;5.0;4.0;
    xmax=2.5;3.0;7.0;2.0;3.5;
    ymin=4000;1000;1e3;3e2;
    ymax=0.1;1;3e-1;3e0;
endif

if gtype eq 'SurfaceRKms' then begin
    xmin=2.0;5.0;4.0;
    xmax=8.0;2.0;3.5;
    ymin=1;1e3;3e2;
    ymax=20;3e-1;3e0;
print, 'yes'
endif

endif

if type eq 'subgiants12combo' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=['Planetgrid1/0_80fhm000al00grrhFTVw3','Planetgrid1/0_90fhm000al00grrhFTVw3',$
'Planetgrid1/1_00fhm000al00grrhFTVw3','Planetgrid1/1_10fhm000al00grrhFTVw3',$
'Planetgrid1/1_20fhm000al00grrhFTVw3', 'Planetgrid1/1_30fhm000al00grrhFTVw3',$
'Planetgrid2/1_40fhm000al00grrhFTVw3','Planetgrid2/1_60fhm000al00grrhFTVw3', $
'Planetgrid2/1_80fhm000al00grrhFTVw3','Planetgrid2/2_00fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'subgiants12combo'
    outtext=' '
    textperrun=['0.8','0.9', '1.0', '1.1', '1.2','1.3', '1.4', '1.6', '1.8', '2.0']



if gtype eq 'Surfacelogg' then begin
    xmin=4.2;4.7;9.0;5.0;4.0;
    xmax=2.7;2.7;7.0;2.0;3.5;
    ymin=1000;1e3;3e2;
    ymax=1;3e-1;3e0;
endif
endif

if type eq 'subgiants12combo2021a' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=[$ ;'Planetgrid1/0_80fhm000al00grrhFTVw3','Planetgrid1/0_90fhm000al00grrhFTVw3',$
'Planetgrid1/1_00fhm000al00grrhFTVw3','Planetgrid1/1_10fhm000al00grrhFTVw3',$
'Planetgrid1/1_20fhm000al00grrhFTVw3', 'Planetgrid1/1_30fhm000al00grrhFTVw3',$
'Planetgrid2/1_40fhm000al00grrhFTVw3'];,'Planetgrid2/1_60fhm000al00grrhFTVw3', $
;'Planetgrid2/1_80fhm000al00grrhFTVw3','Planetgrid2/2_00fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'subgiants12combo2021a'
    outtext=' '
    textperrun=[ '1.0', '1.1', '1.2','1.3', '1.4'] ;'0.8','0.9',

if gtype eq 'Rossby' then begin
    xmin=5.0
    xmax=1.0
    ymin=0.0
    ymax=1000
endif

if gtype eq 'Surfacelogg' then begin
    xmin=4.2;4.7;9.0;5.0;4.0;
    xmax=2.7;2.7;7.0;2.0;3.5;
    ymin=800;1000;1e3;3e2;
    ymax=3;1;3e-1;3e0;
endif
if gtype eq 'TauCZ' then begin
    xmin=5.0
    xmax=3.0
    ymin=-1
    ymax=7
endif
endif

if type eq 'PaulSong' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=['ZRmod/1_0Mo3FTFw1','ZRmod/1_2Mo3FTFw3', 'subgiant/Planetgrid2/2_00fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_80fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_60fhm000al00grrhFTVw3', $
'subgiant/Planetgrid2/1_40fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'PaulSong'
    outtext=' '
    textperrun=['1.0', '1.2', '2.0', '1.8', '1.6','1.4', 's2', 's18', 's16', 's14', 's12', 's10']



if gtype eq 'Surfacelogg' then begin
    xmin=2.0;5.0;4.0;
    xmax=1.2;2.0;3.5;
    ymin=3e4;1e3;3e2;
    ymax=3e2;3e-1;3e0;
endif

if gtype eq 'SurfaceRKms' then begin
    xmin=2.0;5.0;4.0;
    xmax=8.0;2.0;3.5;
    ymin=1;1e3;3e2;
    ymax=20;3e-1;3e0;
print, 'yes'
endif

endif

if type eq 'PaulSongAldebaran' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=[ $
'subgiant/Planetgrid1/1_20fhm050al00grrhFTVw3', 'subgiant/Planetgrid1/1_20fhm000al00grrhFTVw3'  ] 
;1_0s are actually FTT
    outfile= 'PaulSongAldebaran'
    outtext=' '
    textperrun=['-.5', '0.0']



if gtype eq 'Surfacelogg' then begin
    xmin=1.6;5.0;4.0;
    xmax=1.2;2.0;3.5;
    ymin=4e4;1e3;3e2;
    ymax=4e3;3e-1;3e0;
endif

if gtype eq 'SurfaceRKms' then begin
    xmin=2.0;5.0;4.0;
    xmax=8.0;2.0;3.5;
    ymin=1;1e3;3e2;
    ymax=20;3e-1;3e0;
print, 'yes'
endif

if gtype eq 'TeffLogg' then begin
    xmin=7000;5.0;4.0;
    xmax=5000;2.0;3.5;
    ymin=5.0;1e3;3e2;
    ymax=3.5;3e-1;3e0;
print, 'yes'
endif
endif

if type eq 'PaulSongtest' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=[ $
 'RotGrid_rh2/1_4fhp03rhFTFw3', 'RotGrid_rh2/1_6fhp03rhFTFw3', 'RotGrid_rh2/1_8fhp03rhFTFw3', 'RotGrid_rh2/2_0fhp03rhFTFw3']
;'subgiant/Planetgrid2/2_00fhm000al00grrhFTVw3'] ;, 'subgiant/Planetgrid2/1_60fhm000al00grrhFTVw3','subgiant/Planetgrid2/1_80fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_40fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_30fhm000al00grrhFTVw3'  ] 
;1_0s are actually FTT
    outfile= 'PaulSongtest'
    outtext=' '
    textperrun=['1.4', '1.6', '1.8','2.0','1.5', '1.6', '1.8', '1.4', '1.3']

if gtype eq 'LumLogg' then begin
     xmin=30
     xmax=3
     ymin=4.0
     ymax=3.0
endif

if gtype eq 'Surfacelogg' then begin
    xmin=4.0;5.0;4.0;
    xmax=1.2;2.0;3.5;
    ymin=5e3;1e3;3e2;
    ymax=1e-2;3e-1;3e0;
endif

if gtype eq 'SurfaceRKms' then begin
    xmin=2.0;5.0;4.0;
    xmax=8.0;2.0;3.5;
    ymin=1;1e3;3e2;
    ymax=20;3e-1;3e0;
print, 'yes'
endif

if gtype eq 'TeffLogg' then begin
    xmin=9000;5.0;4.0;
    xmax=5000;2.0;3.5;
    ymin=4.0;1e3;3e2;
    ymax=3.5;3e-1;3e0;
print, 'yes'
endif

if gtype eq 'Track' then begin
    xmin=4.5;5.0;4.0;
    xmax=3.7;2.0;3.5;
    ymin=0.5;1e3;3e2;
    ymax=1.5;3e-1;3e0;
print, 'yes'
endif

endif


if type eq 'subgiantsbest1' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=['ZRmod/1_0Mo3FTFw1','subgiant/Planetgrid2/2_00fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'subgiantsbest1'
    outtext=' '
    textperrun=['1.0', '1.2','1.4', '1.6', '1.8', '2.0', 's2', 's18', 's16', 's14', 's12', 's10']



if gtype eq 'Surfacelogg' then begin
    xmin=5.0;4.6;
    xmax=2.0;4.3;
    ymin=1e3;1e2;
    ymax=3e-1;3e0;
endif

endif


if type eq 'planetvstoi197' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
    infiles=[   'subgiant/toi197/1_10fhm000rhFTVw3', 'subgiant/toi197/1_20fhm000rhFTVw3', 'subgiant/toi197/1_30fhm000rhFTVw3',$  
               'subgiant/toi197/1_40fhm000rhFTVw3',  'subgiant/toi197/1_50fhm000rhFTVw3',$
	      'subgiant/Planetgrid1/1_50fhm000al00grrhFTFw3',$
              'subgiant/Planetgrid1/1_40fhm000al00grrhFTFw3','subgiant/Planetgrid1/1_30fhm000al00grrhFTVw3', 'subgiant/Planetgrid1/1_20fhm000al00grrhFTVw3','subgiant/Planetgrid1/1_10fhm000al00grrhFTVw3', $
              'RotGrid_rh2/1_4fhm00rhFTFw3', 'RotGrid_rh2/1_2fhm00rhFTKw3', 'RotGrid_rh2/1_0fhm00rhFTKw3'$
] 
 
           
    outfile= 'planetvstoi197'
    outtext=''
    textperrun=[ 'toi11', 'toi12', 'toi13', 'toi14', 'toi15', 'plan15', 'plan14',  'plan13', 'plan12', 'plan11', 'rg14', 'rg12', 'rg10' $
]  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif

if gtype eq 'Tracknopms' then begin
     xmin=3.9
    xmax=3.6
    ymin=0
    ymax=1
endif
endif

if type eq 'subgiantm050' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/Planetgrid1/'
    infiles=[ $
	      '2_00fhm050al00grrhFTFw3','1_90fhm050al00grrhFTFw3','1_80fhm050al00grrhFTFw3',$
              '1_70fhm050al00grrhFTFw3','1_60fhm050al00grrhFTFw3','1_50fhm050al00grrhFTFw3',$
              '1_40fhm050al00grrhFTFw3','1_30fhm050al00grrhFTVw3', '1_20fhm050al00grrhFTVw3','1_10fhm050al00grrhFTVw3', $
	      '1_00fhm050al00grrhFTVw3','0_90fhm050al00grrhFTVw3','0_80fhm050al00grrhFTVw3',$
              '0_70fhm050al00grrhFTVw3','0_60fhm050al00grrhFTVw3','0_50fhm050al00grrhFTVw3'$
] 
 
           
    outfile= 'subgiantm050'
    outtext=''
    textperrun=[ '2.0', '1.9', '1.8', '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8', '0.7', '0.6', '0.5' $
]  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif

if gtype eq 'Tracknopms' then begin
     xmin=4.0
    xmax=3.6
    ymin=-1.0
    ymax=2
endif
endif

if type eq 'subgiantm100' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/Planetgrid1/'
    infiles=[ $
	      '2_00fhm100al00grrhFTFw3','1_90fhm100al00grrhFTFw3','1_80fhm100al00grrhFTFw3',$
              '1_70fhm100al00grrhFTFw3','1_60fhm100al00grrhFTFw3','1_50fhm100al00grrhFTFw3',$
              '1_40fhm100al00grrhFTFw3','1_30fhm100al00grrhFTVw3', '1_20fhm100al00grrhFTVw3','1_10fhm100al00grrhFTVw3', $
	      '1_00fhm100al00grrhFTVw3','0_90fhm100al00grrhFTVw3','0_80fhm100al00grrhFTVw3',$
              '0_70fhm100al00grrhFTVw3','0_60fhm100al00grrhFTVw3','0_50fhm100al00grrhFTVw3'$
] 
 
           
    outfile= 'subgiantm100'
    outtext=''
    textperrun=[ '2.0', '1.9', '1.8', '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8', '0.7', '0.6', '0.5' $
]  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif

if gtype eq 'Tracknopms' then begin
     xmin=4.0
    xmax=3.6
    ymin=-1.0
    ymax=2
endif
endif

if type eq 'fullPlanetgrid1' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/Planetgrid1/'
    infiles=[ $

	      '2_00fhm100al00grrhFTFw3','1_90fhm100al00grrhFTFw3','1_80fhm100al00grrhFTFw3',$
              '1_70fhm100al00grrhFTFw3','1_60fhm100al00grrhFTFw3','1_50fhm100al00grrhFTFw3',$
              '1_40fhm100al00grrhFTFw3','1_30fhm100al00grrhFTVw3', '1_20fhm100al00grrhFTVw3','1_10fhm100al00grrhFTVw3', $
	      '1_00fhm100al00grrhFTVw3','0_90fhm100al00grrhFTVw3','0_80fhm100al00grrhFTVw3',$
              '0_70fhm100al00grrhFTVw3','0_60fhm100al00grrhFTVw3',$
	      '2_00fhm050al00grrhFTFw3','1_90fhm050al00grrhFTFw3','1_80fhm050al00grrhFTFw3',$
              '1_70fhm050al00grrhFTFw3','1_60fhm050al00grrhFTFw3','1_50fhm050al00grrhFTFw3',$
              '1_40fhm050al00grrhFTFw3','1_30fhm050al00grrhFTVw3', '1_20fhm050al00grrhFTVw3','1_10fhm050al00grrhFTVw3', $
	      '1_00fhm050al00grrhFTVw3','0_90fhm050al00grrhFTVw3','0_80fhm050al00grrhFTVw3',$
              '0_70fhm050al00grrhFTVw3','0_60fhm050al00grrhFTVw3',$
	      '2_00fhm000al00grrhFTFw3','1_90fhm000al00grrhFTFw3','1_80fhm000al00grrhFTFw3',$
              '1_70fhm000al00grrhFTFw3','1_60fhm000al00grrhFTFw3','1_50fhm000al00grrhFTFw3',$
              '1_40fhm000al00grrhFTFw3','1_30fhm000al00grrhFTVw3', '1_20fhm000al00grrhFTVw3','1_10fhm000al00grrhFTVw3', $
	      '1_00fhm000al00grrhFTVw3','0_90fhm000al00grrhFTVw3','0_80fhm000al00grrhFTVw3',$
              '0_70fhm000al00grrhFTVw3','0_60fhm000al00grrhFTVw3',$
	      '2_00fhp050al00grrhFTFw3','1_90fhp050al00grrhFTFw3','1_80fhp050al00grrhFTFw3',$
              '1_70fhp050al00grrhFTFw3','1_60fhp050al00grrhFTFw3','1_50fhp050al00grrhFTFw3',$
              '1_40fhp050al00grrhFTFw3','1_30fhp050al00grrhFTVw3', '1_20fhp050al00grrhFTVw3','1_10fhp050al00grrhFTVw3', $
	      '1_00fhp050al00grrhFTVw3','0_90fhp050al00grrhFTVw3','0_80fhp050al00grrhFTVw3',$
              '0_70fhp050al00grrhFTVw3','0_60fhp050al00grrhFTVw3'$
] 
 
           
    outfile= 'fullPlanetgrid1'
    outtext=''
    textperrun=[ '2.0', '1.9', '1.8', '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8', '0.7', '0.6', '0.5', $
                 '2.0', '1.9', '1.8', '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8', '0.7', '0.6', '0.5', $
                 '2.0', '1.9', '1.8', '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8', '0.7', '0.6', '0.5', $ 
                 '2.0', '1.9', '1.8', '1.7', '1.6', '1.5', '1.4', '1.3', '1.2', '1.1',  '1.0', '0.9', '0.8', '0.7', '0.6', '0.5']  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif

if gtype eq 'Tracknopms' then begin
     xmin=4.0
    xmax=3.6
    ymin=-1.0
    ymax=2
endif
endif


if type eq 'Planetgrid2' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=['subgiant/Planetgrid2/1_00fhm000al00grrhFTVw3','subgiant/Planetgrid2/1_20fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/2_00fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_80fhm000al00grrhFTVw3', 'subgiant/Planetgrid2/1_60fhm000al00grrhFTVw3', $
'subgiant/Planetgrid2/1_40fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'Planetgrid2'
    outtext=' '
    textperrun=['1.0', '1.2', '2.0', '1.8', '1.6','1.4', 's2', 's18', 's16', 's14', 's12', 's10']



if gtype eq 'Surfacelogg' then begin
    xmin=4.0;9.0;5.0;4.0;
    xmax=3.0;7.0;2.0;3.5;
    ymin=1000;1e3;3e2;
    ymax=1;3e-1;3e0;
endif

if gtype eq 'SurfaceRKms' then begin
    xmin=2.0;5.0;4.0;
    xmax=8.0;2.0;3.5;
    ymin=1;1e3;3e2;
    ymax=20;3e-1;3e0;
print, 'yes'
endif

endif


if type eq 'subgiant1_2msun' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/Planetgrid1/'
    infiles=[ $
	      '1_20fhm100al00grrhFTVw3','1_20fhm050al00grrhFTVw3', $
	      '1_20fhm000al00grrhFTVw3','1_20fhp050al00grrhFTVw3'$
] 
 
           
    outfile= 'subgiant1_2msun'
    outtext=''
    textperrun=[ '-1.0', '-0.5', '0.0', '+0.5' $
]  

if gtype eq 'RotKms' then begin
     xmin=3.8
    xmax=3.3
    ymin=0
    ymax=10
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif

if gtype eq 'Tracknopms' then begin
     xmin=4.0
    xmax=3.6
    ymin=-1.0
    ymax=2
endif
endif


if type eq 'PMMSBm00gaulme' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/RotGrid_rh2/'
    infiles=[ '2_2fhm00rhFTFw1RGp2VI3cz00','3_0fhm00rhFTFw1RGp2VI3cz00','2_2fhm00rhFTFw5RGp2VI3cz00','3_0fhm00rhFTFw5RGp2VI3cz00'];,$ $;'2_0fhm00rhFTFw0RGp2VI3cz00flash3','2_2fhm00rhFTFw0RGp2VI3cz00','2_4fhm00rhFTFw0RGp2VI3cz00','2_6fhm00rhFTFw0RGp2VI3cz00','2_8fhm00rhFTFw0RGp2VI3cz00','3_0fhm00rhFTFw0RGp2VI3cz00',$
;              '2_0fhm00rhFTFw1RGp2VI3cz00flash3'
;,'2_2fhm00rhFTFw1RGp2VI3cz00','2_4fhm00rhFTFw1RGp2VI3cz00','2_6fhm00rhFTFw1RGp2VI3cz00','2_8fhm00rhFTFw1RGp2VI3cz00','3_0fhm00rhFTFw1RGp2VI3cz00',$
              ;'2_0fhm00rhFTFw2RGp2VI3cz00flash3','2_2fhm00rhFTFw2RGp2VI3cz00','2_4fhm00rhFTFw2RGp2VI3cz00','2_6fhm00rhFTFw2RGp2VI3cz00','2_8fhm00rhFTFw2RGp2VI3cz00','3_0fhm00rhFTFw2RGp2VI3cz00',$
              ;'2_0fhm00rhFTFw3RGp2VI3cz00flash3','2_2fhm00rhFTFw3RGp2VI3cz00','2_4fhm00rhFTFw3RGp2VI3cz00','2_6fhm00rhFTFw3RGp2VI3cz00','2_8fhm00rhFTFw3RGp2VI3cz00','3_0fhm00rhFTFw3RGp2VI3cz00',$
              ;'2_0fhm00rhFTFw4RGp2VI3cz00flash3','2_2fhm00rhFTFw4RGp2VI3cz00','2_4fhm00rhFTFw4RGp2VI3cz00','2_6fhm00rhFTFw4RGp2VI3cz00','2_8fhm00rhFTFw4RGp2VI3cz00','3_0fhm00rhFTFw4RGp2VI3cz00',$
              ;'2_0fhm00rhFTFw5RGp2VI3cz00flash3','2_2fhm00rhFTFw5RGp2VI3cz00','2_4fhm00rhFTFw5RGp2VI3cz00','2_6fhm00rhFTFw5RGp2VI3cz00','2_8fhm00rhFTFw5RGp2VI3cz00','3_0fhm00rhFTFw5RGp2VI3cz00'];,$
                                                 ;'2_2fhm00rhFTFw6RGp2VI3cz00','2_4fhm00rhFTFw6RGp2VI3cz00','2_6fhm00rhFTFw6RGp2VI3cz00','2_8fhm00rhFTFw6RGp2VI3cz00','3_0fhm00rhFTFw6RGp2VI3cz00']           
    outfile= 'PMMSBm00gaulme'
    outtext='PMMSBm00gaulme'
    textperrun=[$;'20w0', '22w0', '24w0', '26w0', '28w0', '30w0',$
                '20w1', '22w1', '24w1', '26w1', '28w1', '30w1',$
;                '20w2', '22w2', '24w2', '26w2', '28w2', '30w2',$
;                '20w3', '22w3', '24w3', '26w3', '28w3', '30w3',$
;                '20w4', '22w4', '24w4', '26w4', '28w4', '30w4',$
                '20w5', '22w5', '24w5', '26w5', '28w5', '30w5'];,$
;                        '22w6', '24w6', '26w6', '28w6', '30w6' ]  

if gtype eq 'RotKmsClump' then begin
     xmin=3.2
    xmax=2.0
    ymin=1
    ymax=30
endif
if gtype eq'RotRatio' then begin
    xmin=3.0
    xmax=2.5
    ymin=0.01
    ymax=10000
endif
if gtype eq 'RotLogg' then begin
   xmin=3.5
   xmax=2.0
   ymin=600
   ymax=6
endif
endif


if type eq 'subgiantsYaguang10' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ '1_0Mo3FTTw3RGp2FTTI3cz00','1_0Mo3FTTw3RGp2FTTI3cz05','1_0Mo3FTTw3RGp2FTTI3cz10','1_0Mo3FTTw3RGp2FTTI3cz15','1_0Mo3FTTw3RGp2FTTI3cz20' ] 
;1_0s are actually FTT
    outfile= 'subgiantsYaguang10'
    outtext=' '
    textperrun=['00', '05', '10', '15','20']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.7;3.9
    xmax=3.5;3.45
    ymin=3.0;  -1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=1.5
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceRKms' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e0
    ymax=1e3
endif
if gtype eq 'SurfacePMass' then begin
    xmin=1.0
    xmax=2.0
    ymin=1e4
    ymax=1e1
endif
if gtype eq 'CoreRPub' then begin
    xmin=1.5;1. ;
    xmax= 7.0;4.5;100.0 ;
    ymin=1e3;6;
    ymax=1e00;-3;
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=1e-9
     ymax=1e-5
endif
if gtype eq'Rot2z' then begin
    xmin=1.  ;0
    xmax=5.  ;13.0
    ymin=1000
    ymax=.1
endif
if gtype eq'RotKms' then begin
    xmin=4.0 ;0
    xmax=3.5  ;13.0
    ymin=0.2
    ymax=3.0
endif
endif



if type eq 'subgiantsYaguang12' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ '1_2Mo3FTTw3RGp2FTTI3cz00','1_2Mo3FTTw3RGp2FTTI3cz05','1_2Mo3FTTw3RGp2FTTI3cz10','1_2Mo3FTTw3RGp2FTTI3cz15','1_2Mo3FTTw3RGp2FTTI3cz20', $
            '1_2Mo3FTTw3EoMS'];,'1_2Mo3FTTw3RGp2FFT',  '1_0Mo3FTTw3RGp2FFT'] 
;1_0s are actually FTT
    outfile= 'subgiantsYaguang12'
    outtext=' '
    textperrun=['00', '05', '10', '15','20', $
            ' ', '1.2Dec','1.0Dec']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.7;3.9
    xmax=3.5;3.45
    ymin=3.0;  -1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=1.0
    xmax=4.0
    ymin=1e3
    ymax=1e-1
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceRKms' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e0
    ymax=1e3
endif
if gtype eq 'SurfacePMass' then begin
    xmin=1.0
    xmax=2.0
    ymin=1e4
    ymax=1e1
endif
if gtype eq 'CoreRPub' then begin
    xmin=1.5;1. ;
    xmax= 7.0;4.5;100.0 ;
    ymin=1e3;6;
    ymax=1e00;-3;
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=1e-9
     ymax=1e-5
endif
if gtype eq'Rot2z' then begin
    xmin=1.  ;0
    xmax=5.  ;13.0
    ymin=1000
    ymax=.1
endif
if gtype eq'RotKms' then begin
    xmin=4.0 ;0
    xmax=3.5  ;13.0
    ymin=0.2
    ymax=3.0
endif
endif


if type eq 'subgiantsYaguang18' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/ZRmod/'
    infiles=[ '1_8Mo3FTFw1RGp2FTTI3cz00','1_8Mo3FTFw1RGp2FTTI3cz05','1_8Mo3FTFw1RGp2FTTI3cz10','1_8Mo3FTFw1RGp2FTTI3cz15','1_8Mo3FTFw1RGp2FTTI3cz20', $
            '1_8Mo3FTFw1EoMS','1_6Mo3FTFw1RGp2FFT',  '1_8Mo3FTFw1RGp2FFT', '1_6Mo3FTFw3EoMS','1_6Mo3FTFw5EoMS'] 
;1_0s are actually FTT
    outfile= 'subgiantsYaguang18'
    outtext=' '
    textperrun=['00', '05', '10', '15','20', $
            ' ', '1.6Dec','1.8Dec', 'w3', 'w5']
if gtype eq 'OttoCali' then begin
    xmin=-.02
    xmax=.02
    ymin=-.02
    ymax=.02
    OttoAge=  12.2 ;11.3 ;10.95;  
    OttoTeff=5363
    OttoR=2.62
    OttoLogg=3.55
    OttoRbce=.36
   OmCDeH=(710e-9)*2*3.14159
   OmSDeH=(150e-9)*2*3.14159
    OttoRho=.06457
endif
if gtype eq 'Track' then begin
     xmin=3.7;3.9
    xmax=3.5;3.45
    ymin=3.0;  -1
    ymax=3.5 
endif
if gtype eq 'CoreR' then begin
    xmin=1.0
    xmax=5.0 ;4.0
    ymin=1e3
    ymax=1e-1
endif
if gtype eq 'SurfaceR' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e3
    ymax=1e0
endif
if gtype eq 'SurfaceRKms' then begin
    xmin=1.0
    xmax=7.0
    ymin=1e0
    ymax=1e3
endif
if gtype eq 'SurfacePMass' then begin
    xmin=1.0
    xmax=2.0
    ymin=1e4
    ymax=1e1
endif
if gtype eq 'CoreRPub' then begin
    xmin=1.5;1. ;
    xmax= 7.0;4.5;100.0 ;
    ymin=1e3;6;
    ymax=1e00;-3;
endif
if gtype eq 'TrackAS' then begin
     xmin=3.84 ;3.76 ;
    xmax=3.70 ;3.66 ;
    ymin=-0.4 ;.2 ;
    ymax=1.0 ;1.5 ;
    OttoLogg=3.55
    OttoRho=.06457
endif
if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.0
     ymin=1e-9
     ymax=1e-5
endif
if gtype eq'Rot2z' then begin
    xmin=1.  ;0
    xmax=5.  ;13.0
    ymin=1000
    ymax=.1
endif
if gtype eq'RotKms' then begin
    xmin=4.0 ;0
    xmax=3.5  ;13.0
    ymin=0.2
    ymax=3.0
endif
endif


if type eq 'subgiants12combo2021a' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=[$ ;'Planetgrid1/0_80fhm000al00grrhFTVw3','Planetgrid1/0_90fhm000al00grrhFTVw3',$
;'Planetgrid1/1_00fhm000al00grrhFTVw3contRossunFTF',$;'Planetgrid1/1_00fhm000al00grrhFTVw3',$
;'Planetgrid1/1_10fhm000al00grrhFTVw3',
;'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTF',$
;'Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTF'];$,
'Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTFI3'];,$
;'Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTFRGp2I3',$;'Planetgrid1/1_20fhm000al00grrhFTVw3',$
;'Planetgrid1/1_30fhm000al00grrhFTVw3',
;'Planetgrid1/1_30fhm000al00grrhFTVw3contRossunFTF','Planetgrid1/1_30fhm000al00grrhFTVw3STOPrsun',$
;'Planetgrid2/1_40fhm000al00grrhFTVw3'];,'Planetgrid2/1_60fhm000al00grrhFTVw3', $
;'Planetgrid2/1_80fhm000al00grrhFTVw3','Planetgrid2/2_00fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'subgiants12combo2021a'
    outtext=' '
    textperrun=[ '1.0n', '1.0', '1.1','1.1n', '1.2n','1.2','1.3', '1.3n','1.4'] ;'0.8','0.9',

if gtype eq 'Rossby' then begin
    xmin=5.0
    xmax=1.0
    ymin=0.0
    ymax=1000
endif

if gtype eq 'Surfacelogg' then begin
    xmin=4.2;4.7;9.0;5.0;4.0;
    xmax=2.7;2.7;7.0;2.0;3.5;
    ymin=800;1000;1e3;3e2;
    ymax=3;1;3e-1;3e0;
endif
if gtype eq 'TauCZ' then begin
    xmin=5.0
    xmax=3.0
    ymin=-1
    ymax=7
endif
endif

if type eq 'subgiantsGI4' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=[$ ;'Planetgrid1/0_80fhm000al00grrhFTVw3','Planetgrid1/0_90fhm000al00grrhFTVw3',$
;'Planetgrid1/1_00fhm000al00grrhFTVw3contRossunFTF',$;'Planetgrid1/1_00fhm000al00grrhFTVw3',$
'Planetgrid1/1_20fhm000al00grrhFTVw3',$
;'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTF',$
'Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTF',$
'Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTFI3'];,$
;'Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTFRGp2I3',$;'Planetgrid1/1_20fhm000al00grrhFTVw3',$
;'Planetgrid1/1_30fhm000al00grrhFTVw3',
;'Planetgrid1/1_30fhm000al00grrhFTVw3contRossunFTF','Planetgrid1/1_30fhm000al00grrhFTVw3STOPrsun',$
;'Planetgrid2/1_40fhm000al00grrhFTVw3'];,'Planetgrid2/1_60fhm000al00grrhFTVw3', $
;'Planetgrid2/1_80fhm000al00grrhFTVw3','Planetgrid2/2_00fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'subgiantsGI4'
    outtext=' '
    textperrun=[ 'PMM', 'vS16', 'TL20','1.0n', '1.0', '1.1','1.1n', '1.2n','1.2','1.3', '1.3n','1.4'] ;'0.8','0.9',

if gtype eq 'Rossby' then begin
    xmin=5.0
    xmax=1.0
    ymin=0.0
    ymax=1000
endif

if gtype eq 'Surfacelogg' then begin
    xmin=4.2;4.7;9.0;5.0;4.0;
    xmax=2.7;2.7;7.0;2.0;3.5;
    ymin=800;1000;1e3;3e2;
    ymax=3;1;3e-1;3e0;
endif
if gtype eq 'TauCZ' then begin
    xmin=5.0
    xmax=3.0
    ymin=-1
    ymax=7
endif
endif

if type eq 'weirdRot11' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=[$ ;'Planetgrid1/0_80fhm000al00grrhFTVw3','Planetgrid1/0_90fhm000al00grrhFTVw3',$
;'Planetgrid1/1_00fhm000al00grrhFTVw3contRossunFTF',$;'Planetgrid1/1_00fhm000al00grrhFTVw3',$
;'Planetgrid1/1_10fhm000al00grrhFTVw3',$
;'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTF',$
'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTFSTOP',$
'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTFI3STOP'];,$
; 'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTFI2STOP'];,$
;'Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTFRGp2I3',$;'Planetgrid1/1_20fhm000al00grrhFTVw3',$
;'Planetgrid1/1_30fhm000al00grrhFTVw3',
;'Planetgrid1/1_30fhm000al00grrhFTVw3contRossunFTF','Planetgrid1/1_30fhm000al00grrhFTVw3STOPrsun',$
;'Planetgrid2/1_40fhm000al00grrhFTVw3'];,'Planetgrid2/1_60fhm000al00grrhFTVw3', $
;'Planetgrid2/1_80fhm000al00grrhFTVw3','Planetgrid2/2_00fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'weirdRot11'
    outtext=' '
    textperrun=[ $ ;'PMM',
 'vS16', '2I3', '2I2', '1.0n', '1.0', '1.1','1.1n', '1.2n','1.2','1.3', '1.3n','1.4'] ;'0.8','0.9',

if gtype eq 'RotLayers' then begin
     xmin=0.999 ;001 ;0.1;
     xmax=1.0
     ymin=1e-8
     ymax=1e-5
endif

if gtype eq 'RotLayersP' then begin
     xmin=0.1 ;001 ;0.1;0.999
     xmax=1.0
     ymin=8e3
     ymax=1e1
endif

if gtype eq 'Rossby' then begin
    xmin=5.0
    xmax=1.0
    ymin=0.0
    ymax=100
endif

if gtype eq 'Surfacelogg' then begin
    xmin=4.2;4.7;9.0;5.0;4.0;
    xmax=2.7;2.7;7.0;2.0;3.5;
    ymin=800;1000;1e3;3e2;
    ymax=3;1;3e-1;3e0;
endif
if gtype eq 'TauCZ' then begin
    xmin=5.0
    xmax=3.0
    ymin=-1
    ymax=7
endif
endif


if type eq 'weirdRot11mesaonly' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/'
;'1_0fhm00rhFTKw1','1_2fhm00rhFTKw1',
    infiles=[$ ;'Planetgrid1/0_80fhm000al00grrhFTVw3','Planetgrid1/0_90fhm000al00grrhFTVw3',$
;'Planetgrid1/1_00fhm000al00grrhFTVw3contRossunFTF',$;'Planetgrid1/1_00fhm000al00grrhFTVw3',$
;'Planetgrid1/1_10fhm000al00grrhFTVw3',$
;'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTF',$
'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTFSTOP',$
'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTFI3STOP'];,$
; 'Planetgrid1/1_10fhm000al00grrhFTVw3contRossunFTFI2STOP'];,$
;'Planetgrid1/1_20fhm000al00grrhFTVw3contRossunFTFRGp2I3',$;'Planetgrid1/1_20fhm000al00grrhFTVw3',$
;'Planetgrid1/1_30fhm000al00grrhFTVw3',
;'Planetgrid1/1_30fhm000al00grrhFTVw3contRossunFTF','Planetgrid1/1_30fhm000al00grrhFTVw3STOPrsun',$
;'Planetgrid2/1_40fhm000al00grrhFTVw3'];,'Planetgrid2/1_60fhm000al00grrhFTVw3', $
;'Planetgrid2/1_80fhm000al00grrhFTVw3','Planetgrid2/2_00fhm000al00grrhFTVw3' ] 
;1_0s are actually FTT
    outfile= 'weirdRot11mesaonly'
    outtext=' '
    textperrun=[ $ ;'PMM',
 ' ', ' ', ' ', 'vS16', '2I3', '2I2', '1.0n', '1.0', '1.1','1.1n', '1.2n','1.2','1.3', '1.3n','1.4'] ;'0.8','0.9',

if gtype eq 'RotLayers' then begin
     xmin=0.01;0.998 ;001 ;0.1;
     xmax=1.0
     ymin=1e-8
     ymax=1e-5
endif

if gtype eq 'RotLayersP' then begin
     xmin=0.0015;0.998;0.0015 ;001 ;0.1;0.999
     xmax=1.0
     ymin=1e3
     ymax=5e0
endif


if gtype eq 'Rossby' then begin
    xmin=5.0
    xmax=1.0
    ymin=0.0
    ymax=100
endif

endif


if type eq '1_2struct' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/output/subgiant/Planetgrid1/'
    infiles=[ $
             '1_20fhm000al00grrhFTVw3STOPRossun'$ ;,
;             '1_20fhm000al00grrhFTVw3contRossunFTFSTOP' $
              ]           

    outfile= '1_2struct'
    outtext=''
    textperrun=[$
                 '1_2struct', '35' $
                 ]

if gtype eq 'StructLayers' then begin
     xmin=0
     xmax=3.5
     ymin=0
     ymax=3.5
endif
endif


if type eq 'Lyracheck' then begin
;otto Grid of models (M, Z, alpha enhanced)  run as SbJd up to the MS turnoff 
;and then with either SB or Rot allowed  Stop at published density
    datadirectory= '~/EVOLUTION/'
    infiles=[ $
             'output/subgiant/Planetgrid1/1_00fhm000al00grrhFTVw3', $
             'output/RotGrid_rh2/3_0fhm00rhFTFw3', $
             'zuul/0/tayar/YRECgrid/nodiff_out4z/m100fhm100y273a17al02_grnodf' $
              ]           

    outfile= 'Lyracheck'
    outtext=''
    textperrun=[$
                 'T22', 'TP18', 'T17' $
                 ]

if gtype eq 'Track' then begin
     xmin=4.2
     xmax=3.0
     ymin=-1.0
     ymax=3.5
endif
endif


title=outfile
if gtype eq 'Track' then begin

         outfile=outfile+'track.ps'
         GraphTrackModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Tracknopms' then begin

         outfile=outfile+'tracknopms.ps'
         print, outdirectory, outfile
         GraphTracknopmsModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'TracknopmsTess' then begin

         outfile=outfile+'tracknopmsTess.ps'
         GraphTracknopmsModelTess, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Tracknopmspub' then begin

         outfile=outfile+'tracknopmspub.ps'
         GraphTracknopmsModelpub, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'TrackConv' then begin

         outfile=outfile+'track.ps'
         GraphTrackConvecModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Rot' then begin
        outfile=outfile+'rot.ps'
        GraphRotModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Calibrate' then begin
        outfile=outfile+'cali.ps'
        GraphCalibrateModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'CoreR' then begin
        outfile=outfile+'coreR.ps'
        GraphCoreRModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'SurfaceR' then begin
        outfile=outfile+'surfaceR.ps'
        GraphSurfaceRModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Surfacelogg' then begin
        outfile=outfile+'surfacelogg2021.ps'
        GraphSurfaceloggModelsg2021, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title

;        outfile=outfile+'surfacelogg.ps'
;        GraphSurfaceloggModelsg, type, outdirectory, datadirectory, infiles, $
;         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'SurfaceloggCE' then begin
        outfile=outfile+'surfacelogg2021CoreEnv.ps'
        GraphSurfaceloggModelsg2021CoreEnv, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title

;        outfile=outfile+'surfacelogg.ps'
;        GraphSurfaceloggModelsg, type, outdirectory, datadirectory, infiles, $
;         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'SurfaceRKms' then begin
        outfile=outfile+'surfaceRkms.ps'
        GraphSurfaceRKmsModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'SurfaceTeffKms' then begin
        outfile=outfile+'surfaceTeffkms.ps'
        GraphSurfaceTeffKmsModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'SurfacePMass' then begin
        outfile=outfile+'surfPmass.ps'
        GraphSurfacePMassModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'CoreRpub2' then begin
        outfile=outfile+'coreRpub2.ps'
        GraphCoreRModelpub2, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'CoreRPub' then begin
        outfile=outfile+'coreRPub2.ps'
        GraphCoreRPub2Model, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RotLogg' then begin
        outfile=outfile+'RotLogg.ps'
        GraphRotLoggModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'TeffLogg' then begin
        outfile=outfile+'TeffLogg.ps'
        GraphTeffLoggModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'LumLogg' then begin
        outfile=outfile+'LumLogg.ps'
        GraphLumLoggModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'TeffLoggData' then begin
        outfile=outfile+'TeffLoggData.ps'
        GraphTeffLoggModelData, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif

if gtype eq 'Li' then begin
        outfile=outfile+'Li.ps'
        GraphLiModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'OttoCali' then begin
        outfile=outfile+'Ottocali.ps'
        GraphOttoCaliModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title, $
         OttoAge, OttoTeff, OttoR, OttoLogg, OttoRbce, OmCDeH, OmSDeH, OttoRho
endif
if gtype eq 'RotLayers' then begin
        outfile=outfile+'RotLayers.ps'
        hlines=9
        GraphRotLayersModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RotLayersP' then begin
        outfile=outfile+'RotLayersP.ps'
        hlines=9
        GraphRotLayersPModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif

if gtype eq 'StructLayers' then begin
        outfile=outfile+'StructLayers.ps'
        hlines=9
        GraphStructLayersModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'HLayers' then begin
        outfile=outfile+'HLayers.ps'
        hlines=9
        GraphHLayersModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'TrackAS' then begin

         outfile=outfile+'trackAS.ps'
         GraphTrackASModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title, $
            OttoRho, OttoLogg
endif
if gtype eq 'Rot2z' then begin
        outfile=outfile+'rot2z.ps'
        GraphRot2zModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RotKms' then begin
        outfile=outfile+'rotkms.ps'
        GraphRotKmsModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RotKmsClump' then begin
        outfile=outfile+'rotkmsclump.ps'
        GraphRotKmsClumpModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RotKmsM' then begin
        outfile=outfile+'rotkmsM.ps'
        GraphRotKmsMModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'JdotM' then begin
        outfile=outfile+'JdotM.ps'
        GraphJdotMModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RotRatio' then begin
        outfile=outfile+'rotratio.ps'
        GraphRotRatioModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RotKmspub2' then begin
        outfile=outfile+'rotkmspub2.ps'
        GraphRotKmsModelpub2, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'BCZLogg' then begin
        outfile=outfile+'BCZLogg.ps'
        GraphBCZLoggModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Temp' then begin
        outfile=outfile+'temp.ps'
        GraphTempModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RhoOm' then begin
        outfile=outfile+'RhoOm.ps'
        GraphDensityOmegaModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif

if gtype eq 'ROm' then begin
        outfile=outfile+'ROm.ps'
        GraphROmModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Deg' then begin
        outfile=outfile+'Deg.ps'
        GraphDegModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Deg2' then begin
        outfile=outfile+'Deg2.ps'
        GraphDegModel2, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'TeffLoggDiff2' then begin
        outfile=outfile+'TeffLoggDiff2.ps'
        GraphTeffLoggDiff2Model, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'CoreM' then begin
        outfile=outfile+'CoreM.ps'
        GraphCoreMModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Reimers' then begin
        outfile=outfile+'Reimers.ps'
        CalcReimersModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'CNLogg' then begin
        outfile=outfile+'CNLogg.ps'
        GraphCNLoggModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'He3Logg' then begin
        outfile=outfile+'He3Logg.ps'
        GraphHe3LoggModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'H2Age' then begin
        outfile=outfile+'H2Age.ps'
        GraphH2AgeModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'CN' then begin
        outfile=outfile+'CN.ps'
        GraphCNModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif

if gtype eq 'TauCZ' then begin
        outfile=outfile+'TauCZ.ps'
        GraphTauczModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Rossby' then begin
        outfile=outfile+'Rossby.ps'
        GraphRossbyModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
end
