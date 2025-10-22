pro GraphGrid, type, gtype

; Jamie Tayar 8/29/2012
; Reads in the output of the stellar evolution code
;  file(s) *.track and plots logTeff and logL 
; (although it should be trivial to change it to plot 
; whatever pair of parameters you want
; gtype options are do you want rotational graphs 
; or mass luminosity plots.
;
;
; JT 3/14/2013
; This is the input parameters file for creating
; graphs of the YREC Model Grid.  It stores the 
; parameters for a group of plots and outputs them
; as necessary for each graphing group.
;

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

if gtype eq 'Track' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=1.5
endif

if gtype eq 'C1213' then begin
    xmin=0.5
    xmax=2.5
    ymin=0
    ymax=30
endif
if gtype eq 'CN' then begin
    xmin=0.5
    xmax=2.5
    ymin=-1.0
    ymax=0.5
endif

if gtype eq 'CNLogg' then begin
    xmin=3.5
    xmax=1.0
    ymin=-1.0
    ymax=0.5
endif
if gtype eq 'He3Logg' then begin
    xmin=3.7
    xmax=1.0
    ymin=0.0
    ymax=0.01
endif
if gtype eq 'LiLogg' then begin
    xmin=3.5
    xmax=1.0
    ymin=-2
    ymax=2
endif
if gtype eq 'LiMass' then begin
    xmin=2.2
    xmax=0.8
    ymin=-2
    ymax=2
endif
if gtype eq 'LiAge' then begin
    xmin=0
    xmax=12
    ymin=-2
    ymax=2
endif

if gtype eq 'write' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=1.5
endif
if gtype eq 'Tracknopms' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=1.5
endif
if gtype eq 'RTracknopms' then begin
    xmin=3.8
    xmax=3.55
    ymin=-1
    ymax=1.5
endif

if gtype eq 'Tracklin' then begin
    xmin=8000
    xmax=3000
    ymin=-.5
    ymax=1.5
endif

if gtype eq 'TeffLoggDiff2' then begin
     xmin=200
     xmax=-200
     ymin=4.0
     ymax=0.0
endif

if gtype eq 'TrackConv' then begin
    xmin=8000
    xmax=3000
    ymin=-.5
    ymax=1.5
endif

if gtype eq 'Calibrate' then begin
    xmin=-1
    xmax=1
    ymin=-.1
    ymax=.1
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

if gtype eq 'RotLogg' then begin
     xmin=0
     xmax=5
     ymin=1
     ymax=10000
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

if gtype eq 'TeffLogg' then begin
     xmin=3500
     xmax=5500
     ymin=0
     ymax=3.5
endif
if gtype eq 'TeffLoggData' then begin
     xmin=3500
     xmax=5500
     ymin=0
     ymax=3.5
endif

if gtype eq 'RotLayers' then begin
     xmin=0
     xmax=1.1
     ymin=-5
     ymax=5
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
    xmin=-6
    xmax=2
    ymin=0
    ymax=450
endif
if gtype eq 'Age' then begin
    xmin=-1
    xmax=10
    ymin=0
    ymax=20
endif
if gtype eq 'Deg' then begin
    xmin=.1
    xmax=3
    ymin=.01
    ymax=100
endif
    hlines=14 ; number of header lines
    outdirectory= '~/EVOLUTION/output/GridGraphs/'


if type eq 'RGcali' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/RGcalibration/RGcali_out/'
    infiles=[  'solar_cal_atmos', 'solar_cal_diffco', $
              'solar_cal_nodiff', $
              'solar_cal_nuchigh', 'solar_cal_nuclow', 'solar_cal_opacity',$
              'solar_cal_oversh_02', 'solar_cal_scv',  $
              'solar_cal_yale', 'solar_cal' ]
    outfile= 'RGcal_test'
    outtext='Solar Calibration'
    textperrun=[ 'atmos', 'diffco', 'nodiff', $
                'nuchigh', 'nuclow', 'opacity', 'oversh', 'scv',  $
                'yale', 'cal']
if gtype eq 'Track' then begin
    xmin=3.763
    xmax=3.76
    ymin=-.001
    ymax=.001
endif
endif

if type eq 'nodiffGrid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ 'm080zhm140y264a18_nodiff', 'm080zhp040y264a18_nodiff', 'm160zhm140y264a18_nodiff', 'm160zhp040y264a18_nodiff']
    outfile= 'nodiffgrid'
    outtext='No diffusion'
    textperrun=[ '80-1.40', '80+.40', '160-1.40', '160+.40']
if gtype eq 'Track' then begin
    xmin=4.1
    xmax=3.50
    ymin=-1.5
    ymax=3.5
endif



if gtype eq 'OttoCali' then begin
    xmin=-.002
    xmax=.002
    ymin=-.01
    ymax=.01
    OttoAge= 4.568; 12.2 Solar values I think 
    OttoR= 1 ;2.62
    OttoTeff=5771 ; 5363
    OttoLogg= 4.438 ;3.52
    OttoRbce= .715 ;.36  (.705 Solar value from Antia et al 1998, (.715 models Brun et al 2011)
    OmCDeH=2.86e-6
    OmSDeH=2.86e-6
    OttoRho=1.409
endif

endif

if type eq 'nodiff2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ 'm080zhp040y264a18HT11_nodiff', 'm080zhp040y264a18HT21_nodiff','m080zhp040y264a18HT31_nodiff',$
              'm160zhp040y264a18HT11_nodiff', 'm160zhp040y264a18HT21_nodiff','m160zhp040y264a18HT31_nodiff',$
              'm150zhm140y264a18_nodiff', 'm160zhm120y264a18_nodiff']
    outfile= 'nodiff2'
    outtext='No diffusion'
    textperrun=[ '80HT11', '80HT21', '80HT31', '160HT11', '160HT21', '160HT31', '150-140', '160-120']
if gtype eq 'Track' then begin
    xmin=4.1
    xmax=3.50
    ymin=-1.5
    ymax=3.5
endif


if gtype eq 'OttoCali' then begin
    xmin=-.002
    xmax=.002
    ymin=-.01
    ymax=.01
    OttoAge= 4.568; 12.2 Solar values I think 
    OttoR= 1 ;2.62
    OttoTeff=5771 ; 5363
    OttoLogg= 4.438 ;3.52
    OttoRbce= .715 ;.36  (.705 Solar value from Antia et al 1998, (.715 models Brun et al 2011)
    OmCDeH=2.86e-6
    OmSDeH=2.86e-6
    OttoRho=1.409
endif

endif


if type eq 'screw160' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ 'm160zhp040y264a18T65e5_nodiff','m160zhp040y264a18T61e5_nodiff', 'm160zhp040y264a18T75e1_nodiff','m160zhp040y264a18T75e2_nodiff',$
              'm160zhp040y264a18Tg81e1_nodiff', 'm160zhp040y264a18Tg81e2_nodiff','m160zhp040y264a18T6Tg81e2_nodiff',$
              'm160zhp040y264a18HPbig_nodiff', 'm160zhp040y264a18HPsm_nodiff','m160zhp040y264a18HPsmT6_nodiff','m160zhp040y264a18HPbigT6_nodiff', $
              'm160zhp040y264a18T67HPbig_nodiff','m160zhp040y264a18T6HPbigHT31_nodiff','m160zhp040y264a18T6HPbigHT41_nodiff']
    outfile= 'screw160'
    outtext='No diffusion'
    textperrun=[ 'T65e5', 'T61e5', 'T75e1', 'T75e2', 'Tg81e1', 'Tg81e2', 'T6Tg81e2', 'HPbig', 'HPsm', 'HPsmT6', 'HPbigT6', $
                'T67HPbig', 'T6HPbigHT31', 'T6HPbigHT41']
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.6
    ymin=-0.5
    ymax=2.5
endif


if gtype eq 'OttoCali' then begin
    xmin=-.002
    xmax=.002
    ymin=-.01
    ymax=.01
    OttoAge= 4.568; 12.2 Solar values I think 
    OttoR= 1 ;2.62
    OttoTeff=5771 ; 5363
    OttoLogg= 4.438 ;3.52
    OttoRbce= .715 ;.36  (.705 Solar value from Antia et al 1998, (.715 models Brun et al 2011)
    OmCDeH=2.86e-6
    OmSDeH=2.86e-6
    OttoRho=1.409
endif

endif


if type eq 'corners1' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ 'm160zhp040y264a18A6HPT11HPT2_nodiff', 'm160zhm120y264a18A6HPT11HPT2_nodiff', $
              'm080zhp040y264a18A6HPT11HPT2_nodiff', 'm080zhm140y264a18A6HPT11HPT2_nodiff', $
              'm090zhp020y264a18A6HPT11HPT2_nodiff']
;              'm160zhp040y264a18T6SENV_nodiff', 'm160zhm120y264a18T6SENV_nodiff', $
;              'm080zhp040y264a18T6SENV_nodiff', 'm080zhm140y264a18T6SENV_nodiff', $
;              'm160zhp040y264a18T6HPbigHT41SENV_nodiff', 'm160zhm120y264a18T6HPbigHT41SENV_nodiff', $
;              'm080zhp040y264a18T6HPbigHT41SENV_nodiff', 'm080zhm140y264a18T6HPbigHT41SENV_nodiff', $
;              'm160zhp040y264a18T6HPbigSENV_nodiff','m080zhp040y264a18T6HPbigSENV_nodiff', $
;              'm160zhp040y264a18T6HT41SENV_nodiff','m080zhp040y264a18T6HT41SENV_nodiff']
    outfile= 'corners2'
    outtext='No diffusion'
    textperrun=[ 'm160zp40', 'm160zm120', 'm80zp40', 'm80zm140','m090zp020'];,$ 
;                 'm160zp40HPHT', 'm160zm120HPHT', 'm80zp40HPHT', 'm80zm140HPHT', $
;                 'm160zp40HP', 'm80zp40HP', 'm160zp40HT', 'm160zp40HT']
if gtype eq 'Track' then begin
    xmin=4.1
    xmax=3.3
    ymin=-1.0
    ymax=3.5
endif


if gtype eq 'OttoCali' then begin
    xmin=-.002
    xmax=.002
    ymin=-.01
    ymax=.01
    OttoAge= 4.568; 12.2 Solar values I think 
    OttoR= 1 ;2.62
    OttoTeff=5771 ; 5363
    OttoLogg= 4.438 ;3.52
    OttoRbce= .715 ;.36  (.705 Solar value from Antia et al 1998, (.715 models Brun et al 2011)
    OmCDeH=2.86e-6
    OmSDeH=2.86e-6
    OttoRho=1.409
endif

endif

if type eq 'check80+40' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm080zhp040y264a18_nodiff']

    outfile= 'check8040'
    outtext='No diffusion'
    textperrun=[ 'm80+40']
if gtype eq 'Track' then begin
    xmin=4.1
    xmax=3.3
    ymin=-1.0
    ymax=3.5
endif
endif
if type eq 'm1' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ 'm100zhm000y264a18_nodiff', 'm100zhm000y264a18A6HPT9_nodiff',$
;              'm100zhm000y264a18AT6_nodiff','m100zhm000y264a18HPT2_nodiff', $
;              'm100zhm000y264a18HPT3_nodiff','m100zhm000y264a18HPT8_nodiff', $
;              'm100zhm000y264a18HPT9_nodiff', 'm100zhm000y264a18HPT10_nodiff', $
;              'm100zhm000y264a18HPT11_nodiff','m100zhm000y264a18HT41_nodiff', $
              'm100zhm000y264a18HT52_nodiff','m100zhm000y264a18Otto_nodiff',$
             'm100zhm000y264a18LSENV_nodiff','m100zhm000y264a18A6HPT11_nodiff', $
              'm100zhm000y264a18HP911_nodiff','m100zhm000y264a18A6HPT911_nodiff',$
              'm100zhm000y264a18A6HPT11HT41_nodiff','m100zhm000y264a18A6HPT11HT52_nodiff',$
              'm100zhm000y264a18A6HPT11HPT2_nodiff','m100zhm000y264a18A6HPT11HPT3_nodiff',$
              'm100zhm000y264a18A6HPT11HPT8_nodiff','m100zhm000y264a18A6HPT11HPT10_nodiff',$
              'm100zhm000y264a18A6HPT11LSENV_nodiff','m100zhm000y264a18HPT11HPT2_nodiff']
    outfile= 'm1'
    outtext='No diffusion'
    textperrun=['original','A6HP9',$
;                'AT6', 'HP2', 'HP3', 'HP8', 'HP9', 'HP10', 'HP11','HT41', 
                'HT52','Otto', 'LSENV','A6HP11', 'HP911','A6HP911',$
                 'A6HP11HT41', 'A6HP11HT52', 'A6HP11HP2', 'A6HP11HP3', $
                 'A6HP11HP8', 'A6HP11HP10', 'A6HP11LSENV', 'onlyHP211']
if gtype eq 'Track' then begin
    xmin=4.1
    xmax=3.3
    ymin=-1.0
    ymax= 3.5
endif
endif

if type eq '130p020' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm130zhp020y264a13_nodiff']

    outfile= 'check130p20'
    outtext='No diffusion'
    textperrun=[ 'm130+20']
if gtype eq 'Track' then begin
    xmin=3.8
    xmax=3.3
    ymin=-0.5
    ymax=3.5
endif
endif
if type eq 'm80m2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm080zhm180y264a18_nodiff', 'm080zhm200y264a18_nodiff', 'm080zhm220y264a18_nodiff']

    outfile= 'checkm80m2'
    outtext='No diffusion'
    textperrun=[ 'm180', 'm200', 'm220']
if gtype eq 'Track' then begin
;    xmin=3.68
;    xmax=3.66
;    ymin=.5
    ymax=3.2
endif
endif
if type eq 'm80lowz' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/newstarts/'
    infiles=[ $
              'm080zhm000y264a18_nodiff', 'm080zhm001y264a18_nodiff', 'm080zhm005y264a18_nodiff', $
              'm080zhm010y264a18_nodiff', 'm080zhm020y264a18_nodiff', 'm080zhm050y264a18_nodiff', $
              'm080zhm060y264a18_nodiff', 'm080zhm070y264a18_nodiff', 'm080zhm080y264a18_nodiff', $
              'm080zhm090y264a18_nodiff', 'm080zhm100y264a18_nodiff',  $
              'm080zhm150y264a18_nodiff',  'm080zhm200y264a18_nodiff', $
              'm080zhm210y264a18_nodiff', 'm080zhm220y264a18_nodiff', 'm080zhm221y264a18_nodiff', $
              'm080zhm222y264a18_nodiff', 'm080zhm223y264a18_nodiff','m080zhm230y264a18_nodiff', $
              'm080zhm240y264a18_nodiff', 'm080zhm250y264a18_nodiff']
    outfile= 'checkm80m2'
    outtext='No diffusion'
    textperrun=[ 'm000', 'm001','m005','m010','m020','m050','m060','m070','m080', $
                 'm090', 'm100','m150','m200','m210','m220','m230', $
                 'm240', 'm250']
if gtype eq 'Track' then begin
    xmin=3.75
    xmax=3.60
    ymin=0.2
    ymax=0.7
endif
endif

if type eq 'm130lowz' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/newstarts/'
    infiles=[ $
              'm130zhm000y264a18_nodiff', 'm130zhm001y264a18_nodiff', 'm130zhm005y264a18_nodiff', $
              'm130zhm010y264a18_nodiff', 'm130zhm020y264a18_nodiff', 'm130zhm050y264a18_nodiff', $
              'm130zhm060y264a18_nodiff', 'm130zhm070y264a18_nodiff', 'm130zhm080y264a18_nodiff', $
              'm130zhm090y264a18_nodiff', 'm130zhm100y264a18_nodiff',  $
              'm130zhm150y264a18_nodiff',  'm130zhm200y264a18_nodiff', $
              'm130zhm210y264a18_nodiff', 'm130zhm220y264a18_nodiff', 'm130zhm221y264a18_nodiff', $
              'm130zhm222y264a18_nodiff', 'm130zhm223y264a18_nodiff','m130zhm230y264a18_nodiff', $
              'm130zhm240y264a18_nodiff', 'm130zhm250y264a18_nodiff']
    outfile= 'checkm130m2'
    outtext='No diffusion'
    textperrun=[ 'm000', 'm001','m005','m010','m020','m050','m060','m070','m080', $
                 'm090', 'm100','m150','m200','m210','m220','m230', $
                 'm240', 'm250']
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.60
    ymin=0.5
    ymax=1.7
endif
endif

if type eq 'm120lowz' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/newstarts/'
    infiles=[ $
              'm120zhm000y264a18_nodiff', 'm120zhm001y264a18_nodiff', 'm120zhm005y264a18_nodiff', $
              'm120zhm010y264a18_nodiff', 'm120zhm020y264a18_nodiff', 'm120zhm050y264a18_nodiff', $
              'm120zhm060y264a18_nodiff', 'm120zhm070y264a18_nodiff', 'm120zhm080y264a18_nodiff', $
              'm120zhm090y264a18_nodiff', 'm120zhm100y264a18_nodiff',  $
              'm120zhm150y264a18_nodiff', 'm120zhm200y264a18_nodiff', 'm120zhm210y264a18_nodiff',$
              'm120zhm215y264a18_nodiff', 'm120zhm220y264a18_nodiff', 'm120zhm221y264a18_nodiff', $
              'm120zhm222y264a18_nodiff', 'm120zhm223y264a18_nodiff','m120zhm230y264a18_nodiff', $
              'm120zhm240y264a18_nodiff', 'm120zhm250y264a18_nodiff']
    outfile= 'checkm120m2'
    outtext='No diffusion'
    textperrun=[ 'm000', 'm001','m005','m010','m020','m050','m060','m070','m080', $
                 'm090', 'm100','m150','m200','m210','m215','m220','m230', $
                 'm240', 'm250']
if gtype eq 'Track' then begin
    xmin=3.9
    xmax=3.60
    ymin=0.5
    ymax=1.2
endif
endif
if type eq 'CEphys' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/CEtestphysics/CEtestphy_out/'
    infiles=[ $
              'm100zhm100y240a13_nodiff',  'm100zhm100y280a13_nodiff', $
              'm100zhm100y240a23_nodiff',  'm100zhm100y280a23_nodiff', $
              'm100zhm200y240a13_nodiff',  'm100zhm200y280a13_nodiff', $
              'm100zhm200y240a23_nodiff',  'm100zhm200y280a23_nodiff', $
              'm130zhm100y240a13_nodiff',  'm130zhm100y280a13_nodiff', $
              'm130zhm100y240a23_nodiff',  'm130zhm100y280a23_nodiff', $
              'm130zhm200y240a13_nodiff',  'm130zhm200y280a13_nodiff', $
              'm130zhm200y240a23_nodiff',  'm130zhm200y280a23_nodiff', $
              'm100zhm100y272a18____scv',  'm100zhm200y272a18____scv', $
              'm130zhm100y272a18____scv',  'm130zhm200y272a18____scv' $

            ]

    outfile= 'CEphys'
    outtext='regular, scv'
    textperrun=[ '100z-1y240a13',  '100z-1y280a13', '100z-1y240a23', '100z-1y280a23', $
                 '100z-2y240a13',  '100z-2y280a13', '100z-2y240a23', '100z-2y280a23', $
                 '130z-1y240a13',  '130z-1y280a13', '130z-1y240a23', '130z-1y280a23', $
                 '130z-2y240a13',  '130z-2y280a13', '130z-2y240a23', '130z-2y280a23', $
                 '100z-1scv',  '100z-2scv', '130z-1scv', '130z-2scv']
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=-0.5
    ymax=3.5
endif
endif

if type eq 'CEscv' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/CEtestphysics/CEtestphy_out/'
    infiles=[ $
              'm100zhm100y272a18____scv',  'm100zhm200y272a18____scv', $
              'm130zhm100y272a18____scv',  'm130zhm200y272a18____scv' $

            ]

    outfile= 'CEscv'
    outtext='scv'
    textperrun=[  $
                 '100z-1scv',  '100z-2scv', '130z-1scv', '130z-2scv']
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=-0.5
    ymax=3.5
endif
endif

if type eq 'CEdiffco' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/CEtestphysics/CEtestphy_out/'
    infiles=[ $
              'm100zhm100y273a20_diffco',  'm100zhm200y273a20_diffco', $
              'm130zhm100y273a20_diffco',  'm130zhm200y273a20_diffco' $

            ]

    outfile= 'CEdiffco'
    outtext='diffco'
    textperrun=[  $
                 '100z-1diffco',  '100z-2diffco', '130z-1diffco', '130z-2diffco']
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=-0.5
    ymax=3.5
endif
endif
if type eq 'CEm1zhm1' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/CEtestphysics/CEtestphy_out/'
    infiles=[ $
              'm100zhm100y240a13___diff',  'm100zhm100y280a13___diff', $
              'm100zhm100y240a23___diff',  'm100zhm100y280a23___diff', $
              'm100zhm100y264a18_nodiff',  'm100zhm100y265a19___yale', $
              'm100zhm100y271a19_nuclow',  'm100zhm100y272a18__atmos', $
              'm100zhm100y272a18____scv',  'm100zhm100y272a19_opacit', $
              'm100zhm100y273a19_nuchig',  'm100zhm100y273a20_diffco', $
              'm100zhm100y275a19_ovrsh2' $
            ]

    outfile= 'CEm1zhm1'
    outtext='m1 zh-1 age where log(g)=2.0'
    textperrun=[ 'y240a13', 'y280a13', 'y240a23', 'y280a23',  $
                 'nodiff', 'yale', 'nuclow', 'atmos', 'scv', 'opacit', 'nuchig', 'diffco', 'oversh2' ]
if gtype eq 'Age' then begin
    xmin=-.1
    xmax=13
    ymin=5
    ymax=8
endif
endif

if type eq 'CEm1zhm2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/CEtestphysics/CEtestphy_out/'
    infiles=[ $
              'm100zhm200y240a13___diff',  'm100zhm200y280a13___diff', $
              'm100zhm200y240a23___diff',  'm100zhm200y280a23___diff', $
              'm100zhm200y264a18_nodiff',  'm100zhm200y265a19___yale', $
              'm100zhm200y271a19_nuclow',  'm100zhm200y272a18__atmos', $
              'm100zhm200y272a18____scv',  'm100zhm200y272a19_opacit', $
              'm100zhm200y273a19_nuchig',  'm100zhm200y273a20_diffco', $
              'm100zhm200y275a19_ovrsh2' $
            ]

    outfile= 'CEm1zhm2'
    outtext='m1 zh-2 age where log(g)=2.0'
    textperrun=[ 'y240a13', 'y280a13', 'y240a23', 'y280a23',  $
                 'nodiff', 'yale', 'nuclow', 'atmos', 'scv', 'opacit', 'nuchig', 'diffco', 'oversh2' ]
if gtype eq 'Age' then begin
    xmin=-.1
    xmax=13
    ymin=4
    ymax=7
endif
endif

if type eq 'CEm13zhm1' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/CEtestphysics/CEtestphy_out/'
    infiles=[ $
              'm130zhm100y240a13___diff',  'm130zhm100y280a13___diff', $
              'm130zhm100y240a23___diff',  'm130zhm100y280a23___diff', $
              'm130zhm100y264a18_nodiff',  'm130zhm100y265a19___yale', $
              'm130zhm100y271a19_nuclow',  'm130zhm100y272a18__atmos', $
              'm130zhm100y272a18____scv',  'm130zhm100y272a19_opacit', $
              'm130zhm100y273a19_nuchig',  'm130zhm100y273a20_diffco', $
              'm130zhm100y275a19_ovrsh2' $
            ]

    outfile= 'CEm13zhm1'
    outtext='m1.3 zh-1 age where log(g)=2.0'
    textperrun=[ 'y240a13', 'y280a13', 'y240a23', 'y280a23',  $
                 'nodiff', 'yale', 'nuclow', 'atmos', 'scv', 'opacit', 'nuchig', 'diffco', 'oversh2' ]
if gtype eq 'Age' then begin
    xmin=-.1
    xmax=13
    ymin=2
    ymax=3
endif
endif

if type eq 'CEm13zhm2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/CEtestphysics/CEtestphy_out/'
    infiles=[ $
              'm130zhm200y240a13___diff',  'm130zhm200y280a13___diff', $
              'm130zhm200y240a23___diff',  'm130zhm200y280a23___diff', $
              'm130zhm200y264a18_nodiff',  'm130zhm200y265a19___yale', $
              'm130zhm200y271a19_nuclow',  'm130zhm200y272a18__atmos', $
              'm130zhm200y272a18____scv',  'm130zhm200y272a19_opacit', $
              'm130zhm200y273a19_nuchig',  'm130zhm200y273a20_diffco', $
              'm130zhm200y275a19_ovrsh2' $
            ]

    outfile= 'CEm13zhm2'
    outtext='m13 zh-2 age where log(g)=2.0'
    textperrun=[ 'y240a13', 'y280a13', 'y240a23', 'y280a23',  $
                 'nodiff', 'yale', 'nuclow', 'atmos', 'scv', 'opacit', 'nuchig', 'diffco', 'oversh2' ]
if gtype eq 'Age' then begin
    xmin=-.1
    xmax=13
    ymin=1.5
    ymax=3
endif
endif

if type eq 'CEbase' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/CEtestphysics/CEtestphy_out/'
    infiles=[ $
              'm130zhm200y272a19___diff',  'm130zhm100y272a19___diff', $
              'm100zhm200y272a19___diff',  'm100zhm100y272a19___diff' $
 
            ]

    outfile= 'CEbase'
    outtext='base log(g)=2.5'
    textperrun=[ '130m2', '130m1', '100m2', '100m1' ]
if gtype eq 'Age' then begin
    xmin=-.1
    xmax=13
    ymin=1.5
    ymax=3
endif
endif
if type eq 'm100p04' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/'
    infiles=[ $
              'nodiff_out/m100zhp040y264a18al00_nodiffb',$
              'testparams/m100zhp040y264a18al00_nodiffb',$
              'testparams/m100zhp040y264a18al00_nodiffMPc'$
            ]

    outfile= '100p04'
    outtext=''
    textperrun=['oldnum', 'H10', 'MPc' ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif
if type eq 'gridprob' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm120zhm040y264a18al00_nodiff', $
              'm120zhm000y264a18al00_nodiff', $
              'm120zhp040y264a18al00_nodiff',$
              'm120zhm040y264a18_nodiff', $
              'm120zhm000y264a18_nodiff', $
              'm120zhp040y264a18_nodiff'$
            ]

    outfile= 'gridprob'
    outtext='base log(g)=2.5'
    textperrun=[ '-0.4', '0.0', '0.4', '-0.4o', '0.0o', '0.4o'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.5
    ymin=-.5
    ymax=3.0
endif
if gtype eq 'TeffLogg' then begin
     xmin=5100
     xmax=3900
     ymin=3.5
     ymax=1.3
endif
endif

if type eq 'newcorner' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiff', $
              'm060zhm200y264a18al00_nodiff', $
              'm260zhp040y264a18al00_nodiff',$
              'm260zhm200y264a18al00_nodiff'$
            ]

    outfile= 'newcorner'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif
if type eq 'newcorner10' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffA10b', $
              'm060zhm200y264a18al00_nodiffA10b', $
              'm260zhp040y264a18al00_nodiffA10b',$
              'm260zhm200y264a18al00_nodiffA10b'$
            ]

    outfile= 'newcorner10'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif
if type eq 'newcorner2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffA2b', $
              'm060zhm200y264a18al00_nodiffA2b', $
              'm260zhp040y264a18al00_nodiffA2b',$
              'm260zhm200y264a18al00_nodiffA2b'$
            ]

    outfile= 'newcorner2'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif
if type eq 'newcorner2A10' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ 'm260zhp040y264a18al00_nodiffA10',$
              'm060zhp040y264a18al00_nodiff10A2b', $
              'm060zhm200y264a18al00_nodiff10A2b', $
              'm260zhp040y264a18al00_nodiff10A2b',$
              'm260zhm200y264a18al00_nodiff10A2b'$
            ]

    outfile= 'newcorner2A10'
    outtext=''
    textperrun=[ 'A10','.6+.4', '.6-2.', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif
if type eq 'newcornerA10c' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ 'm260zhp040y264a18al00_nodiffA10',$
              'm060zhp040y264a18al00_nodiffA10c', $
              'm060zhm200y264a18al00_nodiffA10c', $
              'm260zhp040y264a18al00_nodiffA10c',$
              'm260zhm200y264a18al00_nodiffA10c'$
            ]

    outfile= 'newcornerA10c'
    outtext=''
    textperrun=[ 'A10','.6+.4', '.6-2.', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif
if type eq 'newcornerA10cHb' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffA10cHb', $
              'm060zhm200y264a18al00_nodiffA10cHb', $
              'm260zhp040y264a18al00_nodiffA10cHb',$
              'm260zhm200y264a18al00_nodiffA10cHb'$
            ]

    outfile= 'newcornerA10cHb'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif
if type eq 'newcornerA10cHb6b' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffA10cHb6b', $
              'm060zhm200y264a18al00_nodiffA10cHb6b', $
              'm260zhp040y264a18al00_nodiffA10cHb6b',$
              'm260zhm200y264a18al00_nodiffA10cHb6b'$
            ]

    outfile= 'newcornerA10cHb6b'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif

if type eq 'newcornerMP2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffMP2', $
              'm060zhm200y264a18al00_nodiffMP2', $
              'm260zhp040y264a18al00_nodiffMP2',$
              'm260zhm200y264a18al00_nodiffMP2'$
            ]

    outfile= 'newcornerMP2'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif

if type eq 'newcornerMP2c' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffMP2c', $
              'm060zhm200y264a18al00_nodiffMP2c', $
              'm260zhp040y264a18al00_nodiffMP2c',$
              'm260zhm200y264a18al00_nodiffMP2c',$
              'm100zhp040y264a18al00_nodiffMPc'$
            ]

    outfile= 'newcornerMP2c'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.', '1.0+.4'  ]
if gtype eq 'Track' then begin
    xmin=4.3 ;3.75 ;
    xmax=3.0 ;3.55 ;
    ymin=-1.5 ;0.8 ;
    ymax=3.5;1.0 ;
endif
endif

if type eq 'newcornerMPcA6' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffMPcA6', $
              'm060zhm200y264a18al00_nodiffMPcA6', $
              'm260zhp040y264a18al00_nodiffMPcA6',$
              'm260zhm200y264a18al00_nodiffMPcA6',$
              'm100zhp040y264a18al00_nodiffMPcA6'$
            ]

    outfile= 'newcornerMP2cA6'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.', '1.0+.4'  ]
if gtype eq 'Track' then begin
    xmin=4.3 ;3.75 ;
    xmax=3.0 ;3.55 ;
    ymin=-1.5 ;0.8 ;
    ymax=3.5;1.0 ;
endif
endif
if type eq 'newcornerMPcA6b' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffMPcA6btest', $
              'm060zhp040y264a18al00_nodiffMPcA6b', $
              'm060zhm200y264a18al00_nodiffMPcA6b', $
              'm260zhp040y264a18al00_nodiffMPcA6b',$
              'm260zhm200y264a18al00_nodiffMPcA6b',$
              'm100zhp040y264a18al00_nodiffMPcA6b'$
            ]

    outfile= 'newcornerMP2cA6b'
    outtext=''
    textperrun=[ '.6+.4ffirst','.6+.4', '.6-2.', '2.6+.4', '2.6-2.', '1.0+.4'  ]
if gtype eq 'Track' then begin
    xmin=4.3 ;3.75 ;
    xmax=3.0 ;3.55 ;
    ymin=-1.5 ;0.8 ;
    ymax=3.5;1.0 ;
endif
endif

if type eq 'newcorneropal' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffopal', $
              'm060zhm200y264a18al00_nodiffopal', $
              'm260zhp040y264a18al00_nodiffopal',$
              'm260zhm200y264a18al00_nodiffopal',$
              'm100zhp040y264a18al00_nodiffopal'$
            ]

    outfile= 'newcorneropal'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.', '1.0+.4'  ]
if gtype eq 'Track' then begin
    xmin=4.3 ;3.75 ;
    xmax=3.0 ;3.55 ;
    ymin=-1.5 ;0.8 ;
    ymax=3.5;1.0 ;
endif
endif

if type eq '2.6+.4' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm260zhp040y264a18al00_nodiff','m260zhp040y264a18al00_nodiff11', $
              'm260zhp040y264a18al00_nodiff21', 'm260zhp040y264a18al00_nodiff31', $
              'm260zhp040y264a18al00_nodiff41', 'm260zhp040y264a18al00_nodiff51'$
            ]

    outfile= 'htoler26p4'
    outtext=''
    textperrun=['2.6+.4', '11', '21', '31', '41', '51'  ]
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.9
    ymin=1.2
    ymax=1.8
endif
endif
if type eq '2.6+.4HT2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm260zhp040y264a18al00_nodiff','m260zhp040y264a18al00_nodiff12', $
              'm260zhp040y264a18al00_nodiff22', 'm260zhp040y264a18al00_nodiff32', $
              'm260zhp040y264a18al00_nodiff42', 'm260zhp040y264a18al00_nodiff52'$
            ]

    outfile= 'htoler26p4HT2'
    outtext=''
    textperrun=['2.6+.4', '12', '22', '32', '42', '52'  ]
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.9
    ymin=1.2
    ymax=1.8
endif
endif
if type eq '0.6+.4H' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffA10cH11','m060zhp040y264a18al00_nodiffA10cH21', $
              'm060zhp040y264a18al00_nodiffA10cH31', 'm060zhp040y264a18al00_nodiff', $
              'm060zhp040y264a18al00_nodiffA10cH', $ 
              'm060zhp040y264a18al00_nodiffA10cH121','m060zhp040y264a18al00_nodiffA10cH131' $
            ]

    outfile= 'htoler26p4HT2'
    outtext=''
    textperrun=[ '11', '21', '31', '0.6+.4', '123', '121','131'  ]
if gtype eq 'Track' then begin
    xmin=4.3; 3.634 ;
    xmax=3.0;3.625; 
    ymin=-1.5;.55 ;
    ymax=3.5;0.9 ;
endif
endif
if type eq '2.6-2.AT' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm260zhm200y264a18al00_nodiffA10cHb9','m260zhm200y264a18al00_nodiffA10cHb9b', $
              'm260zhm200y264a18al00_nodiff', 'm260zhm200y264a18al00_nodiffA10cHb9c', $
              'm260zhm200y264a18al00_nodiffA10cHb9d','m260zhm200y264a18al00_nodiffA10cHbTT', $
              'm260zhm200y264a18al00_nodiffA10cHbTTb', 'm260zhm200y264a18al00_nodiffA10cHb6'$   
            ]

    outfile= 'htoler26p4A9'
    outtext=''
    textperrun=[ '9', '9b', '2.6-2.0', '9c' , '9d', 'TT-3', 'TT-2', '6']
if gtype eq 'Track' then begin
    xmin=4.3;3.85;
    xmax=3.3;3.75;
    ymin=1.4;2.28;
    ymax=3.5;2.35;
endif
endif
if type eq '2.6+.4HPT' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm260zhp040y264a18al00_nodiff','m260zhp040y264a18al00_nodiff1', $
              'm260zhp040y264a18al00_nodiff2', 'm260zhp040y264a18al00_nodiff3', $
              'm260zhp040y264a18al00_nodiff7', 'm260zhp040y264a18al00_nodiff8',$
              'm260zhp040y264a18al00_nodiff9', 'm260zhp040y264a18al00_nodiff10',$
              'm260zhp040y264a18al00_nodiffH11', 'm260zhp040y264a18al00_nodiffH12'$
            ]

    outfile= 'htoler26p4HPT'
    outtext=''
    textperrun=['2.6+.4', '1', '2', '3', '7','8', '9','10', '11', '12'  ]
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.9
    ymin=1.2
    ymax=1.8
endif
endif
if type eq '2.6+.4A' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm260zhp040y264a18al00_nodiff','m260zhp040y264a18al00_nodiffA10', $
               'm260zhp040y264a18al00_nodiffA6', 'm260zhp040y264a18al00_nodiffA7', $
              'm260zhp040y264a18al00_nodiffA8', 'm260zhp040y264a18al00_nodiffA9',$
              'm260zhp040y264a18al00_nodiffA1', 'm260zhp040y264a18al00_nodiffA11',$
             'm260zhp040y264a18al00_nodiffA2', 'm260zhp040y264a18al00_nodiffA3', $
              'm260zhp040y264a18al00_nodiffA4', 'm260zhp040y264a18al00_nodiffA5'$

             ]

    outfile= 'htoler26p4A'
    outtext=''
    textperrun=['2.6+.4', '10', '6','7','8', '9','1', '11', '2', '3', '4','5' ]
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.5
    ymin=1.2
    ymax=3.5
endif
endif

if type eq 'Tcutoff' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ 'm070zhm140y264a18al02_nodiff', 'm070zhp040y264a18al02_nodiff', 'm170zhm140y264a18al02_nodiff',$ 
              'm170zhp020y264a18al02_nodiff']
    outfile= 'Tcutoff'
    outtext=''
    textperrun=[ '70-1.40', '70+.40', '170-1.40', '170+.20']
if gtype eq 'Track' then begin
    xmin=4.1
    xmax=3.40
    ymin=-1.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
     xmin=3000
     xmax=5500
     ymin=0
     ymax=3.5
endif

endif

if type eq 'prob1' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiff', $
              'm060zhm200y264a18al00_nodiff', $
              'm150zhm200y264a18al00_nodiff',$
              'm180zhp040y264a18al00_nodiff', $
              'm210zhm200y264a18al00_nodiff', $
              'm260zhp040y264a18al00_nodiff', $
              'm260zhm200y264a18al00_nodiff'$
            ]

    outfile= 'gridprob1'
    outtext=''
    textperrun=[ '.6+.4', '.6-2', '1.5-2.', '1.8+.4', '2.1-2', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.5
    ymin=-.5
    ymax=3.0
endif
endif

if type eq 'newcorneropalHT' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffopal', $
              'm060zhm200y264a18al00_nodiffopal', $
              'm260zhp040y264a18al00_nodiffopal',$
              'm260zhm200y264a18al00_nodiffopal',$
              'm060zhp040y264a18al00_nodiffopalHT', $
              'm060zhm200y264a18al00_nodiffopalHT', $
              'm260zhp040y264a18al00_nodiffopalHT',$
              'm260zhm200y264a18al00_nodiffopalHT'$
            ]

    outfile= 'newcorneropalHT'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.', '.6+.4HT', '.6-2.HT', '2.6+.4HT', '2.6-2.HT'   ]
if gtype eq 'Track' then begin
    xmin=4.3 ;3.75 ;
    xmax=3.0 ;3.55 ;
    ymin=-1.5 ;0.8 ;
    ymax=3.5;1.0 ;
endif
endif

if type eq 'newcorneropalguess' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffopalguess', $
              'm060zhm200y264a18al00_nodiffopalguess', $
              'm260zhp040y264a18al00_nodiffopalguess',$
              'm260zhm200y264a18al00_nodiffopalguess'$
            ]

    outfile= 'newcorneropalguess'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.'  ]
if gtype eq 'Track' then begin
    xmin=4.3 ;3.75 ;
    xmax=3.0 ;3.55 ;
    ymin=-1.5 ;0.8 ;
    ymax=3.5;1.0 ;
endif
endif
if type eq 'newcorneropalg2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffopalguess', $
              'm060zhm200y264a18al00_nodiffopalguess', $
              'm260zhp040y264a18al00_nodiffopalguess',$
              'm260zhm200y264a18al00_nodiffopalguess',$
              'm060zhp040y264a18al00_nodiffopalg2', $
              'm060zhm200y264a18al00_nodiffopalg2', $
              'm260zhp040y264a18al00_nodiffopalg2',$
              'm260zhm200y264a18al00_nodiffopalg2'$
            ]


    outfile= 'newcorneropalg2'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.', '.6+.4g2', '.6-2.g2', '2.6+.4g2', '2.6-2.g2'   ]
if gtype eq 'Track' then begin
    xmin=4.3 ;3.75 ;
    xmax=3.0 ;3.55 ;
    ymin=-1.5 ;0.8 ;
    ymax=3.5;1.0 ;
endif
endif
if type eq '0.6+.4env' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiffopalguess','m060zhp040y264a18al00_nodiffopalenv3', $
              'm060zhp040y264a18al00_nodiffopalenv4'$
            ]

    outfile= '06p4env'
    outtext=''
    textperrun=[ '1D-4', '5D-3', '5D-4'  ]
if gtype eq 'Track' then begin
    xmin=4.3; 3.634 ;
    xmax=3.0;3.625; 
    ymin=-1.5;.55 ;
    ymax=3.5;0.9 ;
endif
endif

if type eq 'z2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm150zhm200y264a18al00_nodiff', $
              'm160zhm200y264a18al00_nodiff', $
              'm170zhm200y264a18al00_nodiff',$
              'm180zhm200y264a18al00_nodiff', $
              'm190zhm200y264a18al00_nodiff', $
              'm200zhm200y264a18al00_nodiff', $
              'm210zhm200y264a18al00_nodiff', $
              'm220zhm200y264a18al00_nodiff', $
              'm230zhm200y264a18al00_nodiff', $
              'm240zhm200y264a18al00_nodiff', $
              'm250zhm200y264a18al00_nodiff', $
              'm260zhm200y264a18al00_nodiff' $
            ]

    outfile= 'z2'
    outtext=''
    textperrun=[ '1.5', '1.6', '1.7', '1.8', '1.9', '2.0', '2.1', '2.2', '2.3', '2.4', '2.5', '2.6'  ]
if gtype eq 'Track' then begin
    xmin=3.8 ;4.3
    xmax=3.66 ;3.5
    ymin=1.0
    ymax=3.5
endif
endif

if type eq 'z2713' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm150zhm200y264a18al00_nodif7', $
              'm160zhm200y264a18al00_nodif7', $
              'm170zhm200y264a18al00_nodif7',$
              'm180zhm200y264a18al00_nodif7', $
              'm190zhm200y264a18al00_nodif7', $
              'm200zhm200y264a18al00_nodif7', $
              'm210zhm200y264a18al00_nodif7', $
              'm220zhm200y264a18al00_nodif7', $
              'm230zhm200y264a18al00_nodif7', $
              'm240zhm200y264a18al00_nodif7', $
              'm250zhm200y264a18al00_nodif7', $
              'm260zhm200y264a18al00_nodif7' $
            ]

    outfile= 'z2_713'
    outtext=''
    textperrun=[ '1.5', '1.6', '1.7', '1.8', '1.9', '2.0', '2.1', '2.2', '2.3', '2.4', '2.5', '2.6'  ]
if gtype eq 'Track' then begin
    xmin=3.8 ;4.3
    xmax=3.66 ;3.5
    ymin=1.0
    ymax=3.5
endif
if gtype eq 'Deg' then begin
    xmin=.01
    xmax=2
    ymin=.01
    ymax=1000
endif
endif

if type eq 'crossingcrash' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm230zhm000y264a18al00_nodiff', $
              'm240zhm000y264a18al00_nodiff', $
              'm250zhm000y264a18al00_nodiff',$
              'm260zhm000y264a18al00_nodiff', $
              'm220zhm020y264a18al00_nodiff', $
              'm230zhm020y264a18al00_nodiff', $
              'm260zhm020y264a18al00_nodiff', $
              'm200zhm040y264a18al00_nodiff', $
              'm210zhm040y264a18al00_nodiff', $
              'm260zhm040y264a18al00_nodiff', $
              'm200zhm060y264a18al00_nodiff', $
              'm210zhm060y264a18al00_nodiff', $
              'm260zhm060y264a18al00_nodiff', $
              'm200zhm080y264a18al00_nodiff', $
              'm210zhm080y264a18al00_nodiff', $
              'm260zhm080y264a18al00_nodiff', $
              'm200zhm100y264a18al00_nodiff', $
              'm210zhm100y264a18al00_nodiff', $
              'm220zhm080y264a18al00_nodiff', $
              'm260zhm100y264a18al00_nodiff'$
            ]
    outfile= 'crossingcrash'
    outtext=''
    textperrun=[ '2.3-00', '2.4-00', '2.5-00','2.6-00', '2.2-02','2.3-02','2.6-02', $
                 '2.0-04','2.1-04','2.6-04','2.0-06','2.1-06','2.6-06','2.0-08', $
                 '2.1-08','2.6-08','2.0-10','2.1-10','2.2-08','2.6-10']
if gtype eq 'Track' then begin
    xmin=4.3 ;3.8 ;
    xmax=3.5 ;3.66 ;
    ymin=1.0
    ymax=3.5
endif
endif

if type eq 'z04' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
;              'm150zhp040y264a18al00_nodiff', $
              'm160zhp040y264a18al00_nodiff', $
;              'm170zhp040y264a18al00_nodiff',$
              'm180zhp040y264a18al00_nodiff', $
;              'm190zhp040y264a18al00_nodiff', $
              'm200zhp040y264a18al00_nodiff', $
;              'm210zhp040y264a18al00_nodiff', $
              'm220zhp040y264a18al00_nodiff', $
;              'm230zhp040y264a18al00_nodiff', $
              'm240zhp040y264a18al00_nodiff' $
;              'm250zhp040y264a18al00_nodiff' $
;              'm260zhp040y264a18al00_nodiff' $
            ]

    outfile= 'z04'
    outtext=''
    textperrun=[ '1.6',  '1.8',  '2.0','2.2',  '2.4'  ]
;    textperrun=[ '1.5', '1.6', '1.7', '1.8', '1.9', '2.0', '2.1', '2.2', '2.3', '2.4', '2.5', '2.6'  ]
if gtype eq 'Track' then begin
    xmin=3.7 ;4.0;
    xmax=3.56;3.66 ;
    ymin=1.5 ;0.5
    ymax=2.9 ;3.5
endif
endif
if type eq 'z04check' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm160zhp040y264a18al00_nodiff', $
              'm160zhp020y264a18al00_nodiff', $
              'm180zhp040y264a18al00_nodiff',$
              'm180zhp020y264a18al00_nodiff', $
              'm200zhp040y264a18al00_nodiff', $
              'm200zhp020y264a18al00_nodiff', $
              'm220zhp040y264a18al00_nodiff', $
              'm220zhp020y264a18al00_nodiff', $
              'm240zhp040y264a18al00_nodiff', $
              'm240zhp020y264a18al00_nodiff' $
;              'm260zhp040y264a18al00_nodiff' $
            ]

    outfile= 'z04check'
    outtext=''
    textperrun=[ '1.6',  '1.6+02','1.8', '1.8+02', '2.0','2.0+02','2.2', '2.2+02', '2.4' ,'2.4+02']
;    textperrun=[ '1.5', '1.6', '1.7', '1.8', '1.9', '2.0', '2.1', '2.2', '2.3', '2.4', '2.5', '2.6'  ]
if gtype eq 'Track' then begin
    xmin=3.8 ;
    xmax=3.5 ;3.66 ;
    ymin=1.0
    ymax=3.5
endif
endif

if type eq '1.9+.4' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm190zhp040y264a18al00_nodiffA1','m190zhp040y264a18al00_nodiffA2', $
              'm190zhp040y264a18al00_nodiffA9','m190zhp040y264a18al00_nodiffA3'$
            ]

    outfile= '19p4env'
    outtext=''
    textperrun=[ 'A1', 'A2','A9','A3'  ]
if gtype eq 'Track' then begin
    xmin= 3.9 ;4.3;
    xmax= 3.5;3.7;
    ymin=0.6 ;-1.5;
    ymax=1.5 ;3.5;
endif
endif
if type eq '2.4-.4' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              
              'm240zhm040y264a18al00_nodiff'$
            ]
    outfile= '2.4-.4'
    outtext=''
    textperrun=['2.4-.4']
if gtype eq 'Track' then begin
    xmin=4.3 ;3.8 ;
    xmax=3.5 ;3.66 ;
    ymin=1.0
    ymax=3.5
endif
endif
if type eq '2.6p.4' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              
              'm260zhp040y264a18al00_nodiff'$
            ]
    outfile= '26p04'
    outtext=''
    textperrun=['2.6+.4']
if gtype eq 'Track' then begin
    xmin=4.3 ;3.8 ;
    xmax=3.5 ;3.66 ;
    ymin=1.0
    ymax=3.5
endif
endif
if type eq 'env' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/testparams/'
    infiles=[ $
              'm260zhp040y264a18al00_nodiffTT2','m260zhp040y264a18al00_nodiffTL1b', $
              'm260zhp040y264a18al00_nodiffTL1','m260zhp040y264a18al00_nodiffTL2', $
              'm260zhp040y264a18al00_nodiffTT3','m260zhp040y264a18al00_nodiffTL3'$
            ]

    outfile= '26p4env'
    outtext=''
    textperrun=[ 'TT2', 'TL1b', 'TL1', 'TL2', 'TT3','TL3'  ]
if gtype eq 'Track' then begin
    xmin= 3.65;3.9 ;
    xmax= 3.63;3.5;
    ymin=1.95 ;-1.5;
    ymax=2.25;1.5 ;
endif
endif

if type eq '2.4+.4p2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm240zhp040y264a18al00_nodiff','m240zhp040y264a18al00_nodiffp2', $
              'm250zhp040y264a18al00_nodiff', 'm230zhp040y264a18al00_nodiff' $
             ]

    outfile= '24p04'
    outtext=''
    textperrun=['2.4+.4','p2-441', '250+.4-713' ,'230+.4-713']
if gtype eq 'Track' then begin
    xmin=3.7
    xmax=3.58
    ymin=1.2
    ymax=3.0
endif
endif

if type eq '2.4p2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm240zhp040y264a18al00_nodiff','m240zhm080y264a18al00_nodiff', $
              'm240zhm200y264a18al00_nodiff','m240zhm080y264a18al00_nodiff1b', $
              'm240zhm200y264a18al00_nodiff1b', 'm240zhm080y264a18al00_nodiff1c', $
              'm240zhm200y264a18al00_nodiff1c', 'm240zhp040y264a18al00_nodiff2_441',$
              'm240zhp040y264a18al00_nodiff2_713', 'm240zhm080y264a18al00_nodiff1d', $
              'm240zhm200y264a18al00_nodiff1d', 'm240zhm200y264a18al00_nodiff2_441',$
              'm240zhm200y264a18al00_nodiff2_713', 'm240zhm080y264a18al00_nodiff2_441',$
              'm240zhm080y264a18al00_nodiff2_713'$
             ]

    outfile= '24p2s'
    outtext=''
    textperrun=['2.4+.4','2.4-.8', '2.4-2.', '1b', '1b' , '1c', '1c', '441', '713' , '1d', '1d', '-2,441', '-2,713', '-.8,441', '-.8,713']
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.56
    ymin=0.5
    ymax=2.9
endif
endif
if type eq '2.4p2b' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm240zhm200y264a18al00_nodiff1d',$
              'm240zhp040y264a18al00_nodiff2_713', $
              'm240zhm200y264a18al00_nodiff2_713', $
              'm240zhm080y264a18al00_nodiff2_713'$
             ]

    outfile= '24p2b'
    outtext=''
    textperrun=[ ' ','+.4,713',  '-2,713', '-.8,713']
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.56
    ymin=0.5
    ymax=2.9
endif
if gtype eq 'Deg' then begin
    xmin=.315
    xmax=.33
    ymin=.1
    ymax=30.0
endif
endif

if type eq '2.4m2p2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/'
    infiles=[ $
              'nodiff_out/m240zhm200y264a18al00_nodiff1d',$
              'nodiff_out/m240zhm200y264a18al00_nodiff2_441', $
              'nodiff_out/m240zhm200y264a18al00_nodiff2_713', $
              'testparams/m240zhm200y264a18al00_nodiffnumb2_441',$
              'testparams/m240zhm200y264a18al00_nodiff2_713_TL2',$
              'testparams/m240zhm200y264a18al00_nodiffnumb2_713'$

             ]

    outfile= '24m2p2b'
    outtext=''
    textperrun=[ '1d', '2_441', '2_713', 'b-441', 'TL2', '1db','b-713']
if gtype eq 'Track' then begin
    xmin=4.3 ;3.749
    xmax=3.5 ;3.745
    ymin=1.9 ;2.222
    ymax=2.5 ;2.230
endif
endif

if type eq '441vs713' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              
              'm150zhp020y264a18al00_nodiff','m150zhp020y264a18al00_nodif7', $
              'm200zhp020y264a18al00_nodiff','m200zhp020y264a18al00_nodif7', $
              'm250zhp020y264a18al00_nodiff','m250zhp020y264a18al00_nodif7' $
            ]
    outfile= '441vs713'
    outtext=''
    textperrun=['15,441', '15,713','20,441', '20,713','25,441', '25,713']
if gtype eq 'Track' then begin
    xmin=4.3 ;3.8 ;
    xmax=3.5 ;3.66 ;
    ymin=1.0
    ymax=3.5
endif
endif

if type eq 'z04_713vs441' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out/'
    infiles=[ $
              'm150zhp040y264a18al00_nodiff', $
              'm150zhp040y264a18al00_nodif7', $
              'm170zhp040y264a18al00_nodiff',$
              'm170zhp040y264a18al00_nodif7', $
              'm190zhp040y264a18al00_nodiff', $
              'm190zhp040y264a18al00_nodif7', $
              'm210zhp040y264a18al00_nodiff', $
              'm210zhp040y264a18al00_nodif7', $
              'm230zhp040y264a18al00_nodiff', $
              'm230zhp040y264a18al00_nodif7', $
              'm250zhp040y264a18al00_nodiff', $
              'm250zhp040y264a18al00_nodif7' $
            ]

    outfile= 'z04'
    outtext=''
    textperrun=[ '1.5', '1.57', '1.7', '1.77', '1.9', '1.97', '2.1', '2.17', '2.3', '2.37', '2.5', '2.57'  ]
if gtype eq 'Track' then begin
    xmin=3.9 ;4.3
    xmax=3.5
    ymin=0.0
    ymax=3.5
endif
endif

if type eq '2Mb' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm180zhm000y264a18al00_nodiff','m220zhm000y264a18al00_nodiff', $           
              'm190zhm000y264a18al00_nodiff','m200zhm000y264a18al00_nodiff', $
              'm170zhm000y264a18al00_nodiff','m160zhm000y264a18al00_nodiff', $
              'm150zhm000y264a18al00_nodiff','m140zhm000y264a18al00_nodiff', $
              'm130zhm000y264a18al00_nodiff','m120zhm000y264a18al00_nodiff', $
              'm110zhm000y264a18al00_nodiff','m100zhm000y264a18al00_nodiff', $
              'm210zhm000y264a18al00_nodiff'$
            ]
    outfile= '2Mb'
    outtext=''
    textperrun=['180','220', '190','200', '170','160','150','140','130','120','110','100', '210']
if gtype eq 'Track' then begin
    xmin=3.9 ;
    xmax=3.5 ;3.66 ;
    ymin=0.0
    ymax=4.0
endif
endif

if type eq 'a13m20int' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm190zhm200y264a13al00_nodiff','m200zhm200y264a13al00_nodiff', $           
              'm210zhm200y264a13al00_nodiff','m220zhm200y264a13al00_nodiff', $
              'm180zhm200y264a13al00_nodiff'$
            ]
    outfile= 'a13m20int'
    outtext=''
    textperrun=['190','200', '210','220', '180']
if gtype eq 'Track' then begin
    xmin=4.4 ;
    xmax=3.5 ;3.66 ;
    ymin=0.0
    ymax=3.5
endif
endif

if type eq 'a18m20big' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm220zhm200y264a18al00_nodiff','m230zhm200y264a18al00_nodiff', $           
              'm240zhm200y264a18al00_nodiff','m250zhm200y264a18al00_nodiff', $
              'm260zhm200y264a18al00_nodiff'$
            ]
    outfile= 'a18m20big'
    outtext=''
    textperrun=['220','230', '240','250', '260']
if gtype eq 'Track' then begin
    xmin=4.4 ;
    xmax=3.5 ;3.66 ;
    ymin=0.0
    ymax=3.5
endif
endif

if type eq 'm090m020grid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm090zhm020y249a13al00_nodiff','m090zhm020y264a13al00_nodiff', $           
              'm090zhm020y279a13al00_nodiff','m090zhm020y249a18al00_nodiff', $
              'm090zhm020y264a18al00_nodiff','m090zhm020y279a18al00_nodiff', $           
              'm090zhm020y249a23al00_nodiff','m090zhm020y264a23al00_nodiff', $
              'm090zhm020y279a23al00_nodiff','m090zhm000y249a18al00_nodiff', $
              'm090zhm000y264a18al00_nodiff','m090zhm000y279a18al00_nodiff'$
            ]
    outfile= 'm090m020grid'
    outtext=''
    textperrun=['y249a13','y264a13', 'y279a13','y249a18','y264a18', 'y279a18','y249a23','y264a23', 'y279a23','z0y249a18','z0y264a18', 'z0y279a18']
if gtype eq 'Track' then begin
    xmin=3.86 ;
    xmax=3.5 ;3.66 ;
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=5300
    xmax=6000;3.66 ;
    ymin= 4.2;
    ymax=4.7 
endif
endif

if type eq 'm090m080grid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm090zhm080y249a13al00_nodiff','m090zhm080y264a13al00_nodiff', $           
              'm090zhm080y279a13al00_nodiff','m090zhm080y249a18al00_nodiff', $
              'm090zhm080y264a18al00_nodiff','m090zhm080y279a18al00_nodiff', $           
              'm090zhm080y249a23al00_nodiff','m090zhm080y264a23al00_nodiff', $
              'm090zhm080y279a23al00_nodiff','m090zhm080y264a18al04_nodiff',$
              'm090zhm080y264a13al04_nodiff', 'm090zhm080y264a23al04_nodiff'$
            ]
    outfile= 'm090m080gridb'
    outtext=''
    textperrun=['y249a13','y264a13', 'y279a13','y249a18','y264a18', 'y279a18','y249a23','y264a23', 'y279a23','al04y264a18','al04y264a13','al04y264a23']
if gtype eq 'Track' then begin
    xmin=3.845 ;
    xmax=3.544 ;3.66 ;
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=7000
    xmax=3500;3.66 ;
    ymin=5.0;
    ymax=0.0 
endif
endif
if type eq 'm090m080comp' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm090zhm080y249a18al00_nodiff', $
              'm090zhm080y264a18al00_nodiff','m090zhm080y279a18al00_nodiff',$
              'm090zhm080y264a18al04_nodiff','m090zhm080y249a18al04_nodiff',$
              'm090zhm080y279a18al04_nodiff'$
              
            ]
    outfile= 'm090m080compostion'
    outtext=''
    textperrun=['y249','y264', 'y279','al04y264','al04y249','al04y279']
if gtype eq 'Track' then begin
    xmin=3.845 ;
    xmax=3.544 ;3.66 ;
    ymin=-0.5
    ymax=3.5
endif
endif
if type eq 'm090m080grid1' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm090zhm080y249a18al00_nodiff', $
              'm090zhm080y264a18al00_nodiff','m090zhm080y279a18al00_nodiff'$
            ]
    outfile= 'm090m080grid1'
    outtext=''
    textperrun=['y249a18','y264a18', 'y279a18']
if gtype eq 'Track' then begin
    xmin=3.845 ;
    xmax=3.544 ;3.66 ;
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=7000
    xmax=3500;3.66 ;
    ymin=5.0;
    ymax=0.0 
endif
endif

if type eq 'm090m080grid2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm090zhm080y249a13al00_nodiff','m090zhm080y264a13al00_nodiff', $           
              'm090zhm080y279a13al00_nodiff','m090zhm080y249a18al00_nodiff', $
              'm090zhm080y264a18al00_nodiff','m090zhm080y279a18al00_nodiff', $           
              'm090zhm080y249a23al00_nodiff','m090zhm080y264a23al00_nodiff', $
              'm090zhm080y279a23al00_nodiff'$
            ]
    outfile= 'm090m080grid2'
    outtext=''
    textperrun=['y249a13','y264a13', 'y279a13','y249a18','y264a18', 'y279a18','y249a23','y264a23', 'y279a23']
if gtype eq 'Track' then begin
    xmin=3.845 ;
    xmax=3.544 ;3.66 ;
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=7000
    xmax=3500;3.66 ;
    ymin=5.0;
    ymax=0.0 
endif
endif

if type eq 'm080m080grid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm080zhm080y249a13al00_nodiff','m080zhm080y264a13al00_nodiff', $           
              'm080zhm080y279a13al00_nodiff','m080zhm080y249a18al00_nodiff', $
              'm080zhm080y264a18al00_nodiff','m080zhm080y279a18al00_nodiff', $           
              'm080zhm080y249a23al00_nodiff','m080zhm080y264a23al00_nodiff', $
              'm080zhm080y279a23al00_nodiff','m080zhm080y264a18al04_nodiff'$
            ]
    outfile= 'm080m080grid'
    outtext=''
    textperrun=['y249a13','y264a13', 'y279a13','y249a18','y264a18', 'y279a18','y249a23','y264a23', 'y279a23','al04y264a18']
if gtype eq 'Track' then begin
    xmin=3.845 ;
    xmax=3.544 ;3.66 ;
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=7000
    xmax=3500;3.66 ;
    ymin=5.0;
    ymax=0.0 
endif
endif
if type eq '2Mal04' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm180zhm000y264a18al04_nodiff','m220zhm000y264a18al04_nodiff', $           
              'm190zhm000y264a18al04_nodiff','m200zhm000y264a18al04_nodiff', $
              'm210zhm000y264a18al04_nodiff', $
              'm230zhm000y264a18al04_nodiff','m240zhm000y264a18al04_nodiff', $           
              'm250zhm000y264a18al04_nodiff','m260zhm000y264a18al04_nodiff', $
              'm180zhm000y264a18al00_nodiff','m220zhm000y264a18al00_nodiff', $           
              'm190zhm000y264a18al00_nodiff','m200zhm000y264a18al00_nodiff', $
              'm210zhm000y264a18al00_nodiff', $
              'm230zhm000y264a18al00_nodiff','m240zhm000y264a18al00_nodiff', $           
              'm250zhm000y264a18al00_nodiff','m260zhm000y264a18al00_nodiff' $
            ]
    outfile= '2Mal04'
    outtext=''
    textperrun=['180','220', '190','200', '210', '230', '240', '250', '260', '180_','220_', '190_','200_', '210_', '230_', '240_', '250_', '260_']
if gtype eq 'Track' then begin
    xmin=3.7 ;
    xmax=3.5 ;3.66 ;
    ymin=0.9
    ymax=3.5
endif
endif

if type eq 'm090m080gridalpha' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm090zhm080y249a13al00_nodiff','m090zhm080y249a13al04_nodiff', $           
              'm090zhm080y279a13al00_nodiff','m090zhm080y279a18al04_nodiff', $
              'm090zhm080y249a18al00_nodiff','m090zhm080y249a18al04_nodiff', $ 
              'm090zhm080y279a18al00_nodiff','m090zhm080y279a18al04_nodiff', $           
              'm090zhm080y249a23al00_nodiff','m090zhm080y249a23al04_nodiff', $
              'm090zhm080y279a23al00_nodiff','m090zhm080y279a23al04_nodiff', 'm090zhm080y279a23al04_nodiff'$
            ]
    outfile= 'm090m080gridalpha'
    outtext=''
    textperrun=['y249a13a00','y249a13a04','y279a13a00','y279a13a04','y249a18a00',$
                'y249a18a04','y279a18a00','y279a18a04','y249a23a00','y249a23a04','y279a23a00','y279a23a04', 'y279a23a04']
if gtype eq 'Track' then begin
    xmin=3.74 ;3.845 ;
    xmax=3.544 ;3.66 ;
    ymin=0.5 ;-0.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=7000
    xmax=3500;3.66 ;
    ymin=5.0;
    ymax=0.0 
endif
endif
if type eq 'findmassm02' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm070zhm020y264a18al00_nodiff','m080zhm020y264a18al00_nodiff', $           
              'm090zhm020y264a18al00_nodiff','m100zhm020y264a18al00_nodiff', $
              'm110zhm020y264a18al00_nodiff','m120zhm020y264a18al00_nodiff', $ 
              'm130zhm020y264a18al00_nodiff','m140zhm020y264a18al00_nodiff', $           
              'm150zhm020y264a18al00_nodiff','m160zhm020y264a18al00_nodiff', $
              'm180zhm020y264a18al00_nodiff','m190zhm020y264a18al00_nodiff'$
            ]
    outfile= 'findmassgridm02'
    outtext=''
    textperrun=['.7', '.8', '.9', '1.0', '1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7', '1.8', '1.9']
if gtype eq 'Track' then begin
    xmin=3.74 ;3.845 ;
    xmax=3.544 ;3.66 ;
    ymin=0.5 ;-0.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=6200
    xmax=5500;3.66 ;
    ymin=4.5;
    ymax=3.8 
endif
endif
if type eq 'newcornerML' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm060zhp040y264a13al00_nodiff', $
              'm060zhm200y264a13al00_nodiff', $
              'm260zhp040y264a13al00_nodiff',$
              'm260zhm200y264a13al00_nodiff',$
              'm060zhp040y264a23al00_nodiff', $
              'm060zhm200y264a23al00_nodiff', $
              'm260zhp040y264a23al00_nodiff',$
              'm260zhm200y264a23al00_nodiff',$
              'm060zhp040y264a18al00_nodiff', $
              'm060zhm200y264a18al00_nodiff', $
              'm260zhp040y264a18al00_nodiff',$
              'm260zhm200y264a18al00_nodiff'$
            ]

    outfile= 'newcornerML'
    outtext=''
    textperrun=[ '.6+.4_13', '.6-2._13', '2.6+.4_13', '2.6-2._13','.6+.4_23', $
                '.6-2._23', '2.6+.4_23', '2.6-2._23','.6+.4_18', '.6-2._18', '2.6+.4_18', '2.6-2._18'  ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif

if type eq 'greyatm' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm100zhm000y264a18al00_nodiff', $
              'm100zhm000y279a18al00_nodiff', $
              'm100zhm000y264a23al00_nodiff', $
 	      'm100zhm000y264a18al00_grnodf' $

            ]

    outfile= 'greyatm'
    outtext=''
    textperrun=[ 'kurucz', 'y279','a23','grey'  ]
if gtype eq 'Track' then begin
    xmin=3.8
    xmax=3.45
    ymin=-0.5
    ymax=3.5
endif
endif

if type eq 'greyatmzsol' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm060zhm000y264a18al00_nodiff', $
 	      'm060zhm000y265a17al00_grnodf', $
 	      'm060zhm000y265a17al00_cknodf', $
              'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_grnodf', $

 	      'm100zhm000y265a17al00_cknodf', $
              'm140zhm000y264a18al00_nodiff', $
 	      'm140zhm000y265a17al00_grnodf', $
 	      'm140zhm000y265a17al00_cknodf', $
              'm180zhm000y264a18al00_nodiff', $
 	      'm180zhm000y265a17al00_grnodf', $
 	      'm180zhm000y265a17al00_cknodf', $
              'm220zhm000y264a18al00_nodiff', $
 	      'm220zhm000y265a17al00_grnodf', $
 	      'm220zhm000y265a17al00_cknodf', $
              'm260zhm000y264a18al00_nodiff', $
 	      'm260zhm000y265a17al00_grnodf', $
 	      'm260zhm000y265a17al00_cknodf' $



            ]

    outfile= 'greyatmzsol'
    outtext=''
    textperrun=[ 'm060k', 'm060g', 'm060c','m100k', 'm100g', 'm100c','m140k', 'm140g','m140c','m180k', 'm180g','m180c','m220k', 'm220g','m220c','m260k', 'm260g', 'm260c' ]
if gtype eq 'Track' then begin
    xmin=3.72
    xmax=3.5
    ymin=-0.0
    ymax=3.5
endif
endif
if type eq 'greyatmmsol' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm100zhp040y264a18al00_nodiff', $
 	      'm100zhp040y265a17al00_grnodf', $
 	      'm100zhp040y265a17al00_cknodf', $
              'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm100zhm000y265a17al00_cknodf', $
              'm100zhm040y264a18al00_nodiff', $
 	      'm100zhm040y265a17al00_grnodf', $
 	      'm100zhm040y265a17al00_cknodf', $
              'm100zhm080y264a18al00_nodiff', $
 	      'm100zhm080y265a17al00_grnodf', $
 	      'm100zhm080y265a17al00_cknodf', $
              'm100zhm120y264a18al00_nodiff', $
 	      'm100zhm120y265a17al00_grnodf', $
 	      'm100zhm120y265a17al00_cknodf', $
              'm100zhm160y264a18al00_nodiff', $
 	      'm100zhm160y265a17al00_grnodf', $
 	      'm100zhm160y265a17al00_cknodf', $
              'm100zhm200y264a18al00_nodiff', $
 	      'm100zhm200y265a17al00_grnodf', $
 	      'm100zhm200y265a17al00_cknodf' $
            ]

    outfile= 'greyatmmsolb'
    outtext=''
    textperrun=[ 'p040k', '', '','m000k', '','','m040k', '','','m080k', '','','m120k', '','','m160k', '','','m200k', '', '' ]
if gtype eq 'Track' then begin
    xmin=3.75
    xmax=3.5
    ymin=-0.0
    ymax=3.5
endif
endif

if type eq 'greyatmm06' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiff', $
 	      'm060zhp040y265a17al00_grnodf', $
 	      'm060zhp040y265a17al00_cknodf', $
              'm060zhm000y264a18al00_nodiff', $
 	      'm060zhm000y265a17al00_grnodf', $
 	      'm060zhm000y265a17al00_cknodf', $
              'm060zhm040y264a18al00_nodiff', $
 	      'm060zhm040y265a17al00_grnodf', $
 	      'm060zhm040y265a17al00_cknodf', $
              'm060zhm080y264a18al00_nodiff', $
 	      'm060zhm080y265a17al00_grnodf', $
 	      'm060zhm080y265a17al00_cknodf', $
              'm060zhm120y264a18al00_nodiff', $
 	      'm060zhm120y265a17al00_grnodf', $
 	      'm060zhm120y265a17al00_cknodf', $
              'm060zhm160y264a18al00_nodiff', $
 	      'm060zhm160y265a17al00_grnodf', $
 	      'm060zhm160y265a17al00_cknodf', $
              'm060zhm200y264a18al00_nodiff', $
 	      'm060zhm200y265a17al00_grnodf', $
 	      'm060zhm200y265a17al00_cknodf' $
            ]

    outfile= 'greyatmm06'
    outtext=''
    textperrun=[ 'p040k', '', '','m000k', '','','m040k', '','','m080k', '','','m120k', '','','m160k', '','','m200k', '', '' ]
if gtype eq 'Track' then begin
    xmin=3.75
    xmax=3.5
    ymin=-0.0
    ymax=3.5
endif
endif

if type eq 'greyatmm18' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm180zhp040y264a18al00_nodiff', $
 	      'm180zhp040y265a17al00_grnodf', $
 	      'm180zhp040y265a17al00_cknodf', $
              'm180zhm000y264a18al00_nodiff', $
 	      'm180zhm000y265a17al00_grnodf', $
 	      'm180zhm000y265a17al00_cknodf', $
              'm180zhm040y264a18al00_nodiff', $
 	      'm180zhm040y265a17al00_grnodf', $
 	      'm180zhm040y265a17al00_cknodf', $
              'm180zhm080y264a18al00_nodiff', $
 	      'm180zhm080y265a17al00_grnodf', $
 	      'm180zhm080y265a17al00_cknodf', $
              'm180zhm120y264a18al00_nodiff', $
 	      'm180zhm120y265a17al00_grnodf', $
 	      'm180zhm120y265a17al00_cknodf', $
              'm180zhm160y264a18al00_nodiff', $
 	      'm180zhm160y265a17al00_grnodf', $
 	      'm180zhm160y265a17al00_cknodf', $
              'm180zhm200y264a18al00_nodiff', $
 	      'm180zhm200y265a17al00_grnodf', $
 	      'm180zhm200y265a17al00_cknodf' $
            ]

    outfile= 'greyatmm18'
    outtext=''
    textperrun=[ 'p040k', '', '','m000k', '','','m040k', '','','m080k', '','','m120k', '','','m160k', '','','m200k', '', '' ]
if gtype eq 'Track' then begin
    xmin=3.75
    xmax=3.5
    ymin=-0.0
    ymax=3.5
endif
endif


if type eq 'greyatmm26' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm260zhp040y264a18al00_nodiff', $
 	      'm260zhp040y265a17al00_grnodf', $
 	      'm260zhp040y265a17al00_cknodf', $
              'm260zhm000y264a18al00_nodiff', $
 	      'm260zhm000y265a17al00_grnodf', $
 	      'm260zhm000y265a17al00_cknodf', $
              'm260zhm040y264a18al00_nodiff', $
 	      'm260zhm040y265a17al00_grnodf', $
 	      'm260zhm040y265a17al00_cknodf', $
              'm260zhm080y264a18al00_nodiff', $
 	      'm260zhm080y265a17al00_grnodf', $
 	      'm260zhm080y265a17al00_cknodf', $
              'm260zhm120y264a18al00_nodiff', $
 	      'm260zhm120y265a17al00_grnodf', $
 	      'm260zhm120y265a17al00_cknodf', $
              'm260zhm160y264a18al00_nodiff', $
 	      'm260zhm160y265a17al00_grnodf', $
 	      'm260zhm160y265a17al00_cknodf', $
              'm260zhm200y264a18al00_nodiff', $
 	      'm260zhm200y265a17al00_grnodf', $
 	      'm260zhm200y265a17al00_cknodf' $
            ]

    outfile= 'greyatmm26'
    outtext=''
    textperrun=[ 'p040k', '', '','m000k', '','','m040k', '','','m080k', '','','m120k', '','','m160k', '','','m200k', '', '' ]
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.55
    ymin=1.4
    ymax=3.5
endif
endif



if type eq 'greyatmcorners' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiff', $
 	      'm060zhp040y265a17al00_grnodf', $
 	      'm060zhp040y265a17al00_cknodf', $
              'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm100zhm000y265a17al00_cknodf', $
              'm260zhp040y264a18al00_nodiff', $
 	      'm260zhp040y265a17al00_grnodf', $
 	      'm260zhp040y265a17al00_cknodf', $
              'm060zhm200y264a18al00_nodiff', $
 	      'm060zhm200y265a17al00_grnodf',$
 	      'm060zhm200y265a17al00_cknodf',$
              'm260zhm200y264a18al00_nodiff', $
 	      'm260zhm200y265a17al00_grnodf', $
 	      'm260zhm200y265a17al00_cknodf' $
            ]

    outfile= 'greyatmcorners'
    outtext=''
    textperrun=[ '06p040k', '06p040g', '06p040c','1m000k', '1m000g','1m000c', '26p040k', $
                 '26p040g', '26p040c','06m200k', '06m200g','06m200c','26m200k', '26m200g','26m200c' ]
if gtype eq 'Track' then begin
    xmin=3.85
    xmax=3.5
    ymin=-1.0
    ymax=3.5
endif
endif

if type eq 'solarmolly' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm200y264a18al00_nodiff' $
            ]

    outfile= 'solarmolly'
    outtext=''
    textperrun=[ 'm100zhm000', 'm100zhm200' ]
if gtype eq 'Tracklin' then begin
    xmin=8000
    xmax=2000
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'TrackConv' then begin
    xmin=8000
    xmax=2000
    ymin=-0.5
    ymax=3.5
endif
endif

if type eq 'mrange' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm060zhm000y264a18al00_nodiff', $
 	      'm120zhm000y264a18al00_nodiff', $
              'm260zhm000y264a18al00_nodiff' $
            ]

    outfile= 'mrange'
    outtext=''
    textperrun=[ 'm100zhm000', 'm100zhm200' , '']
if gtype eq 'Tracklin' then begin
    xmin=8000
    xmax=2000
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'TrackConv' then begin
    xmin=15000
    xmax=2000
    ymin=-1.5
    ymax=3.5
endif
endif


if type eq 'z04nodiff2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm060zhp040y264a18al00_nodiff', $
              'm070zhp040y264a18al00_nodiff', $
              'm080zhp040y264a18al00_nodiff', $
              'm100zhp040y264a18al00_nodiff',$
              'm120zhp040y264a18al00_nodiff', $
              'm140zhp040y264a18al00_nodiff', $
              'm160zhp040y264a18al00_nodiff', $
              'm180zhp040y264a18al00_nodiff', $
              'm200zhp040y264a18al00_nodiff', $
              'm220zhp040y264a18al00_nodiff', $
              'm240zhp040y264a18al00_nodiff', $
              'm250zhp040y264a18al00_nodiff', $
              'm260zhp040y264a18al00_nodiff', $
              'm060zhp040y265a17al00_grnodf', $
              'm100zhp040y265a17al00_grnodf',$
              'm140zhp040y265a17al00_grnodf', $
              'm180zhp040y265a17al00_grnodf', $
              'm220zhp040y265a17al00_grnodf', $
              'm260zhp040y265a17al00_grnodf' $
            ]

    outfile= 'z04nodiff2'
    outtext=''
    textperrun=[ '0.6', '0.7', '0.8', '1.0', '1.2', '1.4', '1.6', '1.8', '2.0', '2.2','2.4', '2.5', '2.6' ,$
                 '0.6g',   '1.0g',  '1.4g',  '1.8g',  '2.2g', '2.6g' ]
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.4;
    ymin=-1.5 ;0.5
    ymax=3.5 ;3.5
endif
endif

if type eq 'm00nodiff2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm060zhm000y264a18al00_nodiff', $
              'm070zhm000y264a18al00_nodiff', $
              'm080zhm000y264a18al00_nodiff', $
              'm090zhm000y264a18al00_nodiff', $
              'm100zhm000y264a18al00_nodiff',$
              'm110zhm000y264a18al00_nodiff',$
              'm120zhm000y264a18al00_nodiff', $
              'm130zhm000y264a18al00_nodiff', $
              'm140zhm000y264a18al00_nodiff', $
              'm150zhm000y264a18al00_nodiff', $
              'm160zhm000y264a18al00_nodiff', $
              'm170zhm000y264a18al00_nodiff', $
              'm180zhm000y264a18al00_nodiff', $
              'm190zhm000y264a18al00_nodiff', $
              'm200zhm000y264a18al00_nodiff', $
              'm210zhm000y264a18al00_nodiff', $
              'm220zhm000y264a18al00_nodiff', $
              'm230zhm000y264a18al00_nodiff', $
              'm240zhm000y264a18al00_nodiff', $
              'm250zhm000y264a18al00_nodiff', $
              'm260zhm000y264a18al00_nodiff'$
            ]

    outfile= 'm00nodiff2'
    outtext=''
    textperrun=[ '0.6', '0.7', '0.8','0.9', '1.0','1.1', '1.2', '1.3', $
               '1.4','1.5', '1.6','1.7', '1.8','1.9', '2.0','2.1', '2.2','2.3','2.4', '2.5', '2.6'  ]
if gtype eq 'Track' then begin
    xmin=4.0
    xmax=3.4;
    ymin=-1.5 ;0.5
    ymax=3.5 ;3.5
endif
if gtype eq 'Tracklin' then begin
    xmin=7000 ;
    xmax=3000;
    ymin=-1.5
    ymax=3.5
endif
endif

if type eq 'm100mlfehgrid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm100zhm080y264a13al00_nodiff','m100zhm080y264a18al00_nodiff', $           
              'm100zhm080y264a23al00_nodiff','m100zhm040y264a13al00_nodiff', $
              'm100zhm040y264a18al00_nodiff','m100zhm040y264a23al00_nodiff', $           
              'm100zhm000y264a13al00_nodiff','m100zhm000y264a18al00_nodiff', $
              'm100zhm000y264a23al00_nodiff'$
            ]
    outfile= 'm100mlfehgrid'
    outtext=''
    textperrun=['m8a13', 'm8a18', 'm8a23', 'm4a13', 'm4a18', 'm4a23', 'm0a13', 'm0a18', 'm0a23']
if gtype eq 'Track' then begin
    xmin=3.845 ;
    xmax=3.544 ;3.66 ;
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=7000
    xmax=3500;3.66 ;
    ymin=5.0;
    ymax=0.0 
endif
if gtype eq 'Tracklin' then begin
    xmin=7000 ;
    xmax=3000;
    ymin=-0.5
    ymax=3.5
endif
endif

if type eq 'm100mlsmallfehgrid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
              'm100zhm020y264a13al00_nodiff','m100zhm020y264a18al00_nodiff', $           
              'm100zhm020y264a23al00_nodiff','m100zhm040y264a13al00_nodiff', $
              'm100zhm040y264a18al00_nodiff','m100zhm040y264a23al00_nodiff', $           
              'm100zhm000y264a13al00_nodiff','m100zhm000y264a18al00_nodiff', $
              'm100zhm000y264a23al00_nodiff'$
            ]
    outfile= 'm100mlsmallfehgrid'
    outtext=''
    textperrun=['m2a13', 'm2a18', 'm2a23', 'm4a13', 'm4a18', 'm4a23', 'm0a13', 'm0a18', 'm0a23']
if gtype eq 'Track' then begin
    xmin=3.845 ;
    xmax=3.544 ;3.66 ;
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'Tracklin' then begin
    xmin=7000 ;
    xmax=3000;
    ymin=-0.5
    ymax=3.5
endif
if gtype eq 'TeffLogg' then begin
    xmin=7000
    xmax=3500;3.66 ;
    ymin=5.0;
    ymax=0.0 
endif
endif

if type eq 'JtJvscorners' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y264a18al00_nodifv', $
              'm060zhp040y264a18al00_nodiff', $
 	      'm060zhp040y264a18al00_nodifv', $
              'm260zhp040y264a18al00_nodiff', $
 	      'm260zhp040y264a18al00_nodifv', $
              'm060zhm200y264a18al00_nodiff', $
 	      'm060zhm200y264a18al00_nodifv',$
              'm260zhm200y264a18al00_nodiff', $
 	      'm260zhm200y264a18al00_nodifv' $
            ]

    outfile= 'JtJvscorners'
    outtext=''
    textperrun=[  '1m000T','1m000v','06p040T', '06p040v', $
                 '26p040T', '26p040v', '06m200T','06m200v', '26m200T','26m200v' ]
if gtype eq 'Track' then begin
    xmin=3.660 ;3.85
    xmax=3.640 ;3.5
    ymin=1.26;-1.0
    ymax=1.8;3.5
endif
endif


if type eq 'Hediffs' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm100zhm000y249a18al00_nodiff', $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y279a18al00_nodiff', $
              'm060zhp040y249a18al00_nodiff', $
 	      'm060zhp040y264a18al00_nodiff', $
              'm060zhp040y279a18al00_nodiff', $
              'm260zhp040y249a18al00_nodiff', $
 	      'm260zhp040y264a18al00_nodiff', $
              'm260zhp040y279a18al00_nodiff', $
              'm060zhm200y249a18al00_nodiff', $
 	      'm060zhm200y264a18al00_nodiff',$
              'm060zhm200y279a18al00_nodiff', $
              'm260zhm200y249a18al00_nodiff', $
 	      'm260zhm200y264a18al00_nodiff', $
              'm260zhm200y279a18al00_nodiff' $
            ]

    outfile= 'Hediffs'
    outtext=''
    textperrun=[  '0.249', '0.264', '0.279', '0.6+0.4', '','','2.6+0.4', '','','0.6-2.0', '','','2.6-2.0', '',''  ]
if gtype eq 'Track' then begin
    xmin=4.2;3.660 ;
    xmax=3.5;3.640 ;
    ymin=-1.2;1.26;
    ymax=3.5;1.8;
endif
endif

if type eq 'atmf1' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_cknodf', $
 	      'm100zhm000y265a17al00_grnodf' $
              
            ]

    outfile= 'atmf1'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=6000;3.660 ;
    xmax=3000;3.640 ;
    ymin=5.0;1.26;
    ymax=0.0;1.8;
endif
endif

if type eq 'atmf2' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $


 	      'm260zhm200y264a18al00_nodiff', $
 	      'm260zhm200y265a17al00_cknodf', $
 	      'm260zhm200y265a17al00_grnodf' $
              
            ]

    outfile= 'atmf2'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif


endif


if type eq 'atmf1zS' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_cknodf', $
 	      'm100zhm000y265a17al00_grnodf' $
              
            ]

    outfile= 'atmf1zS'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5780;3.660 ;
    xmax=5760;3.640 ;
    ymin=4.45;1.26;
    ymax=4.43;1.8;
endif
if gtype eq 'Tracklin' then begin
    xmin=5780;3.660 ;
    xmax=5760;3.640 ;
    ymin=-0.01;1.26;
    ymax=0.01;1.8;
endif
endif

if type eq 'atmf1zGB' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_cknodf', $
 	      'm100zhm000y265a17al00_grnodf' $
              
            ]

    outfile= 'atmf1zGB'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=4600;3.660 ;
    xmax=4300;3.640 ;
    ymin=2.8;1.26;
    ymax=2.2;1.8;
endif
if gtype eq 'Tracklin' then begin
    xmin=5780;3.660 ;
    xmax=5760;3.640 ;
    ymin=-0.01;1.26;
    ymax=0.01;1.8;
endif
endif

if type eq 'atmf3' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm260zhm200y265a17al00_grnodf', $
 	      'm260zhm200y265a17al00_cknodf', $
 	      'm260zhm200y264a18al00_nodiff', $
 	      'm260zhm160y265a17al00_grnodf', $
 	      'm260zhm160y265a17al00_cknodf', $
 	      'm260zhm160y264a18al00_nodiff', $
 	      'm260zhm120y265a17al00_grnodf', $
 	      'm260zhm120y265a17al00_cknodf', $
 	      'm260zhm120y264a18al00_nodiff', $
 	      'm260zhm080y265a17al00_grnodf', $
 	      'm260zhm080y265a17al00_cknodf', $
 	      'm260zhm080y264a18al00_nodiff', $
 	      'm260zhm040y265a17al00_grnodf', $
 	      'm260zhm040y265a17al00_cknodf', $
 	      'm260zhm040y264a18al00_nodiff', $
 	      'm260zhm000y265a17al00_grnodf', $
 	      'm260zhm000y265a17al00_cknodf', $
 	      'm260zhm000y264a18al00_nodiff', $
 	      'm260zhp040y265a17al00_grnodf', $
 	      'm260zhp040y265a17al00_cknodf', $
 	      'm260zhp040y264a18al00_nodiff', $
 	      'm100zhm200y265a17al00_grnodf', $
 	      'm100zhm200y265a17al00_cknodf', $
 	      'm100zhm200y264a18al00_nodiff', $
 	      'm100zhm160y265a17al00_grnodf', $
 	      'm100zhm160y265a17al00_cknodf', $
 	      'm100zhm160y264a18al00_nodiff', $
 	      'm100zhm120y265a17al00_grnodf', $
 	      'm100zhm120y265a17al00_cknodf', $
 	      'm100zhm120y264a18al00_nodiff', $
 	      'm100zhm080y265a17al00_grnodf', $
 	      'm100zhm080y265a17al00_cknodf', $
 	      'm100zhm080y264a18al00_nodiff', $
 	      'm100zhm040y265a17al00_grnodf', $
 	      'm100zhm040y265a17al00_cknodf', $
 	      'm100zhm040y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm100zhm000y265a17al00_cknodf', $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm100zhp040y265a17al00_grnodf', $
 	      'm100zhp040y265a17al00_cknodf', $
 	      'm100zhp040y264a18al00_nodiff', $
 	      'm060zhm200y265a17al00_grnodf', $
 	      'm060zhm200y265a17al00_cknodf', $
 	      'm060zhm200y264a18al00_nodiff', $
 	      'm060zhm160y265a17al00_grnodf', $
 	      'm060zhm160y265a17al00_cknodf', $
 	      'm060zhm160y264a18al00_nodiff', $
 	      'm060zhm120y265a17al00_grnodf', $
 	      'm060zhm120y265a17al00_cknodf', $
 	      'm060zhm120y264a18al00_nodiff', $
 	      'm060zhm080y265a17al00_grnodf', $
 	      'm060zhm080y265a17al00_cknodf', $
 	      'm060zhm080y264a18al00_nodiff', $
 	      'm060zhm040y265a17al00_grnodf', $
 	      'm060zhm040y265a17al00_cknodf', $
 	      'm060zhm040y264a18al00_nodiff', $
 	      'm060zhm000y265a17al00_grnodf', $
 	      'm060zhm000y265a17al00_cknodf', $
 	      'm060zhm000y264a18al00_nodiff', $
 	      'm060zhp040y265a17al00_grnodf', $
 	      'm060zhp040y265a17al00_cknodf', $
 	      'm060zhp040y264a18al00_nodiff' $
              
            ]

    outfile= 'atmf3'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif
if gtype eq 'DeltaTeffFeH' then begin
    xmin=-2.1
    xmax=0.5
    ymin=-300
    ymax=300
endif
endif

if type eq 'atmML' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $

 	      'm260zhm140y265a17al00_grnodf', $
 	      'm260zhm140y265a17al00_cknodf', $
 	      'm260zhm140y264a18al00_nodiff', $
 	      'm260zhm120y265a17al00_grnodf', $
 	      'm260zhm120y265a17al00_cknodf', $
 	      'm260zhm120y264a18al00_nodiff', $
 	      'm260zhm100y265a17al00_grnodf', $
 	      'm260zhm100y265a17al00_cknodf', $
 	      'm260zhm100y264a18al00_nodiff', $
 	      'm260zhm080y265a17al00_grnodf', $
 	      'm260zhm080y265a17al00_cknodf', $
 	      'm260zhm080y264a18al00_nodiff', $
 	      'm260zhm060y265a17al00_grnodf', $
 	      'm260zhm060y265a17al00_cknodf', $
 	      'm260zhm060y264a18al00_nodiff', $
 	      'm260zhm040y265a17al00_grnodf', $
 	      'm260zhm040y265a17al00_cknodf', $
 	      'm260zhm040y264a18al00_nodiff', $
 	      'm260zhm020y265a17al00_grnodf', $
 	      'm260zhm020y265a17al00_cknodf', $
 	      'm260zhm020y264a18al00_nodiff', $
 	      'm260zhm000y265a17al00_grnodf', $
 	      'm260zhm000y265a17al00_cknodf', $
 	      'm260zhm000y264a18al00_nodiff', $
 	      'm260zhp020y265a17al00_grnodf', $
 	      'm260zhp020y265a17al00_cknodf', $
 	      'm260zhp020y264a18al00_nodiff', $
 	      'm260zhp040y265a17al00_grnodf', $
 	      'm260zhp040y265a17al00_cknodf', $
 	      'm260zhp040y264a18al00_nodiff', $
 	      'm160zhm140y265a17al00_grnodf', $
 	      'm160zhm140y265a17al00_cknodf', $
 	      'm160zhm140y264a18al00_nodiff', $
 	      'm160zhm120y265a17al00_grnodf', $
 	      'm160zhm120y265a17al00_cknodf', $
 	      'm160zhm120y264a18al00_nodiff', $
 	      'm160zhm100y265a17al00_grnodf', $
 	      'm160zhm100y265a17al00_cknodf', $
 	      'm160zhm100y264a18al00_nodiff', $
 	      'm160zhm080y265a17al00_grnodf', $
 	      'm160zhm080y265a17al00_cknodf', $
 	      'm160zhm080y264a18al00_nodiff', $
 	      'm160zhm060y265a17al00_grnodf', $
 	      'm160zhm060y265a17al00_cknodf', $
 	      'm160zhm060y264a18al00_nodiff', $
 	      'm160zhm040y265a17al00_grnodf', $
 	      'm160zhm040y265a17al00_cknodf', $
 	      'm160zhm040y264a18al00_nodiff', $
	      'm160zhm020y265a17al00_grnodf', $
 	      'm160zhm020y265a17al00_cknodf', $
 	      'm160zhm020y264a18al00_nodiff', $
 	      'm160zhm000y265a17al00_grnodf', $
 	      'm160zhm000y265a17al00_cknodf', $
 	      'm160zhm000y264a18al00_nodiff', $
 	      'm160zhp020y265a17al00_grnodf', $
 	      'm160zhp020y265a17al00_cknodf', $
 	      'm160zhp020y264a18al00_nodiff', $
 	      'm160zhp040y265a17al00_grnodf', $
 	      'm160zhp040y265a17al00_cknodf', $
 	      'm160zhp040y264a18al00_nodiff', $
 	      'm060zhm140y265a17al00_grnodf', $
 	      'm060zhm140y265a17al00_cknodf', $
 	      'm060zhm140y264a18al00_nodiff', $
 	      'm060zhm120y265a17al00_grnodf', $
 	      'm060zhm120y265a17al00_cknodf', $
 	      'm060zhm120y264a18al00_nodiff', $
 	      'm060zhm100y265a17al00_grnodf', $
 	      'm060zhm100y265a17al00_cknodf', $
 	      'm060zhm100y264a18al00_nodiff', $
 	      'm060zhm080y265a17al00_grnodf', $
 	      'm060zhm080y265a17al00_cknodf', $
 	      'm060zhm080y264a18al00_nodiff', $
 	      'm060zhm060y265a17al00_grnodf', $
 	      'm060zhm060y265a17al00_cknodf', $
 	      'm060zhm060y264a18al00_nodiff', $
 	      'm060zhm040y265a17al00_grnodf', $
 	      'm060zhm040y265a17al00_cknodf', $
 	      'm060zhm040y264a18al00_nodiff', $
	      'm060zhm020y265a17al00_grnodf', $
 	      'm060zhm020y265a17al00_cknodf', $
 	      'm060zhm020y264a18al00_nodiff', $
 	      'm060zhm000y265a17al00_grnodf', $
 	      'm060zhm000y265a17al00_cknodf', $
 	      'm060zhm000y264a18al00_nodiff', $
 	      'm060zhp020y265a17al00_grnodf', $
 	      'm060zhp020y265a17al00_cknodf', $
 	      'm060zhp020y264a18al00_nodiff', $
 	      'm060zhp040y265a17al00_grnodf', $
 	      'm060zhp040y265a17al00_cknodf', $
 	      'm060zhp040y264a18al00_nodiff' $              
            ]

    outfile= 'atmML'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif
if gtype eq 'DeltaTeffFeH' then begin
    xmin=-1.8;;-1.5 ;-2.1
    xmax=0.6;0.5
    ymin=-300
    ymax=300
endif
endif



if type eq 'HeML' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $

 	      'm260zhm140y265a17al00_grnodf', $
  	      'm260zhm140y250a17al00_grnodf', $
 	      'm260zhm140y280a17al00_grnodf', $
 	      'm260zhm120y265a17al00_grnodf', $
  	      'm260zhm120y250a17al00_grnodf', $
 	      'm260zhm120y280a17al00_grnodf', $
 	      'm260zhm100y265a17al00_grnodf', $
  	      'm260zhm100y250a17al00_grnodf', $
 	      'm260zhm100y280a17al00_grnodf', $
 	      'm260zhm080y265a17al00_grnodf', $
  	      'm260zhm080y250a17al00_grnodf', $
 	      'm260zhm080y280a17al00_grnodf', $
 	      'm260zhm060y265a17al00_grnodf', $
  	      'm260zhm060y250a17al00_grnodf', $
 	      'm260zhm060y280a17al00_grnodf', $
 	      'm260zhm040y265a17al00_grnodf', $
  	      'm260zhm040y250a17al00_grnodf', $
 	      'm260zhm040y280a17al00_grnodf', $
  	      'm260zhm020y265a17al00_grnodf', $
  	      'm260zhm020y250a17al00_grnodf', $
 	      'm260zhm020y280a17al00_grnodf', $
 	      'm260zhm000y265a17al00_grnodf', $
  	      'm260zhm000y250a17al00_grnodf', $
 	      'm260zhm000y280a17al00_grnodf', $
 	      'm260zhp020y265a17al00_grnodf', $
  	      'm260zhp020y250a17al00_grnodf', $
 	      'm260zhp020y280a17al00_grnodf', $
 	      'm260zhp040y265a17al00_grnodf', $
  	      'm260zhp040y250a17al00_grnodf', $
 	      'm260zhp040y280a17al00_grnodf', $
 	      'm160zhm140y265a17al00_grnodf', $
  	      'm160zhm140y250a17al00_grnodf', $
 	      'm160zhm140y280a17al00_grnodf', $
 	      'm160zhm120y265a17al00_grnodf', $
  	      'm160zhm120y250a17al00_grnodf', $
 	      'm160zhm120y280a17al00_grnodf', $
 	      'm160zhm100y265a17al00_grnodf', $
  	      'm160zhm100y250a17al00_grnodf', $
 	      'm160zhm100y280a17al00_grnodf', $
 	      'm160zhm080y265a17al00_grnodf', $
  	      'm160zhm080y250a17al00_grnodf', $
 	      'm160zhm080y280a17al00_grnodf', $
 	      'm160zhm060y265a17al00_grnodf', $
  	      'm160zhm060y250a17al00_grnodf', $
 	      'm160zhm060y280a17al00_grnodf', $
 	      'm160zhm040y265a17al00_grnodf', $
  	      'm160zhm040y250a17al00_grnodf', $
 	      'm160zhm040y280a17al00_grnodf', $
  	      'm160zhm020y265a17al00_grnodf', $
  	      'm160zhm020y250a17al00_grnodf', $
 	      'm160zhm020y280a17al00_grnodf', $
 	      'm160zhm000y265a17al00_grnodf', $
  	      'm160zhm000y250a17al00_grnodf', $
 	      'm160zhm000y280a17al00_grnodf', $
 	      'm160zhp020y265a17al00_grnodf', $
  	      'm160zhp020y250a17al00_grnodf', $
 	      'm160zhp020y280a17al00_grnodf', $
 	      'm160zhp040y265a17al00_grnodf', $
  	      'm160zhp040y250a17al00_grnodf', $
 	      'm160zhp040y280a17al00_grnodf', $
 	      'm060zhm140y265a17al00_grnodf', $
  	      'm060zhm140y250a17al00_grnodf', $
 	      'm060zhm140y280a17al00_grnodf', $
 	      'm060zhm120y265a17al00_grnodf', $
  	      'm060zhm120y250a17al00_grnodf', $
 	      'm060zhm120y280a17al00_grnodf', $
 	      'm060zhm100y265a17al00_grnodf', $
  	      'm060zhm100y250a17al00_grnodf', $
 	      'm060zhm100y280a17al00_grnodf', $
 	      'm060zhm080y265a17al00_grnodf', $
  	      'm060zhm080y250a17al00_grnodf', $
 	      'm060zhm080y280a17al00_grnodf', $
 	      'm060zhm060y265a17al00_grnodf', $
  	      'm060zhm060y250a17al00_grnodf', $
 	      'm060zhm060y280a17al00_grnodf', $
 	      'm060zhm040y265a17al00_grnodf', $
  	      'm060zhm040y250a17al00_grnodf', $
 	      'm060zhm040y280a17al00_grnodf', $
  	      'm060zhm020y265a17al00_grnodf', $
  	      'm060zhm020y250a17al00_grnodf', $
 	      'm060zhm020y280a17al00_grnodf', $
 	      'm060zhm000y265a17al00_grnodf', $
  	      'm060zhm000y250a17al00_grnodf', $
 	      'm060zhm000y280a17al00_grnodf', $
 	      'm060zhp020y265a17al00_grnodf', $
  	      'm060zhp020y250a17al00_grnodf', $
 	      'm060zhp020y280a17al00_grnodf', $
 	      'm060zhp040y265a17al00_grnodf', $
  	      'm060zhp040y250a17al00_grnodf', $
 	      'm060zhp040y280a17al00_grnodf' $   
         ]

    outfile= 'HeML'
    outtext=''
    textperrun=[  '265', '250','280'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif
if gtype eq 'DeltaTeffFeH' then begin
    xmin=-1.8;;-1.5 ;-2.1
    xmax=0.6;0.5
    ymin=-300
    ymax=300
endif
endif


if type eq 'massf3' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm240zhm200y264a18al00_nodiff', $
 	      'm220zhm200y264a18al00_nodiff', $
 	      'm260zhm200y264a18al00_nodiff', $
 	      'm240zhm160y264a18al00_nodiff', $
 	      'm220zhm160y264a18al00_nodiff', $
 	      'm260zhm160y264a18al00_nodiff', $
 	      'm240zhm120y264a18al00_nodiff', $
 	      'm220zhm120y264a18al00_nodiff', $
 	      'm260zhm120y264a18al00_nodiff', $
 	      'm240zhm080y264a18al00_nodiff', $
 	      'm220zhm080y264a18al00_nodiff', $
 	      'm260zhm080y264a18al00_nodiff', $
 	      'm240zhm040y264a18al00_nodiff', $
 	      'm220zhm040y264a18al00_nodiff', $
 	      'm260zhm040y264a18al00_nodiff', $
 	      'm240zhm000y264a18al00_nodiff', $
 	      'm220zhm000y264a18al00_nodiff', $
 	      'm260zhm000y264a18al00_nodiff', $
 	      'm240zhp040y264a18al00_nodiff', $
 	      'm220zhp040y264a18al00_nodiff', $
 	      'm260zhp040y264a18al00_nodiff', $
 	      'm120zhm200y264a18al00_nodiff', $
 	      'm100zhm200y264a18al00_nodiff', $
 	      'm140zhm200y264a18al00_nodiff', $
 	      'm120zhm160y264a18al00_nodiff', $
 	      'm100zhm160y264a18al00_nodiff', $
 	      'm140zhm160y264a18al00_nodiff', $
 	      'm120zhm120y264a18al00_nodiff', $
 	      'm100zhm120y264a18al00_nodiff', $
 	      'm140zhm120y264a18al00_nodiff', $
 	      'm120zhm080y264a18al00_nodiff', $
 	      'm100zhm080y264a18al00_nodiff', $
 	      'm140zhm080y264a18al00_nodiff', $
 	      'm120zhm040y264a18al00_nodiff', $
 	      'm100zhm040y264a18al00_nodiff', $
 	      'm140zhm040y264a18al00_nodiff', $
 	      'm120zhm000y264a18al00_nodiff', $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm140zhm000y264a18al00_nodiff', $
 	      'm120zhp040y264a18al00_nodiff', $
 	      'm100zhp040y264a18al00_nodiff', $
 	      'm140zhp040y264a18al00_nodiff', $
 	      'm080zhm200y264a18al00_nodiff', $
 	      'm060zhm200y264a18al00_nodiff', $
 	      'm100zhm200y264a18al00_nodiff', $
 	      'm080zhm160y264a18al00_nodiff', $
 	      'm060zhm160y264a18al00_nodiff', $
 	      'm100zhm160y264a18al00_nodiff', $
 	      'm080zhm120y264a18al00_nodiff', $
 	      'm060zhm120y264a18al00_nodiff', $
 	      'm100zhm120y264a18al00_nodiff', $
 	      'm080zhm080y264a18al00_nodiff', $
 	      'm060zhm080y264a18al00_nodiff', $
 	      'm100zhm080y264a18al00_nodiff', $
 	      'm080zhm040y264a18al00_nodiff', $
 	      'm060zhm040y264a18al00_nodiff', $
 	      'm100zhm040y264a18al00_nodiff', $
 	      'm080zhm000y264a18al00_nodiff', $
 	      'm060zhm000y264a18al00_nodiff', $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm080zhp040y264a18al00_nodiff', $
 	      'm060zhp040y264a18al00_nodiff', $
 	      'm100zhp040y264a18al00_nodiff' $
              
            ]

    outfile= 'massf3'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif
if gtype eq 'DeltaTeffFeH' then begin
    xmin=-2.1
    xmax=0.5
    ymin=-300
    ymax=300
endif
endif

if type eq 'hef3' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm260zhm200y264a18al00_nodiff', $
 	      'm260zhm200y249a18al00_nodiff', $
 	      'm260zhm200y279a18al00_nodiff', $
 	      'm260zhm160y264a18al00_nodiff', $
 	      'm260zhm160y249a18al00_nodiff', $
 	      'm260zhm160y279a18al00_nodiff', $
 	      'm260zhm120y264a18al00_nodiff', $
 	      'm260zhm120y249a18al00_nodiff', $
 	      'm260zhm120y279a18al00_nodiff', $
 	      'm260zhm080y264a18al00_nodiff', $
 	      'm260zhm080y249a18al00_nodiff', $
 	      'm260zhm080y279a18al00_nodiff', $
 	      'm260zhm040y264a18al00_nodiff', $
 	      'm260zhm040y249a18al00_nodiff', $
 	      'm260zhm040y279a18al00_nodiff', $
 	      'm260zhm000y264a18al00_nodiff', $
 	      'm260zhm000y249a18al00_nodiff', $
 	      'm260zhm000y279a18al00_nodiff', $
 	      'm260zhp040y264a18al00_nodiff', $
 	      'm260zhp040y249a18al00_nodiff', $
 	      'm260zhp040y279a18al00_nodiff', $
 	      'm100zhm200y264a18al00_nodiff', $
 	      'm100zhm200y249a18al00_nodiff', $
 	      'm100zhm200y279a18al00_nodiff', $
 	      'm100zhm160y264a18al00_nodiff', $
 	      'm100zhm160y249a18al00_nodiff', $
 	      'm100zhm160y279a18al00_nodiff', $
 	      'm100zhm120y264a18al00_nodiff', $
 	      'm100zhm120y249a18al00_nodiff', $
 	      'm100zhm120y279a18al00_nodiff', $
 	      'm100zhm080y264a18al00_nodiff', $
 	      'm100zhm080y249a18al00_nodiff', $
 	      'm100zhm080y279a18al00_nodiff', $
 	      'm100zhm040y264a18al00_nodiff', $
 	      'm100zhm040y249a18al00_nodiff', $
 	      'm100zhm040y279a18al00_nodiff', $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y249a18al00_nodiff', $
 	      'm100zhm000y279a18al00_nodiff', $
 	      'm100zhp040y264a18al00_nodiff', $
 	      'm100zhp040y249a18al00_nodiff', $
 	      'm100zhp040y279a18al00_nodiff', $
 	      'm060zhm200y264a18al00_nodiff', $
 	      'm060zhm200y249a18al00_nodiff', $
 	      'm060zhm200y279a18al00_nodiff', $
 	      'm060zhm160y264a18al00_nodiff', $
 	      'm060zhm160y249a18al00_nodiff', $
 	      'm060zhm160y279a18al00_nodiff', $
 	      'm060zhm120y264a18al00_nodiff', $
 	      'm060zhm120y249a18al00_nodiff', $
 	      'm060zhm120y279a18al00_nodiff', $
 	      'm060zhm080y264a18al00_nodiff', $
 	      'm060zhm080y249a18al00_nodiff', $
 	      'm060zhm080y279a18al00_nodiff', $
 	      'm060zhm040y264a18al00_nodiff', $
 	      'm060zhm040y249a18al00_nodiff', $
 	      'm060zhm040y279a18al00_nodiff', $
 	      'm060zhm000y264a18al00_nodiff', $
 	      'm060zhm000y249a18al00_nodiff', $
 	      'm060zhm000y279a18al00_nodiff', $
 	      'm060zhp040y264a18al00_nodiff', $
 	      'm060zhp040y249a18al00_nodiff', $
 	      'm060zhp040y279a18al00_nodiff' $
              
            ]

    outfile= 'hef3'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif
if gtype eq 'DeltaTeffFeH' then begin
    xmin=-2.1
    xmax=0.5
    ymin=-300
    ymax=300
endif
endif

if type eq 'mlf3' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm260zhm200y264a18al00_nodiff', $
 	      'm260zhm200y264a13al00_nodiff', $
 	      'm260zhm200y264a23al00_nodiff', $
 	      'm260zhm160y264a18al00_nodiff', $
 	      'm260zhm160y264a13al00_nodiff', $
 	      'm260zhm160y264a23al00_nodiff', $
 	      'm260zhm120y264a18al00_nodiff', $
 	      'm260zhm120y264a13al00_nodiff', $
 	      'm260zhm120y264a23al00_nodiff', $
 	      'm260zhm080y264a18al00_nodiff', $
 	      'm260zhm080y264a13al00_nodiff', $
 	      'm260zhm080y264a23al00_nodiff', $
 	      'm260zhm040y264a18al00_nodiff', $
 	      'm260zhm040y264a13al00_nodiff', $
 	      'm260zhm040y264a23al00_nodiff', $
 	      'm260zhm000y264a18al00_nodiff', $
 	      'm260zhm000y264a13al00_nodiff', $
 	      'm260zhm000y264a23al00_nodiff', $
 	      'm260zhp040y264a18al00_nodiff', $
 	      'm260zhp040y264a13al00_nodiff', $
 	      'm260zhp040y264a23al00_nodiff', $
 	      'm100zhm200y264a18al00_nodiff', $
 	      'm100zhm200y264a13al00_nodiff', $
 	      'm100zhm200y264a23al00_nodiff', $
 	      'm100zhm160y264a18al00_nodiff', $
 	      'm100zhm160y264a13al00_nodiff', $
 	      'm100zhm160y264a23al00_nodiff', $
 	      'm100zhm120y264a18al00_nodiff', $
 	      'm100zhm120y264a13al00_nodiff', $
 	      'm100zhm120y264a23al00_nodiff', $
 	      'm100zhm080y264a18al00_nodiff', $
 	      'm100zhm080y264a13al00_nodiff', $
 	      'm100zhm080y264a23al00_nodiff', $
 	      'm100zhm040y264a18al00_nodiff', $
 	      'm100zhm040y264a13al00_nodiff', $
 	      'm100zhm040y264a23al00_nodiff', $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm100zhm000y264a13al00_nodiff', $
 	      'm100zhm000y264a23al00_nodiff', $
 	      'm100zhp040y264a18al00_nodiff', $
 	      'm100zhp040y264a13al00_nodiff', $
 	      'm100zhp040y264a23al00_nodiff', $
 	      'm060zhm200y264a18al00_nodiff', $
 	      'm060zhm200y264a13al00_nodiff', $
 	      'm060zhm200y264a23al00_nodiff', $
 	      'm060zhm160y264a18al00_nodiff', $
 	      'm060zhm160y264a13al00_nodiff', $
 	      'm060zhm160y264a23al00_nodiff', $
 	      'm060zhm120y264a18al00_nodiff', $
 	      'm060zhm120y264a13al00_nodiff', $
 	      'm060zhm120y264a23al00_nodiff', $
 	      'm060zhm080y264a18al00_nodiff', $
 	      'm060zhm080y264a13al00_nodiff', $
 	      'm060zhm080y264a23al00_nodiff', $
 	      'm060zhm040y264a18al00_nodiff', $
 	      'm060zhm040y264a13al00_nodiff', $
 	      'm060zhm040y264a23al00_nodiff', $
 	      'm060zhm000y264a18al00_nodiff', $
 	      'm060zhm000y264a13al00_nodiff', $
 	      'm060zhm000y264a23al00_nodiff', $
 	      'm060zhp040y264a18al00_nodiff', $
 	      'm060zhp040y264a13al00_nodiff', $
 	      'm060zhp040y264a23al00_nodiff' $
              
            ]

    outfile= 'mlf3'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif
if gtype eq 'DeltaTeffFeH' then begin
    xmin=-2.1
    xmax=0.5
    ymin=-300
    ymax=300
endif

endif


if type eq 'diffzhm000' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm260zhm000y265a17al00_grnodf', $
 	      'm260zhm000y265a17al00_cknodf', $
 	      'm260zhm000y265a17al00_grnodf', $
 	      'm260zhm000y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm100zhm000y265a17al00_cknodf', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm060zhm000y265a17al00_grnodf', $
 	      'm060zhm000y265a17al00_cknodf', $
 	      'm060zhm000y265a17al00_grnodf', $
 	      'm060zhm000y264a18al00_nodiff' $            
            ]

    outfile= 'diffzhm000'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif
if gtype eq 'DeltaTeffFeH' then begin
    xmin=-2.1
    xmax=0.5
    ymin=-300
    ymax=300
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=100
     xmax=-100
     ymin=4.0
     ymax=0.0
endif
endif


if type eq 'diffzhm160' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm260zhm160y265a17al00_grnodf', $
 	      'm260zhm160y265a17al00_cknodf', $
 	      'm260zhm160y265a17al00_grnodf', $
 	      'm260zhm160y264a18al00_nodiff', $
 	      'm100zhm160y265a17al00_grnodf', $
 	      'm100zhm160y265a17al00_cknodf', $
 	      'm100zhm160y265a17al00_grnodf', $
 	      'm100zhm160y264a18al00_nodiff', $
 	      'm060zhm160y265a17al00_grnodf', $
 	      'm060zhm160y265a17al00_cknodf', $
 	      'm060zhm160y265a17al00_grnodf', $
 	      'm060zhm160y264a18al00_nodiff' $            
            ]

    outfile= 'diffzhm160'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif
if gtype eq 'DeltaTeffFeH' then begin
    xmin=-2.1
    xmax=0.5
    ymin=-300
    ymax=300
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=100
     xmax=-100
     ymin=4.0
     ymax=0.0
endif
endif

if type eq 'diffzhm200' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm260zhm200y265a17al00_grnodf', $
 	      'm260zhm200y265a17al00_cknodf', $
 	      'm260zhm200y265a17al00_grnodf', $
 	      'm260zhm200y264a18al00_nodiff', $
 	      'm100zhm200y265a17al00_grnodf', $
 	      'm100zhm200y265a17al00_cknodf', $
 	      'm100zhm200y265a17al00_grnodf', $
 	      'm100zhm200y264a18al00_nodiff', $
 	      'm060zhm200y265a17al00_grnodf', $
 	      'm060zhm200y265a17al00_cknodf', $
 	      'm060zhm200y265a17al00_grnodf', $
 	      'm060zhm200y264a18al00_nodiff' $            
            ]

    outfile= 'diffzhm200'
    outtext=''
    textperrun=[  'K', 'C','G'  ]
if gtype eq 'TeffLogg' then begin
    xmin=5300;18000;3.660 ;
    xmax=4800 ;4000;3.640 ;
    ymin=1.9;5.0;1.26;
    ymax=1.55;1.8;
endif
if gtype eq 'Track' then begin
    xmin=4.25;
    xmax=3.65;3.640 ;
    ymin=1.5;1.26;
    ymax=3.2;1.8;
endif
if gtype eq 'DeltaTeffFeH' then begin
    xmin=-2.1
    xmax=0.5
    ymin=-300
    ymax=300
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=100
     xmax=-100
     ymin=4.0
     ymax=0.0
endif
endif

if type eq 'diffzhm000close' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm060zhm000y265a17al00_grnodf', $
 	      'm060zhm000y265a17al00_cknodf', $
 	      'm060zhm000y265a17al00_grnodf', $
 	      'm060zhm000y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm100zhm000y265a17al00_cknodf', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm140zhm000y265a17al00_grnodf', $
 	      'm140zhm000y265a17al00_cknodf', $
 	      'm140zhm000y265a17al00_grnodf', $
 	      'm140zhm000y264a18al00_nodiff', $      
 	      'm180zhm000y265a17al00_grnodf', $
 	      'm180zhm000y265a17al00_cknodf', $
 	      'm180zhm000y265a17al00_grnodf', $
 	      'm180zhm000y264a18al00_nodiff', $
 	      'm220zhm000y265a17al00_grnodf', $
 	      'm220zhm000y265a17al00_cknodf', $
 	      'm220zhm000y265a17al00_grnodf', $
 	      'm220zhm000y264a18al00_nodiff', $
 	      'm260zhm000y265a17al00_grnodf', $
 	      'm260zhm000y265a17al00_cknodf', $
 	      'm260zhm000y265a17al00_grnodf', $
 	      'm260zhm000y264a18al00_nodiff' $         
            ]

    outfile= 'diffzhm000close'
    outtext=''
    textperrun=[ 'm060G', 'm060C', 'm060G', 'm060K',  'm100G', 'm100C', 'm100G', 'm100K','m140G', 'm140C', 'm140G', 'm140K','m180G', 'm180C', 'm180G', 'm180K',$
              'm220G', 'm220C', 'm220G', 'm220K','m260G', 'm260C', 'm260G', 'm260K' ]
if gtype eq 'Track' then begin
    xmin=4.15;
    xmax=3.5;3.640 ;
    ymin=-0.8;.26;
    ymax=2.0;1.8;
endif
if gtype eq 'TeffLogg' then begin
    xmin=10000;18000;3.660 ;
    xmax=3000 ;4000;3.640 ;
    ymin=5.0;1.26;
    ymax=0.0;1.8;
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=50 
     xmax=-50 
     ymin=4.0
     ymax=0.0
endif
endif

if type eq 'diffzhm080close' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm060zhm080y265a17al00_grnodf', $
 	      'm060zhm080y265a17al00_cknodf', $
 	      'm060zhm080y265a17al00_grnodf', $
 	      'm060zhm080y264a18al00_nodiff', $
 	      'm100zhm080y265a17al00_grnodf', $
 	      'm100zhm080y265a17al00_cknodf', $
 	      'm100zhm080y265a17al00_grnodf', $
 	      'm100zhm080y264a18al00_nodiff', $
 	      'm140zhm080y265a17al00_grnodf', $
 	      'm140zhm080y265a17al00_cknodf', $
 	      'm140zhm080y265a17al00_grnodf', $
 	      'm140zhm080y264a18al00_nodiff', $      
 	      'm180zhm080y265a17al00_grnodf', $
 	      'm180zhm080y265a17al00_cknodf', $
 	      'm180zhm080y265a17al00_grnodf', $
 	      'm180zhm080y264a18al00_nodiff', $
 	      'm220zhm080y265a17al00_grnodf', $
 	      'm220zhm080y265a17al00_cknodf', $
 	      'm220zhm080y265a17al00_grnodf', $
 	      'm220zhm080y264a18al00_nodiff', $
 	      'm260zhm080y265a17al00_grnodf', $
 	      'm260zhm080y265a17al00_cknodf', $
 	      'm260zhm080y265a17al00_grnodf', $
 	      'm260zhm080y264a18al00_nodiff' $         
            ]

    outfile= 'diffzhm080close'
    outtext=''
    textperrun=[  'm060G', 'm060C', 'm060G', 'm060K',  'm100G', 'm100C', 'm100G', 'm100K','m140G', 'm140C', 'm140G', 'm140K','m180G', 'm180C', 'm180G', 'm180K',$
              'm220G', 'm220C', 'm220G', 'm220K','m260G', 'm260C', 'm260G', 'm260K'   ]
if gtype eq 'Track' then begin
    xmin=4.15;
    xmax=3.5;3.640 ;
    ymin=-0.5;.26;
    ymax=3.5;1.8;
endif
if gtype eq 'TeffLogg' then begin
    xmin=10000;18000;3.660 ;
    xmax=3000 ;4000;3.640 ;
    ymin=5.0;1.26;
    ymax=0.0;1.8;
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=100
     xmax=-100
     ymin=4.0
     ymax=0.0
endif
endif

if type eq 'diffm100close' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm100zhm200y265a17al00_grnodf', $
 	      'm100zhm200y265a17al00_cknodf', $
 	      'm100zhm200y265a17al00_grnodf', $
 	      'm100zhm200y264a18al00_nodiff', $
 	      'm100zhm160y265a17al00_grnodf', $
 	      'm100zhm160y265a17al00_cknodf', $
 	      'm100zhm160y265a17al00_grnodf', $
 	      'm100zhm160y264a18al00_nodiff', $
 	      'm100zhm120y265a17al00_grnodf', $
 	      'm100zhm120y265a17al00_cknodf', $
 	      'm100zhm120y265a17al00_grnodf', $
 	      'm100zhm120y264a18al00_nodiff', $      
 	      'm100zhm080y265a17al00_grnodf', $
 	      'm100zhm080y265a17al00_cknodf', $
 	      'm100zhm080y265a17al00_grnodf', $
 	      'm100zhm080y264a18al00_nodiff', $
 	      'm100zhm040y265a17al00_grnodf', $
 	      'm100zhm040y265a17al00_cknodf', $
 	      'm100zhm040y265a17al00_grnodf', $
 	      'm100zhm040y264a18al00_nodiff', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm100zhm000y265a17al00_cknodf', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm100zhm000y264a18al00_nodiff', $
 	      'm100zhp040y265a17al00_grnodf', $
 	      'm100zhp040y265a17al00_cknodf', $
 	      'm100zhp040y265a17al00_grnodf', $
 	      'm100zhp040y264a18al00_nodiff' $              
            ]

    outfile= 'diffm100close'
    outtext=''
    textperrun=[  'm20G','m20C','m20G','m20K','m16G','m16C','m16G','m16K','m12G','m12C','m12G','m12K', $
                   'm08G','m08C','m08G','m08K','m04G','m04C','m04G','m04K', $
                   'm00G','m00C','m00G','m00K','p04G','p04C','p04G','p04K'  ]
if gtype eq 'Track' then begin
    xmin=4.15;
    xmax=3.5;3.640 ;
    ymin=-0.5;.26;
    ymax=3.5;1.8;
endif
if gtype eq 'TeffLogg' then begin
    xmin=10000;18000;3.660 ;
    xmax=3000 ;4000;3.640 ;
    ymin=5.0;1.26;
    ymax=0.0;1.8;
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=100
     xmax=-100
     ymin=4.0
     ymax=0.0
endif
endif
if type eq 'diffm180close' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm180zhm200y265a17al00_grnodf', $
 	      'm180zhm200y265a17al00_cknodf', $
 	      'm180zhm200y265a17al00_grnodf', $
 	      'm180zhm200y264a18al00_nodiff', $
 	      'm180zhm160y265a17al00_grnodf', $
 	      'm180zhm160y265a17al00_cknodf', $
 	      'm180zhm160y265a17al00_grnodf', $
 	      'm180zhm160y264a18al00_nodiff', $
 	      'm180zhm120y265a17al00_grnodf', $
 	      'm180zhm120y265a17al00_cknodf', $
 	      'm180zhm120y265a17al00_grnodf', $
 	      'm180zhm120y264a18al00_nodiff', $      
 	      'm180zhm080y265a17al00_grnodf', $
 	      'm180zhm080y265a17al00_cknodf', $
 	      'm180zhm080y265a17al00_grnodf', $
 	      'm180zhm080y264a18al00_nodiff', $
 	      'm180zhm040y265a17al00_grnodf', $
 	      'm180zhm040y265a17al00_cknodf', $
 	      'm180zhm040y265a17al00_grnodf', $
 	      'm180zhm040y264a18al00_nodiff', $
 	      'm180zhm000y265a17al00_grnodf', $
 	      'm180zhm000y265a17al00_cknodf', $
 	      'm180zhm000y265a17al00_grnodf', $
 	      'm180zhm000y264a18al00_nodiff', $
 	      'm180zhp040y265a17al00_grnodf', $
 	      'm180zhp040y265a17al00_cknodf', $
 	      'm180zhp040y265a17al00_grnodf', $
 	      'm180zhp040y264a18al00_nodiff' $              
            ]

    outfile= 'diffm180close'
    outtext=''
    textperrun=[  'm20G','m20C','m20G','m20K','m16G','m16C','m16G','m16K','m12G','m12C','m12G','m12K', $
                   'm08G','m08C','m08G','m08K','m04G','m04C','m04G','m04K', $
                   'm00G','m00C','m00G','m00K','p04G','p04C','p04G','p04K']

if gtype eq 'TeffLoggDiff2' then begin
     xmin=100
     xmax=-100
     ymin=4.0
     ymax=0.0
endif
if gtype eq 'Track' then begin
    xmin=4.15;
    xmax=3.5;3.640 ;
    ymin=-0.5;.26;
    ymax=3.5;1.8;
endif
if gtype eq 'TeffLogg' then begin
    xmin=10000;18000;3.660 ;
    xmax=3000 ;4000;3.640 ;
    ymin=5.0;1.26;
    ymax=0.0;1.8;
endif
endif
if type eq 'newcorner3' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
              'm060zhp040y264a18al00_nodifv', $
              'm060zhm200y264a18al00_nodifv', $
              'm260zhp040y264a18al00_nodifv',$
              'm260zhm200y264a18al00_nodifv',$
              'm100zhm000y264a18al00_nodifv'$
            ]

    outfile= 'newcorner3'
    outtext=''
    textperrun=[ '.6+.4', '.6-2.', '2.6+.4', '2.6-2.', '1.0-0' ]
if gtype eq 'Track' then begin
    xmin=4.3
    xmax=3.0
    ymin=-1.5
    ymax=3.5
endif
endif
if type eq 'diffnewcorner3' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/'
    infiles=[ $
              'nodiff_out2/m060zhp040y264a18al00_nodiff', $
              'nodiff_out3/m060zhp040y264a18al00_nodifv', $
              'nodiff_out2/m060zhm200y264a18al00_nodiff', $
              'nodiff_out3/m060zhm200y264a18al00_nodifv', $
              'nodiff_out2/m260zhp040y264a18al00_nodiff',$
              'nodiff_out3/m260zhp040y264a18al00_nodifv',$
              'nodiff_out2/m260zhm200y264a18al00_nodiff',$
              'nodiff_out3/m260zhm200y264a18al00_nodifv',$
              'nodiff_out2/m100zhm000y264a18al00_nodiff',$
              'nodiff_out3/m100zhm000y264a18al00_nodifv'$
            ]

    outfile= 'diffnewcorner3'
    outtext=''
    textperrun=[ '.6+.4f', '.6+.4v', '.6-2.f','.6-2.v', '2.6+.4f', '2.6+.4v', '2.6-2.f','2.6-2.v', '1.0-0f','1.0-0v' ]
if gtype eq 'Track' then begin
    xmin=3.7;4.3; 
    xmax=3.49;3.0; 
    ymin= 2.9;-1.5;
    ymax=3.24;3.5;
endif
if gtype eq 'TeffLoggDiff2' then begin
    xmin=-20
    xmax=20
    ymin=5
    ymax=0
endif
endif

if type eq 'zhm000close' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
 	      'm060zhm000y265a17al00_grnodf', $
 	      'm100zhm000y265a17al00_grnodf', $
 	      'm140zhm000y265a17al00_grnodf', $ 
 	      'm180zhm000y265a17al00_grnodf', $
 	      'm220zhm000y265a17al00_grnodf', $
 	      'm260zhm000y265a17al00_grnodf',$
 	      'm060zhm100y265a17al00_grnodf', $
 	      'm100zhm100y265a17al00_grnodf', $
 	      'm140zhm100y265a17al00_grnodf', $ 
 	      'm180zhm100y265a17al00_grnodf', $
 	      'm220zhm100y265a17al00_grnodf', $
 	      'm260zhm100y265a17al00_grnodf'$     
            ]

    outfile= 'diffzhm000close'
    outtext=''
    textperrun=[ 'm060S','m100S', 'm140S',  'm180S',$
              'm220S', 'm260S','m060L','m100L', 'm140L',  'm180L',$
              'm220L', 'm260L']
if gtype eq 'Tracknopms' then begin
    xmin=4.15;
    xmax=3.5;3.640 ;
    ymin=-0.8;.26;
    ymax=2.0;1.8;
endif
if gtype eq 'TeffLogg' then begin
    xmin=10000;18000;3.660 ;
    xmax=3000 ;4000;3.640 ;
    ymin=5.0;1.26;
    ymax=0.0;1.8;
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=50 
     xmax=-50 
     ymin=4.0
     ymax=0.0
endif
endif


if type eq 'HeEffects' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
 	      'm060zhm000y249a18al00_nodifv','m070zhm000y249a18al00_nodifv', $
 	      'm080zhm000y249a18al00_nodifv','m090zhm000y249a18al00_nodifv', $
 	      'm100zhm000y249a18al00_nodifv','m110zhm000y249a18al00_nodifv', $
 	      'm120zhm000y249a18al00_nodifv','m130zhm000y249a18al00_nodifv', $
 	      'm140zhm000y249a18al00_nodifv','m150zhm000y249a18al00_nodifv', $
 	      'm160zhm000y249a18al00_nodifv','m170zhm000y249a18al00_nodifv', $
 	      'm180zhm000y249a18al00_nodifv','m190zhm000y249a18al00_nodifv', $
 	      'm200zhm000y249a18al00_nodifv','m210zhm000y249a18al00_nodifv', $
 	      'm220zhm000y249a18al00_nodifv','m230zhm000y249a18al00_nodifv', $
 	      'm240zhm000y249a18al00_nodifv','m250zhm000y249a18al00_nodifv', $
 	      'm260zhm000y249a18al00_nodifv', $
 	      'm060zhm000y264a18al00_nodifv','m070zhm000y264a18al00_nodifv', $
 	      'm080zhm000y264a18al00_nodifv','m090zhm000y264a18al00_nodifv', $
 	      'm100zhm000y264a18al00_nodifv','m110zhm000y264a18al00_nodifv', $
 	      'm120zhm000y264a18al00_nodifv','m130zhm000y264a18al00_nodifv', $
 	      'm140zhm000y264a18al00_nodifv','m150zhm000y264a18al00_nodifv', $
 	      'm160zhm000y264a18al00_nodifv','m170zhm000y264a18al00_nodifv', $
 	      'm180zhm000y264a18al00_nodifv','m190zhm000y264a18al00_nodifv', $
 	      'm200zhm000y264a18al00_nodifv','m210zhm000y264a18al00_nodifv', $
 	      'm220zhm000y264a18al00_nodifv','m230zhm000y264a18al00_nodifv', $
 	      'm240zhm000y264a18al00_nodifv','m250zhm000y264a18al00_nodifv', $
 	      'm260zhm000y264a18al00_nodifv', $
	      'm060zhm000y279a18al00_nodifv','m070zhm000y279a18al00_nodifv', $
 	      'm080zhm000y279a18al00_nodifv','m090zhm000y279a18al00_nodifv', $
 	      'm100zhm000y279a18al00_nodifv','m110zhm000y279a18al00_nodifv', $
 	      'm120zhm000y279a18al00_nodifv','m130zhm000y279a18al00_nodifv', $
 	      'm140zhm000y279a18al00_nodifv','m150zhm000y279a18al00_nodifv', $
 	      'm160zhm000y279a18al00_nodifv','m170zhm000y279a18al00_nodifv', $
 	      'm180zhm000y279a18al00_nodifv','m190zhm000y279a18al00_nodifv', $
 	      'm200zhm000y279a18al00_nodifv','m210zhm000y279a18al00_nodifv', $
 	      'm220zhm000y279a18al00_nodifv','m230zhm000y279a18al00_nodifv', $
 	      'm240zhm000y279a18al00_nodifv','m250zhm000y279a18al00_nodifv', $
 	      'm260zhm000y279a18al00_nodifv', $

 	      'm060zhm040y249a18al00_nodifv','m070zhm040y249a18al00_nodifv', $
 	      'm080zhm040y249a18al00_nodifv','m090zhm040y249a18al00_nodifv', $
 	      'm100zhm040y249a18al00_nodifv','m110zhm040y249a18al00_nodifv', $
 	      'm120zhm040y249a18al00_nodifv','m130zhm040y249a18al00_nodifv', $
 	      'm140zhm040y249a18al00_nodifv','m150zhm040y249a18al00_nodifv', $
 	      'm160zhm040y249a18al00_nodifv','m170zhm040y249a18al00_nodifv', $
 	      'm180zhm040y249a18al00_nodifv','m190zhm040y249a18al00_nodifv', $
 	      'm200zhm040y249a18al00_nodifv','m210zhm040y249a18al00_nodifv', $
 	      'm220zhm040y249a18al00_nodifv','m230zhm040y249a18al00_nodifv', $
 	      'm240zhm040y249a18al00_nodifv','m250zhm040y249a18al00_nodifv', $
 	      'm260zhm040y249a18al00_nodifv', $
 	      'm060zhm040y264a18al00_nodifv','m070zhm040y264a18al00_nodifv', $
 	      'm080zhm040y264a18al00_nodifv','m090zhm040y264a18al00_nodifv', $
 	      'm100zhm040y264a18al00_nodifv','m110zhm040y264a18al00_nodifv', $
 	      'm120zhm040y264a18al00_nodifv','m130zhm040y264a18al00_nodifv', $
 	      'm140zhm040y264a18al00_nodifv','m150zhm040y264a18al00_nodifv', $
 	      'm160zhm040y264a18al00_nodifv','m170zhm040y264a18al00_nodifv', $
 	      'm180zhm040y264a18al00_nodifv','m190zhm040y264a18al00_nodifv', $
 	      'm200zhm040y264a18al00_nodifv','m210zhm040y264a18al00_nodifv', $
 	      'm220zhm040y264a18al00_nodifv','m230zhm040y264a18al00_nodifv', $
 	      'm240zhm040y264a18al00_nodifv','m250zhm040y264a18al00_nodifv', $
 	      'm260zhm040y264a18al00_nodifv', $
	      'm060zhm040y279a18al00_nodifv','m070zhm040y279a18al00_nodifv', $
 	      'm080zhm040y279a18al00_nodifv','m090zhm040y279a18al00_nodifv', $
 	      'm100zhm040y279a18al00_nodifv','m110zhm040y279a18al00_nodifv', $
 	      'm120zhm040y279a18al00_nodifv','m130zhm040y279a18al00_nodifv', $
 	      'm140zhm040y279a18al00_nodifv','m150zhm040y279a18al00_nodifv', $
 	      'm160zhm040y279a18al00_nodifv','m170zhm040y279a18al00_nodifv', $
 	      'm180zhm040y279a18al00_nodifv','m190zhm040y279a18al00_nodifv', $
 	      'm200zhm040y279a18al00_nodifv','m210zhm040y279a18al00_nodifv', $
 	      'm220zhm040y279a18al00_nodifv','m230zhm040y279a18al00_nodifv', $
 	      'm240zhm040y279a18al00_nodifv','m250zhm040y279a18al00_nodifv', $
 	      'm260zhm040y279a18al00_nodifv' $

 
            ]

    outfile= 'HeEffects'
    outtext=''
    textperrun=[ 'm060']
if gtype eq 'Tracknopms' then begin
    xmin=4.15;
    xmax=3.5;3.640 ;
    ymin=-0.8;.26;
    ymax=2.0;1.8;
endif
endif


if type eq 'HeEffectstest' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
; 	      'm110zhm040y249a18al00_nodifv', 'm110zhm040y264a18al00_nodifv', 'm110zhm040y279a18al00_nodifv', $
; 	      'm110zhm000y249a18al00_nodifv', 'm110zhm000y264a18al00_nodifv', 'm110zhm000y279a18al00_nodifv', $
              'm105zhm000y279a18al00_nodifv' $



 
            ]

    outfile= 'HeEffectstest'
    outtext=''
    textperrun=[ 'y249', 'y264', 'y279','sy249', 'sy264', 'sy279', 'm105']
if gtype eq 'Tracknopms' then begin
    xmin=4.15;
    xmax=3.5;3.640 ;
    ymin=-0.5;.26;
    ymax=1.5;1.8;
endif
endif

if type eq 'Garretttest' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out2/'
    infiles=[ $
;'m110zhm060y265a17al00_cknodf', 'm120zhm060y265a17al00_cknodf', 'm130zhm060y265a17al00_cknodf', 'm140zhm060y265a17al00_cknodf', 
'm110zhm040y265a17al00_cknodf', 'm120zhm040y265a17al00_cknodf', 'm130zhm040y265a17al00_cknodf', 'm140zhm040y265a17al00_cknodf',$
 'm110zhm020y265a17al00_cknodf', 'm120zhm020y265a17al00_cknodf' ,'m130zhm020y265a17al00_cknodf', 'm140zhm020y265a17al00_cknodf' $ 

;'m110zhm000y265a17al00_cknodf', 'm120zhm000y265a17al00_cknodf', 'm130zhm000y265a17al00_cknodf', 'm140zhm000y265a17al00_cknodf'$ 
            ]

    outfile= 'Garretttest'
    outtext=''
    textperrun=[ $;'1.1m.6', '1.2m.6', '1.3m.6','1.4m.6',
'1.1m.4', '1.2m.4', '1.3m.4','1.4m.4',$
'1.1m.2', '1.2m.2', '1.3m.2','1.4m.2' $;,
;'1.1m.0', '1.2m.0', '1.3m.0','1.4m.0' $
]
if gtype eq 'Tracknopms' then begin
    xmin=3.8;
    xmax=3.5;3.640 ;
    ymin=1.2;.26;
    ymax=2.4;1.8;
endif
endif

if type eq 'massoffset' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
 	       'm120zhp020y265a17al00_grnodf', 'm130zhp020y265a17al00_grnodf', $
 	      'm140zhp020y265a17al00_grnodf', 'm150zhp020y265a17al00_grnodf', 'm160zhp020y265a17al00_grnodf', $
              'm170zhp020y265a17al00_grnodf',  'm120zhp020y265a22al00_grnodf', 'm130zhp020y265a22al00_grnodf', $
 	      'm140zhp020y265a22al00_grnodf', 'm150zhp020y265a22al00_grnodf', 'm160zhp020y265a22al00_grnodf', $
              'm170zhp020y265a22al00_grnodf', 'm110zhp020y265a17al00_grnodf','m110zhp020y265a12al00_grnodf','m110zhp020y265a22al00_grnodf' $



 
            ]

    outfile= 'massoffset'
    outtext=''
    textperrun=[ '1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7','1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7', '1.1']
if gtype eq 'Tracklin' then begin
    xmin=5000;
    xmax=4600;3.640 ;
    ymin=1.0;.26;
    ymax=2.0;1.8;
endif
endif

if type eq 'c1213grid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
	      'm080zhm000y265a17al00_grnodf','m090zhm000y265a17al00_grnodf', 'm100zhm000y265a17al00_grnodf', $
 	      'm110zhm000y265a17al00_grnodf','m120zhm000y265a17al00_grnodf', 'm130zhm000y265a17al00_grnodf', $
 	      'm140zhm000y265a17al00_grnodf', 'm150zhm000y265a17al00_grnodf', 'm160zhm000y265a17al00_grnodf', $
              'm170zhm000y265a17al00_grnodf', 'm180zhm000y265a17al00_grnodf', 'm190zhm000y265a17al00_grnodf', $
              'm200zhm000y265a17al00_grnodf', $
	      'm080zhm080y265a17al00_grnodf','m090zhm080y265a17al00_grnodf', 'm100zhm080y265a17al00_grnodf', $
 	      'm110zhm080y265a17al00_grnodf','m120zhm080y265a17al00_grnodf', 'm130zhm080y265a17al00_grnodf', $
 	      'm140zhm080y265a17al00_grnodf', 'm150zhm080y265a17al00_grnodf', 'm160zhm080y265a17al00_grnodf', $
              'm170zhm080y265a17al00_grnodf', 'm180zhm080y265a17al00_grnodf', 'm190zhm080y265a17al00_grnodf', $
              'm200zhm080y265a17al00_grnodf', $
	      'm080zhp040y265a17al00_grnodf','m090zhp040y265a17al00_grnodf', 'm100zhp040y265a17al00_grnodf', $
 	      'm110zhp040y265a17al00_grnodf','m120zhp040y265a17al00_grnodf', 'm130zhp040y265a17al00_grnodf', $
 	      'm140zhp040y265a17al00_grnodf', 'm150zhp040y265a17al00_grnodf', 'm160zhp040y265a17al00_grnodf', $
              'm170zhp040y265a17al00_grnodf', 'm180zhp040y265a17al00_grnodf', 'm190zhp040y265a17al00_grnodf', $
              'm200zhp040y265a17al00_grnodf'$





 
            ]

    outfile= 'C1213grid'
    outtext=''
    textperrun=[ '0.8', '0.9', '1.0', '1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7', '1.8', '1.9','2.0',  '0.8', '0.9', '1.0', '1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7', '1.8', '1.9','2.0', '0.8', '0.9', '1.0', '1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7', '1.8', '1.9','2.0'];,'1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7', '1.1']
if gtype eq 'Tracklin' then begin
    xmin=5000;
    xmax=4600;3.640 ;
    ymin=1.0;.26;
    ymax=2.0;1.8;
endif
if gtype eq 'CN' then begin
    xmin=2.0
    xmax=0.8
    ymin=-1.0
    ymax=0.3
endif

endif

if type eq 'feh00grid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
 	      'm080zhm000y265a17al00_grnodf','m090zhm000y265a17al00_grnodf', 'm100zhm000y265a17al00_grnodf', $
 	      'm110zhm000y265a17al00_grnodf','m120zhm000y265a17al00_grnodf', 'm130zhm000y265a17al00_grnodf', $
 	      'm140zhm000y265a17al00_grnodf', 'm150zhm000y265a17al00_grnodf', 'm160zhm000y265a17al00_grnodf', $
              'm170zhm000y265a17al00_grnodf'$



 
            ]

    outfile= 'feh00grid'
    outtext=''
    textperrun=[ '0.8', '0.9', '1.0','1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7']
if gtype eq 'Tracklin' then begin
    xmin=5000;
    xmax=4600;3.640 ;
    ymin=1.0;.26;
    ymax=2.0;1.8;
endif
endif

if type eq 'fehp04grid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
 	      'm080zhp040y265a17al00_grnodf','m090zhp040y265a17al00_grnodf', 'm100zhp040y265a17al00_grnodf', $
 	      'm110zhp040y265a17al00_grnodf','m120zhp040y265a17al00_grnodf', 'm130zhp040y265a17al00_grnodf', $
 	      'm140zhp040y265a17al00_grnodf', 'm150zhp040y265a17al00_grnodf', 'm160zhp040y265a17al00_grnodf', $
              'm170zhp040y265a17al00_grnodf'$



 
            ]

    outfile= 'fehp04grid'
    outtext=''
    textperrun=[ '0.8', '0.9', '1.0','1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7']
if gtype eq 'Tracklin' then begin
    xmin=5000;
    xmax=4600;3.640 ;
    ymin=1.0;.26;
    ymax=2.0;1.8;
endif
endif


if type eq 'mlgrid' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
 	      'm080zhm040y265a12al00_grnodf','m080zhm040y265a17al00_grnodf', 'm080zhm040y265a22al00_grnodf', $
 	      'm080zhm000y265a12al00_grnodf','m080zhm000y265a17al00_grnodf', 'm080zhm000y265a22al00_grnodf', $
 	      'm100zhm000y265a12al00_grnodf','m100zhm000y265a17al00_grnodf', 'm100zhm000y265a22al00_grnodf' $




 
            ]

    outfile= 'mlgrid'
    outtext=''
    textperrun=[ '0.8m0412', '0.8m0417', '0.8m0422','0.8m0012', '0.8m0017', '0.8m0022', '1.0m0012', '1.0m0017', '0.8m0022']
if gtype eq 'Tracklin' then begin
    xmin=5000;
    xmax=4600;3.640 ;
    ymin=1.0;.26;
    ymax=2.0;1.8;
endif
endif

if type eq 'checkloops' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
 	      'm210zhm200y265a17al00_grnodf','m210zhm160y265a17al00_grnodf', 'm210zhm120y265a17al00_grnodf', $
 	      'm220zhm200y265a17al00_grnodf','m220zhm160y265a17al00_grnodf', 'm220zhm120y265a17al00_grnodf', $
	      'm230zhm200y265a17al00_grnodf','m230zhm160y265a17al00_grnodf', 'm230zhm120y265a17al00_grnodf' $

            ]

    outfile= 'checkloops'
    outtext=''
    textperrun=[ '21m2', '21m16', '21m12','22m2', '22m16', '22m12', '23m2', '23m16', '23m12']
if gtype eq 'Track' then begin
    xmin=3.9;
    xmax=3.69 ;
    ymin=1.0;.26;
    ymax=2.5;1.8;
endif
endif

if type eq 'checkhe' then begin
;Testing varying mass
    datadirectory= ''
    infiles=[ $
 	      '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/m090zhm040y265a17al04_grnodf' ,'~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/m090zhm080y250a17al04_grnodf', '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m090fhm080y239a17al04_grnodf'$
            ]

    outfile= 'checkhe'
    outtext=''
    textperrun=[ 'y265', 'y250', 'zuul']
if gtype eq 'Tracklin' then begin
    xmin=5500;
    xmax=4000 ;
    ymin=0.5;.26;
    ymax=2.0;1.8;
endif
endif

if type eq 'checkm4' then begin
;Testing varying mass
    datadirectory= ''
    infiles=[ $
; 	      '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/m090zhm040y265a17al04_grnodf' ,'~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/m090zhm080y250a17al04_grnodf', 
 '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m090fhm120y273a17al04_grnodf','/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m090fhm100y273a17al04_grnodf', $
'/data/zuul/0/tayar/YRECgrid/nodiff_out4z/m090fhm100y239a17al04_grnodf'$
            ]

    outfile= 'checkm4'
    outtext=''
    textperrun=[  'zuul12','zuul10','zuul10_39'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=5500;
    xmax=4000 ;
    ymin=0.5;.26;
    ymax=2.0;1.8;
endif
endif


if type eq 'checkstep09' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm090fhp040y273a17al00_grnodf','m090fhp020y273a17al00_grnodf','m090fhm000y273a17al00_grnodf', $
  'm090fhm020y273a17al00_grnodf','m090fhm040y273a17al00_grnodf','m090fhm060y273a17al00_grnodf', $
  'm090fhm080y273a17al00_grnodf','m090fhm100y273a17al00_grnodf','m090fhm120y273a17al00_grnodf', $
  'm090fhm140y273a17al00_grnodf','m090fhm160y273a17al00_grnodf','m090fhm180y273a17al00_grnodf', $
  'm090fhm200y273a17al00_grnodf' $
            ]

    outfile= 'checkstep09'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif


if type eq 'checkstepSolar' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm140fhm000y273a17al02_grnodf','m150fhm000y273a17al02_grnodf','m160fhm000y273a17al02_grnodf', $
  'm170fhm000y273a17al02_grnodf','m180fhm000y273a17al02_grnodf','m190fhm000y273a17al02_grnodf', $
  'm200fhm000y273a17al02_grnodf','m210fhm000y273a17al02_grnodf','m220fhm000y273a17al02_grnodf', $
  'm230fhm000y273a17al02_grnodf','m240fhm000y273a17al02_grnodf','m250fhm000y273a17al02_grnodf', $
  'm260fhm000y273a17al02_grnodf' $
            ]

    outfile= 'checkstep09p02'
    outtext=''
    textperrun=[  '1.4', '1.5', '1.6', '1.7', '1.8', '1.9', '2.0', '2.1', '2.2', '2.3', '2.4', '2.5', '2.6'] ;'y265', 'y250',
if gtype eq 'TeffLogg' then begin
    xmin=4500;
    xmax=3000 ;
    ymin=2.5;.26;
    ymax=-0.5;1.8;
endif
if gtype eq 'Tracklin' then begin
    xmin=4500;
    xmax=3000 ;
    ymin=2.5;.26;
    ymax=-0.5;1.8;
endif
endif


if type eq 'movebump' then begin
;Testing varying mass
    datadirectory=  '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/';'/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm090fhm040y273a17al00_grnodf','m100fhm040y273a17al00_grnodf','m080fhm040y273a17al00_grnodf', $
  'm090fhm040y273a17al02_grnodf','m090fhm040y273a17al04_grnodf','m090fhm040y239a17al00_grnodf', $
  'm090fhm040y290a17al00_grnodf','m090fhm040y273a12al00_grnodf','m090fhm040y273a22al00_grnodf', $
  'm090fhm060y273a17al00_grnodf','m090fhm020y273a17al00_grnodf' $
            ]

    outfile= 'movebump'
    outtext=''
    textperrun=[  '0.9Solar', '1.0Msun', '0.8Msun', 'al/fe+0.2', 'al/fe+0.4', 'He.239', 'He.290', 'ML12', 'ML22', 'feh-0.6', 'feh-020'] ;'y265', 'y250',
if gtype eq 'TeffLogg' then begin
    xmin=4600;
    xmax=4300 ;
    ymin=3.0;.26;
    ymax=2.0;1.8;
endif
if gtype eq 'He3Logg' then begin
    xmin=3.7;
    xmax=1.0 ;
    ymin=0.001;.26;
    ymax=0.0023;1.8;
endif

if gtype eq 'Tracklin' then begin
    xmin=4500;
    xmax=3000 ;
    ymin=2.5;.26;
    ymax=-0.5;1.8;
endif
endif

if type eq 'checkstep09p02' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm090fhp040y273a17al02_grnodf','m090fhp020y273a17al02_grnodf','m090fhm000y273a17al02_grnodf', $
  'm090fhm020y273a17al02_grnodf','m090fhm040y273a17al02_grnodf','m090fhm060y273a17al02_grnodf', $
  'm090fhm080y273a17al02_grnodf','m090fhm100y273a17al02_grnodf','m090fhm120y273a17al02_grnodf', $
  'm090fhm140y273a17al02_grnodf','m090fhm160y273a17al02_grnodf','m090fhm180y273a17al02_grnodf', $
  'm090fhm200y273a17al02_grnodf' $
            ]

    outfile= 'checkstep09p02'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif

if type eq 'checkstep09p04' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm090fhp020y273a17al04_grnodf','m090fhm000y273a17al04_grnodf', $
  'm090fhm020y273a17al04_grnodf','m090fhm040y273a17al04_grnodf','m090fhm060y273a17al04_grnodf', $
  'm090fhm080y273a17al04_grnodf','m090fhm100y273a17al04_grnodf','m090fhm120y273a17al04_grnodf', $
  'm090fhm140y273a17al04_grnodf','m090fhm160y273a17al04_grnodf','m090fhm180y273a17al04_grnodf', $
  'm090fhm200y273a17al04_grnodf' $
            ]

    outfile= 'checkstep09p04'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif

if type eq 'checkstep10' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm100fhp040y273a17al00_grnodf','m100fhp020y273a17al00_grnodf','m100fhm000y273a17al00_grnodf', $
  'm100fhm020y273a17al00_grnodf','m100fhm040y273a17al00_grnodf','m100fhm060y273a17al00_grnodf', $
  'm100fhm080y273a17al00_grnodf','m100fhm100y273a17al00_grnodf','m100fhm120y273a17al00_grnodf', $
  'm100fhm140y273a17al00_grnodf','m100fhm160y273a17al00_grnodf','m100fhm180y273a17al00_grnodf', $
  'm100fhm200y273a17al00_grnodf', $
  'm100fhp040y273a17al02_grnodf','m100fhp020y273a17al02_grnodf','m100fhm000y273a17al02_grnodf', $
  'm100fhm020y273a17al02_grnodf','m100fhm040y273a17al02_grnodf','m100fhm060y273a17al02_grnodf', $
  'm100fhm080y273a17al02_grnodf','m100fhm100y273a17al02_grnodf','m100fhm120y273a17al02_grnodf', $
  'm100fhm140y273a17al02_grnodf','m100fhm160y273a17al02_grnodf','m100fhm180y273a17al02_grnodf', $
  'm100fhm200y273a17al02_grnodf', $
  'm100fhp020y273a17al04_grnodf','m100fhm000y273a17al04_grnodf', $
  'm100fhm020y273a17al04_grnodf','m100fhm040y273a17al04_grnodf','m100fhm060y273a17al04_grnodf', $
  'm100fhm080y273a17al04_grnodf','m100fhm100y273a17al04_grnodf','m100fhm120y273a17al04_grnodf', $
  'm100fhm140y273a17al04_grnodf','m100fhm160y273a17al04_grnodf','m100fhm180y273a17al04_grnodf', $
  'm100fhm200y273a17al04_grnodf' $

            ]

    outfile= 'checkstep10'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif


if type eq 'FullGridmassZ' then begin
;Testing varying mass
    datadirectory= '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/';'/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm060fhp040y273a17al00_grnodf','m060fhp020y273a17al00_grnodf','m060fhm000y273a17al00_grnodf', $
  'm060fhm020y273a17al00_grnodf','m060fhm040y273a17al00_grnodf','m060fhm060y273a17al00_grnodf', $
  'm060fhm080y273a17al00_grnodf','m060fhm100y273a17al00_grnodf','m060fhm120y273a17al00_grnodf', $
  'm060fhm140y273a17al00_grnodf','m060fhm160y273a17al00_grnodf','m060fhm180y273a17al00_grnodf', $
  'm060fhm200y273a17al00_grnodf', $
  'm070fhp040y273a17al00_grnodf','m070fhp020y273a17al00_grnodf','m070fhm000y273a17al00_grnodf', $
  'm070fhm020y273a17al00_grnodf','m070fhm040y273a17al00_grnodf','m070fhm060y273a17al00_grnodf', $
  'm070fhm080y273a17al00_grnodf','m070fhm100y273a17al00_grnodf','m070fhm120y273a17al00_grnodf', $
  'm070fhm140y273a17al00_grnodf','m070fhm160y273a17al00_grnodf','m070fhm180y273a17al00_grnodf', $
  'm070fhm200y273a17al00_grnodf', $
  'm080fhp040y273a17al00_grnodf','m080fhp020y273a17al00_grnodf','m080fhm000y273a17al00_grnodf', $
  'm080fhm020y273a17al00_grnodf','m080fhm040y273a17al00_grnodf','m080fhm060y273a17al00_grnodf', $
  'm080fhm080y273a17al00_grnodf','m080fhm100y273a17al00_grnodf','m080fhm120y273a17al00_grnodf', $
  'm080fhm140y273a17al00_grnodf','m080fhm160y273a17al00_grnodf','m080fhm180y273a17al00_grnodf', $
  'm080fhm200y273a17al00_grnodf', $
  'm090fhp040y273a17al00_grnodf','m090fhp020y273a17al00_grnodf','m090fhm000y273a17al00_grnodf', $
  'm090fhm020y273a17al00_grnodf','m090fhm040y273a17al00_grnodf','m090fhm060y273a17al00_grnodf', $
  'm090fhm080y273a17al00_grnodf','m090fhm100y273a17al00_grnodf','m090fhm120y273a17al00_grnodf', $
  'm090fhm140y273a17al00_grnodf','m090fhm160y273a17al00_grnodf','m090fhm180y273a17al00_grnodf', $
  'm090fhm200y273a17al00_grnodf', $
  'm100fhp040y273a17al00_grnodf','m100fhp020y273a17al00_grnodf','m100fhm000y273a17al00_grnodf', $
  'm100fhm020y273a17al00_grnodf','m100fhm040y273a17al00_grnodf','m100fhm060y273a17al00_grnodf', $
  'm100fhm080y273a17al00_grnodf','m100fhm100y273a17al00_grnodf','m100fhm120y273a17al00_grnodf', $
  'm100fhm140y273a17al00_grnodf','m100fhm160y273a17al00_grnodf','m100fhm180y273a17al00_grnodf', $
  'm100fhm200y273a17al00_grnodf', $
  'm110fhp040y273a17al00_grnodf','m110fhp020y273a17al00_grnodf','m110fhm000y273a17al00_grnodf', $
  'm110fhm020y273a17al00_grnodf','m110fhm040y273a17al00_grnodf','m110fhm060y273a17al00_grnodf', $
  'm110fhm080y273a17al00_grnodf','m110fhm100y273a17al00_grnodf','m110fhm120y273a17al00_grnodf', $
  'm110fhm140y273a17al00_grnodf','m110fhm160y273a17al00_grnodf','m110fhm180y273a17al00_grnodf', $
  'm110fhm200y273a17al00_grnodf', $
  'm120fhp040y273a17al00_grnodf','m120fhp020y273a17al00_grnodf','m120fhm000y273a17al00_grnodf', $
  'm120fhm020y273a17al00_grnodf','m120fhm040y273a17al00_grnodf','m120fhm060y273a17al00_grnodf', $
  'm120fhm080y273a17al00_grnodf','m120fhm100y273a17al00_grnodf','m120fhm120y273a17al00_grnodf', $
  'm120fhm140y273a17al00_grnodf','m120fhm160y273a17al00_grnodf','m120fhm180y273a17al00_grnodf', $
  'm120fhm200y273a17al00_grnodf', $
  'm130fhp040y273a17al00_grnodf','m130fhp020y273a17al00_grnodf','m130fhm000y273a17al00_grnodf', $
  'm130fhm020y273a17al00_grnodf','m130fhm040y273a17al00_grnodf','m130fhm060y273a17al00_grnodf', $
  'm130fhm080y273a17al00_grnodf','m130fhm100y273a17al00_grnodf','m130fhm120y273a17al00_grnodf', $
  'm130fhm140y273a17al00_grnodf','m130fhm160y273a17al00_grnodf','m130fhm180y273a17al00_grnodf', $
  'm130fhm200y273a17al00_grnodf', $
  'm140fhp040y273a17al00_grnodf','m140fhp020y273a17al00_grnodf','m140fhm000y273a17al00_grnodf', $
  'm140fhm020y273a17al00_grnodf','m140fhm040y273a17al00_grnodf','m140fhm060y273a17al00_grnodf', $
  'm140fhm080y273a17al00_grnodf','m140fhm100y273a17al00_grnodf','m140fhm120y273a17al00_grnodf', $
  'm140fhm140y273a17al00_grnodf','m140fhm160y273a17al00_grnodf','m140fhm180y273a17al00_grnodf', $
  'm140fhm200y273a17al00_grnodf', $
  'm150fhp040y273a17al00_grnodf','m150fhp020y273a17al00_grnodf','m150fhm000y273a17al00_grnodf', $
  'm150fhm020y273a17al00_grnodf','m150fhm040y273a17al00_grnodf','m150fhm060y273a17al00_grnodf', $
  'm150fhm080y273a17al00_grnodf','m150fhm100y273a17al00_grnodf','m150fhm120y273a17al00_grnodf', $
  'm150fhm140y273a17al00_grnodf','m150fhm160y273a17al00_grnodf','m150fhm180y273a17al00_grnodf', $
  'm150fhm200y273a17al00_grnodf', $
  'm160fhp040y273a17al00_grnodf','m160fhp020y273a17al00_grnodf','m160fhm000y273a17al00_grnodf', $
  'm160fhm020y273a17al00_grnodf','m160fhm040y273a17al00_grnodf','m160fhm060y273a17al00_grnodf', $
  'm160fhm080y273a17al00_grnodf','m160fhm100y273a17al00_grnodf','m160fhm120y273a17al00_grnodf', $
  'm160fhm140y273a17al00_grnodf','m160fhm160y273a17al00_grnodf','m160fhm180y273a17al00_grnodf', $
  'm160fhm200y273a17al00_grnodf', $
  'm170fhp040y273a17al00_grnodf','m170fhp020y273a17al00_grnodf','m170fhm000y273a17al00_grnodf', $
  'm170fhm020y273a17al00_grnodf','m170fhm040y273a17al00_grnodf','m170fhm060y273a17al00_grnodf', $
  'm170fhm080y273a17al00_grnodf','m170fhm100y273a17al00_grnodf','m170fhm120y273a17al00_grnodf', $
  'm170fhm140y273a17al00_grnodf','m170fhm160y273a17al00_grnodf','m170fhm180y273a17al00_grnodf', $
  'm170fhm200y273a17al00_grnodf', $
  'm180fhp040y273a17al00_grnodf','m180fhp020y273a17al00_grnodf','m180fhm000y273a17al00_grnodf', $
  'm180fhm020y273a17al00_grnodf','m180fhm040y273a17al00_grnodf','m180fhm060y273a17al00_grnodf', $
  'm180fhm080y273a17al00_grnodf','m180fhm100y273a17al00_grnodf','m180fhm120y273a17al00_grnodf', $
  'm180fhm140y273a17al00_grnodf','m180fhm160y273a17al00_grnodf','m180fhm180y273a17al00_grnodf', $
  'm180fhm200y273a17al00_grnodf', $
  'm190fhp040y273a17al00_grnodf','m190fhp020y273a17al00_grnodf','m190fhm000y273a17al00_grnodf', $
  'm190fhm020y273a17al00_grnodf','m190fhm040y273a17al00_grnodf','m190fhm060y273a17al00_grnodf', $
  'm190fhm080y273a17al00_grnodf','m190fhm100y273a17al00_grnodf','m190fhm120y273a17al00_grnodf', $
  'm190fhm140y273a17al00_grnodf','m190fhm160y273a17al00_grnodf','m190fhm180y273a17al00_grnodf', $
  'm190fhm200y273a17al00_grnodf', $
  'm200fhp040y273a17al00_grnodf','m200fhp020y273a17al00_grnodf','m200fhm000y273a17al00_grnodf', $
  'm200fhm020y273a17al00_grnodf','m200fhm040y273a17al00_grnodf','m200fhm060y273a17al00_grnodf', $
  'm200fhm080y273a17al00_grnodf','m200fhm100y273a17al00_grnodf','m200fhm120y273a17al00_grnodf', $
  'm200fhm140y273a17al00_grnodf','m200fhm160y273a17al00_grnodf','m200fhm180y273a17al00_grnodf', $
  'm200fhm200y273a17al00_grnodf', $
  'm210fhp040y273a17al00_grnodf','m210fhp020y273a17al00_grnodf','m210fhm000y273a17al00_grnodf', $
  'm210fhm020y273a17al00_grnodf','m210fhm040y273a17al00_grnodf','m210fhm060y273a17al00_grnodf', $
  'm210fhm080y273a17al00_grnodf','m210fhm100y273a17al00_grnodf','m210fhm120y273a17al00_grnodf', $
  'm210fhm140y273a17al00_grnodf','m210fhm160y273a17al00_grnodf','m210fhm180y273a17al00_grnodf', $
  'm210fhm200y273a17al00_grnodf', $
  'm220fhp040y273a17al00_grnodf','m220fhp020y273a17al00_grnodf','m220fhm000y273a17al00_grnodf', $
  'm220fhm020y273a17al00_grnodf','m220fhm040y273a17al00_grnodf','m220fhm060y273a17al00_grnodf', $
  'm220fhm080y273a17al00_grnodf','m220fhm100y273a17al00_grnodf','m220fhm120y273a17al00_grnodf', $
  'm220fhm140y273a17al00_grnodf','m220fhm160y273a17al00_grnodf','m220fhm180y273a17al00_grnodf', $
  'm220fhm200y273a17al00_grnodf', $
  'm230fhp040y273a17al00_grnodf','m230fhp020y273a17al00_grnodf','m230fhm000y273a17al00_grnodf', $
  'm230fhm020y273a17al00_grnodf','m230fhm040y273a17al00_grnodf','m230fhm060y273a17al00_grnodf', $
  'm230fhm080y273a17al00_grnodf','m230fhm100y273a17al00_grnodf','m230fhm120y273a17al00_grnodf', $
  'm230fhm140y273a17al00_grnodf','m230fhm160y273a17al00_grnodf','m230fhm180y273a17al00_grnodf', $
  'm230fhm200y273a17al00_grnodf', $
  'm240fhp040y273a17al00_grnodf','m240fhp020y273a17al00_grnodf','m240fhm000y273a17al00_grnodf', $
  'm240fhm020y273a17al00_grnodf','m240fhm040y273a17al00_grnodf','m240fhm060y273a17al00_grnodf', $
  'm240fhm080y273a17al00_grnodf','m240fhm100y273a17al00_grnodf','m240fhm120y273a17al00_grnodf', $
  'm240fhm140y273a17al00_grnodf','m240fhm160y273a17al00_grnodf','m240fhm180y273a17al00_grnodf', $
  'm240fhm200y273a17al00_grnodf', $
  'm250fhp040y273a17al00_grnodf','m250fhp020y273a17al00_grnodf','m250fhm000y273a17al00_grnodf', $
  'm250fhm020y273a17al00_grnodf','m250fhm040y273a17al00_grnodf','m250fhm060y273a17al00_grnodf', $
  'm250fhm080y273a17al00_grnodf','m250fhm100y273a17al00_grnodf','m250fhm120y273a17al00_grnodf', $
  'm250fhm140y273a17al00_grnodf','m250fhm160y273a17al00_grnodf','m250fhm180y273a17al00_grnodf', $
  'm250fhm200y273a17al00_grnodf', $
  'm260fhp040y273a17al00_grnodf','m260fhp020y273a17al00_grnodf','m260fhm000y273a17al00_grnodf', $
  'm260fhm020y273a17al00_grnodf','m260fhm040y273a17al00_grnodf','m260fhm060y273a17al00_grnodf', $
  'm260fhm080y273a17al00_grnodf','m260fhm100y273a17al00_grnodf','m260fhm120y273a17al00_grnodf', $
  'm260fhm140y273a17al00_grnodf','m260fhm160y273a17al00_grnodf','m260fhm180y273a17al00_grnodf', $
  'm260fhm200y273a17al00_grnodf' $
            ]

    outfile= 'fullgridmassZ'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',

if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif


if type eq 'FullGridmassZhighmz' then begin
;Testing varying mass
    datadirectory= '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/';'/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm250fhp040y273a17al00_grnodf','m250fhp020y273a17al00_grnodf','m250fhm000y273a17al00_grnodf', $
  'm250fhm020y273a17al00_grnodf','m250fhm040y273a17al00_grnodf','m250fhm060y273a17al00_grnodf', $
  'm250fhm080y273a17al00_grnodf','m250fhm100y273a17al00_grnodf','m250fhm120y273a17al00_grnodf', $
  'm250fhm140y273a17al00_grnodf','m250fhm160y273a17al00_grnodf','m250fhm180y273a17al00_grnodf', $
  'm250fhm200y273a17al00_grnodf', $
  'm260fhp040y273a17al00_grnodf','m260fhp020y273a17al00_grnodf','m260fhm000y273a17al00_grnodf', $
  'm260fhm020y273a17al00_grnodf','m260fhm040y273a17al00_grnodf','m260fhm060y273a17al00_grnodf', $
  'm260fhm080y273a17al00_grnodf','m260fhm100y273a17al00_grnodf','m260fhm120y273a17al00_grnodf', $
  'm260fhm140y273a17al00_grnodf','m260fhm160y273a17al00_grnodf','m260fhm180y273a17al00_grnodf', $
  'm260fhm200y273a17al00_grnodf' $
            ]

    outfile= 'fullgridmzhighmz'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20', 'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',

if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif



if type eq 'checkstep13' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm130fhp040y273a17al00_grnodf','m130fhp020y273a17al00_grnodf','m130fhm000y273a17al00_grnodf', $
  'm130fhm020y273a17al00_grnodf','m130fhm040y273a17al00_grnodf','m130fhm060y273a17al00_grnodf', $
  'm130fhm080y273a17al00_grnodf','m130fhm100y273a17al00_grnodf','m130fhm120y273a17al00_grnodf', $
  'm130fhm140y273a17al00_grnodf','m130fhm160y273a17al00_grnodf','m130fhm180y273a17al00_grnodf', $
  'm130fhm200y273a17al00_grnodf', $
  'm130fhp040y273a17al02_grnodf','m130fhp020y273a17al02_grnodf','m130fhm000y273a17al02_grnodf', $
  'm130fhm020y273a17al02_grnodf','m130fhm040y273a17al02_grnodf','m130fhm060y273a17al02_grnodf', $
  'm130fhm080y273a17al02_grnodf','m130fhm100y273a17al02_grnodf','m130fhm120y273a17al02_grnodf', $
  'm130fhm140y273a17al02_grnodf','m130fhm160y273a17al02_grnodf','m130fhm180y273a17al02_grnodf', $
  'm130fhm200y273a17al02_grnodf', $
  'm130fhp020y273a17al04_grnodf','m130fhm000y273a17al04_grnodf', $
  'm130fhm020y273a17al04_grnodf','m130fhm040y273a17al04_grnodf','m130fhm060y273a17al04_grnodf', $
  'm130fhm080y273a17al04_grnodf','m130fhm100y273a17al04_grnodf','m130fhm120y273a17al04_grnodf', $
  'm130fhm140y273a17al04_grnodf','m130fhm160y273a17al04_grnodf','m130fhm180y273a17al04_grnodf', $
  'm130fhm200y273a17al04_grnodf' $

            ]

    outfile= 'checkstep13'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif

if type eq 'checkstep16' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm160fhp040y273a17al00_grnodf','m160fhp020y273a17al00_grnodf','m160fhm000y273a17al00_grnodf', $
  'm160fhm020y273a17al00_grnodf','m160fhm040y273a17al00_grnodf','m160fhm060y273a17al00_grnodf', $
  'm160fhm080y273a17al00_grnodf','m160fhm100y273a17al00_grnodf','m160fhm120y273a17al00_grnodf', $
  'm160fhm140y273a17al00_grnodf','m160fhm160y273a17al00_grnodf','m160fhm180y273a17al00_grnodf', $
  'm160fhm200y273a17al00_grnodf', $
  'm160fhp040y273a17al02_grnodf','m160fhp020y273a17al02_grnodf','m160fhm000y273a17al02_grnodf', $
  'm160fhm020y273a17al02_grnodf','m160fhm040y273a17al02_grnodf','m160fhm060y273a17al02_grnodf', $
  'm160fhm080y273a17al02_grnodf','m160fhm100y273a17al02_grnodf','m160fhm120y273a17al02_grnodf', $
  'm160fhm140y273a17al02_grnodf','m160fhm160y273a17al02_grnodf','m160fhm180y273a17al02_grnodf', $
  'm160fhm200y273a17al02_grnodf', $
  'm160fhp020y273a17al04_grnodf','m160fhm000y273a17al04_grnodf', $
  'm160fhm020y273a17al04_grnodf','m160fhm040y273a17al04_grnodf','m160fhm060y273a17al04_grnodf', $
  'm160fhm080y273a17al04_grnodf','m160fhm100y273a17al04_grnodf','m160fhm120y273a17al04_grnodf', $
  'm160fhm140y273a17al04_grnodf','m160fhm160y273a17al04_grnodf','m160fhm180y273a17al04_grnodf', $
  'm160fhm200y273a17al04_grnodf' $

            ]

    outfile= 'checkstep16'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif

if type eq 'checkstep19' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm190fhp040y273a17al00_grnodf','m190fhp020y273a17al00_grnodf','m190fhm000y273a17al00_grnodf', $
  'm190fhm020y273a17al00_grnodf','m190fhm040y273a17al00_grnodf','m190fhm060y273a17al00_grnodf', $
  'm190fhm080y273a17al00_grnodf','m190fhm100y273a17al00_grnodf','m190fhm120y273a17al00_grnodf', $
  'm190fhm140y273a17al00_grnodf','m190fhm160y273a17al00_grnodf','m190fhm180y273a17al00_grnodf', $
  'm190fhm200y273a17al00_grnodf', $
  'm190fhp040y273a17al02_grnodf','m190fhp020y273a17al02_grnodf','m190fhm000y273a17al02_grnodf', $
  'm190fhm020y273a17al02_grnodf','m190fhm040y273a17al02_grnodf','m190fhm060y273a17al02_grnodf', $
  'm190fhm080y273a17al02_grnodf','m190fhm100y273a17al02_grnodf','m190fhm120y273a17al02_grnodf', $
  'm190fhm140y273a17al02_grnodf','m190fhm160y273a17al02_grnodf','m190fhm180y273a17al02_grnodf', $
  'm190fhm200y273a17al02_grnodf', $
  'm190fhp020y273a17al04_grnodf','m190fhm000y273a17al04_grnodf', $
  'm190fhm020y273a17al04_grnodf','m190fhm040y273a17al04_grnodf','m190fhm060y273a17al04_grnodf', $
  'm190fhm080y273a17al04_grnodf','m190fhm100y273a17al04_grnodf','m190fhm120y273a17al04_grnodf', $
  'm190fhm140y273a17al04_grnodf','m190fhm160y273a17al04_grnodf','m190fhm180y273a17al04_grnodf', $
  'm190fhm200y273a17al04_grnodf' $

            ]

    outfile= 'checkstep19'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif


if type eq 'checkstep14' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm140fhp040y273a17al00_grnodf','m140fhp020y273a17al00_grnodf','m140fhm000y273a17al00_grnodf', $
  'm140fhm020y273a17al00_grnodf','m140fhm040y273a17al00_grnodf','m140fhm060y273a17al00_grnodf', $
  'm140fhm080y273a17al00_grnodf','m140fhm100y273a17al00_grnodf','m140fhm120y273a17al00_grnodf', $
  'm140fhm140y273a17al00_grnodf','m140fhm160y273a17al00_grnodf','m140fhm180y273a17al00_grnodf', $
  'm140fhm200y273a17al00_grnodf', $
  'm140fhp040y273a17al02_grnodf','m140fhp020y273a17al02_grnodf','m140fhm000y273a17al02_grnodf', $
  'm140fhm020y273a17al02_grnodf','m140fhm040y273a17al02_grnodf','m140fhm060y273a17al02_grnodf', $
  'm140fhm080y273a17al02_grnodf','m140fhm100y273a17al02_grnodf','m140fhm120y273a17al02_grnodf', $
  'm140fhm140y273a17al02_grnodf','m140fhm160y273a17al02_grnodf','m140fhm180y273a17al02_grnodf', $
  'm140fhm200y273a17al02_grnodf', $
  'm140fhp020y273a17al04_grnodf','m140fhm000y273a17al04_grnodf', $
  'm140fhm020y273a17al04_grnodf','m140fhm040y273a17al04_grnodf','m140fhm060y273a17al04_grnodf', $
  'm140fhm080y273a17al04_grnodf','m140fhm100y273a17al04_grnodf','m140fhm120y273a17al04_grnodf', $
  'm140fhm140y273a17al04_grnodf','m140fhm160y273a17al04_grnodf','m140fhm180y273a17al04_grnodf', $
  'm140fhm200y273a17al04_grnodf' $

            ]

    outfile= 'checkstep14'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif


if type eq 'checkstep22' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm220fhp040y273a17al00_grnodf','m220fhp020y273a17al00_grnodf','m220fhm000y273a17al00_grnodf', $
  'm220fhm020y273a17al00_grnodf','m220fhm040y273a17al00_grnodf','m220fhm060y273a17al00_grnodf', $
  'm220fhm080y273a17al00_grnodf','m220fhm100y273a17al00_grnodf','m220fhm120y273a17al00_grnodf', $
  'm220fhm140y273a17al00_grnodf','m220fhm160y273a17al00_grnodf','m220fhm180y273a17al00_grnodf', $
  'm220fhm200y273a17al00_grnodf', $
  'm220fhp040y273a17al02_grnodf','m220fhp020y273a17al02_grnodf','m220fhm000y273a17al02_grnodf', $
  'm220fhm020y273a17al02_grnodf','m220fhm040y273a17al02_grnodf','m220fhm060y273a17al02_grnodf', $
  'm220fhm080y273a17al02_grnodf','m220fhm100y273a17al02_grnodf','m220fhm120y273a17al02_grnodf', $
  'm220fhm140y273a17al02_grnodf','m220fhm160y273a17al02_grnodf','m220fhm180y273a17al02_grnodf', $
  'm220fhm200y273a17al02_grnodf', $
  'm220fhp020y273a17al04_grnodf','m220fhm000y273a17al04_grnodf', $
  'm220fhm020y273a17al04_grnodf','m220fhm040y273a17al04_grnodf','m220fhm060y273a17al04_grnodf', $
  'm220fhm080y273a17al04_grnodf','m220fhm100y273a17al04_grnodf','m220fhm120y273a17al04_grnodf', $
  'm220fhm140y273a17al04_grnodf','m220fhm160y273a17al04_grnodf','m220fhm180y273a17al04_grnodf', $
  'm220fhm200y273a17al04_grnodf' $

            ]

    outfile= 'checkstep22'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif

if type eq 'checkstep25' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
  'm250fhp040y273a17al00_grnodf','m250fhp020y273a17al00_grnodf','m250fhm000y273a17al00_grnodf', $
  'm250fhm020y273a17al00_grnodf','m250fhm040y273a17al00_grnodf','m250fhm060y273a17al00_grnodf', $
  'm250fhm080y273a17al00_grnodf','m250fhm100y273a17al00_grnodf','m250fhm120y273a17al00_grnodf', $
  'm250fhm140y273a17al00_grnodf','m250fhm160y273a17al00_grnodf','m250fhm180y273a17al00_grnodf', $
  'm250fhm200y273a17al00_grnodf', $
  'm250fhp040y273a17al02_grnodf','m250fhp020y273a17al02_grnodf','m250fhm000y273a17al02_grnodf', $
  'm250fhm020y273a17al02_grnodf','m250fhm040y273a17al02_grnodf','m250fhm060y273a17al02_grnodf', $
  'm250fhm080y273a17al02_grnodf','m250fhm100y273a17al02_grnodf','m250fhm120y273a17al02_grnodf', $
  'm250fhm140y273a17al02_grnodf','m250fhm160y273a17al02_grnodf','m250fhm180y273a17al02_grnodf', $
  'm250fhm200y273a17al02_grnodf', $
  'm250fhp020y273a17al04_grnodf','m250fhm000y273a17al04_grnodf', $
  'm250fhm020y273a17al04_grnodf','m250fhm040y273a17al04_grnodf','m250fhm060y273a17al04_grnodf', $
  'm250fhm080y273a17al04_grnodf','m250fhm100y273a17al04_grnodf','m250fhm120y273a17al04_grnodf', $
  'm250fhm140y273a17al04_grnodf','m250fhm160y273a17al04_grnodf','m250fhm180y273a17al04_grnodf', $
  'm250fhm200y273a17al04_grnodf' $

            ]

    outfile= 'checkstep25'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20','p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
endif


if type eq 'checkstep09old' then begin
;Testing varying mass
    datadirectory=  '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
  'm090zhp040y265a17al00_grnodf','m090zhp020y265a17al00_grnodf','m090zhm000y265a17al00_grnodf', $
  'm090zhm020y265a17al00_grnodf','m090zhm040y265a17al00_grnodf','m090zhm060y265a17al00_grnodf', $
  'm090zhm080y265a17al00_grnodf','m090zhm100y265a17al00_grnodf','m090zhm120y265a17al00_grnodf', $
  'm090zhm140y265a17al00_grnodf','m090zhm160y265a17al00_grnodf','m090zhm180y265a17al00_grnodf', $
  'm090zhm200y265a17al00_grnodf' $
            ]

    outfile= 'checkstep09old'
    outtext=''
    textperrun=[  'p04', 'p02', 'm00', 'm02', 'm04', 'm06', 'm08', 'm10', 'm12', 'm14', 'm16', 'm18', 'm20'] ;'y265', 'y250',
if gtype eq 'Tracklin' then begin
    xmin=6000;
    xmax=3500 ;
    ymin=0.0;.26;
    ymax=3.5;1.8;
endif
if gtype eq 'TeffLogg' then begin
    xmin=5000;
    xmax=4200 ;
    ymin=3.5;.26;
    ymax=1.5;1.8;
endif
endif

if type eq 'M67binary' then begin
;Testing varying mass
    datadirectory=  '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
 'm110fhm000y273a17al00_grnodf','m110fhm020y273a17al00_grnodf','m110fhp020y273a17al00_grnodf', $
 'm110fhm000y239a17al00_grnodf','m110fhm000y290a17al00_grnodf','m110fhm000y330a17al00_grnodf','m110fhm000y273a17al02_grnodf' $
 $
            ]

    outfile= 'M67binary'
    outtext=''
    textperrun=[  'SOLAR', '-0.2', '+0.2', 'Y=0.239', 'Y=0.29', 'Y=0.33', 'alpha/Fe=+0.2']
if gtype eq 'RadiusAge' then begin
    xmin=3;
    xmax=6 ;
    ymin=1.0;.26;
    ymax=1.5;1.8;
endif
endif


if type eq 'alphaenhanced' then begin
;Testing varying mass
    datadirectory=  '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
 'm090fhm040y273a17al00_grnodf','m090fhm040y273a17al02_grnodf' $
 $
            ]

    outfile= 'alphaenhance'
    outtext='[Fe/H]=-.4, M=0.90Msun, Y=.273'
    textperrun=[  'Solar', 'alpha/Fe=+0.2']
if gtype eq 'RadiusAge' then begin
    xmin=3;
    xmax=6 ;
    ymin=1.0;.26;
    ymax=1.5;1.8;
endif
if gtype eq 'Track' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=3.0
endif
endif

if type eq 'alphaenhancedz' then begin
;Testing varying mass
    datadirectory=  '~/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
    infiles=[ $
 'm090zhm040y265a17al00_grnodf','m090zhm040y265a17al02_grnodf' $
 $
            ]

    outfile= 'alphaenhanceZ'
    outtext='[Z/X]=-.4, M=0.90Msun, Y=.265'
    textperrun=[  'Solar', 'alpha/Fe=+0.2']
if gtype eq 'RadiusAge' then begin
    xmin=3;
    xmax=6 ;
    ymin=1.0;.26;
    ymax=1.5;1.8;
endif
if gtype eq 'Track' then begin
    xmin=3.8
    xmax=3.55
    ymin=-.5
    ymax=3.0
endif
endif

if type eq 'subgiantcheck' then begin
;Testing varying mass
    datadirectory=  '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/';'/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
 'm080fhm000y273a17al00_grnodf','m090fhm000y273a17al00_grnodf','m100fhm000y273a17al00_grnodf', $
 'm110fhm000y273a17al00_grnodf', 'm120fhm000y273a17al00_grnodf','m130fhm000y273a17al00_grnodf',$
 'm140fhm000y273a17al00_grnodf', 'm150fhm000y273a17al00_grnodf','m160fhm000y273a17al00_grnodf',$
 'm170fhm000y273a17al00_grnodf', 'm180fhm000y273a17al00_grnodf','m190fhm000y273a17al00_grnodf',$
 'm200fhm000y273a17al00_grnodf',$
 'm080fhm020y273a17al00_grnodf','m090fhm020y273a17al00_grnodf','m100fhm020y273a17al00_grnodf', $
 'm110fhm020y273a17al00_grnodf', 'm120fhm020y273a17al00_grnodf','m130fhm020y273a17al00_grnodf',$
 'm140fhm020y273a17al00_grnodf', 'm150fhm020y273a17al00_grnodf','m160fhm020y273a17al00_grnodf',$
 'm170fhm020y273a17al00_grnodf', 'm180fhm020y273a17al00_grnodf','m190fhm020y273a17al00_grnodf',$
 'm200fhm020y273a17al00_grnodf'$
 $
            ]

    outfile= 'subgiantcheck'
    outtext=''
    textperrun=[  '.8', '.9','1.0', '1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7', '1.8','1.9', '2.0',  '.8m2', '.9m2','1.0m2', '1.1m2', '1.2m2', '1.3m2', '1.4m2', '1.5m2', '1.6m2', '1.7m2', '1.8m2','1.9m2', '2.0m2']
if gtype eq 'TeffLogg' then begin
    xmin=5700;
    xmax=4700 ;
    ymin=4.0;.26;
    ymax=3.2;1.8;
endif
if gtype eq 'Tracknopms' then begin
     xmin=3.6
    xmax=3.45
    ymin=3.0
    ymax=3.4
endif
if gtype eq 'RTracknopms' then begin
     xmin=3.6
    xmax=3.45
    ymin=1.9
    ymax=2.3
endif

endif




if type eq 'cnmass' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhm000y273a17al00_grnodf','m200fhm000y273a17al00_grnodf'$ 
            ]

    outfile= 'cnmass'
    outtext=''
    textperrun=[  '1.0','2.0']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=2.0
    ymin=-0.8
    ymax=0.2
endif

endif

if type eq 'Limass' then begin
;Testing varying mass
    datadirectory= '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhm000y273a17al00_grnodf','m120fhm000y273a17al00_grnodf','m140fhm000y273a17al00_grnodf','m160fhm000y273a17al00_grnodf','m180fhm000y273a17al00_grnodf','m200fhm000y273a17al00_grnodf'$ 
            ]

    outfile= 'Limass'
    outtext=''
    textperrun=[  '1.0','1.2','1.4','1.6','1.8','2.0']

if gtype eq 'CNLogg' then begin
    xmin=4. ;3.7
    xmax=3.;3.2 ;
    ymin=-0.8
    ymax=0.2
endif
if gtype eq 'He3Logg' then begin
    xmin=3.7
    xmax=1.0
    ymin=0;0.000373;0;-0.001
    ymax=0.002;0.000374;0.003
endif
if gtype eq 'TeffLogg' then begin
    xmin=4600
    xmax=4500
    ymin=2.6
    ymax=2.3
endif
if gtype eq 'LiLogg' then begin
    xmin=4.2
    xmax=3.2
    ymin=-1
    ymax=3
endif

endif

if type eq 'Limassm06' then begin
;Testing varying mass
    datadirectory= '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhm060y273a17al00_grnodf','m120fhm060y273a17al00_grnodf','m140fhm060y273a17al00_grnodf','m160fhm060y273a17al00_grnodf','m180fhm060y273a17al00_grnodf','m200fhm060y273a17al00_grnodf'$ 
            ]

    outfile= 'Limassm06'
    outtext=''
    textperrun=[  '1.0','1.2','1.4','1.6','1.8','2.0']

if gtype eq 'CNLogg' then begin
    xmin=4. ;3.7
    xmax=3.;3.2 ;
    ymin=-0.8
    ymax=0.2
endif
if gtype eq 'He3Logg' then begin
    xmin=3.7
    xmax=1.0
    ymin=0;0.000373;0;-0.001
    ymax=0.002;0.000374;0.003
endif
if gtype eq 'TeffLogg' then begin
    xmin=4600
    xmax=4500
    ymin=2.6
    ymax=2.3
endif
if gtype eq 'LiLogg' then begin
    xmin=4.2
    xmax=3.2
    ymin=-1
    ymax=3
endif

endif


if type eq 'CNmasstess' then begin
;Testing varying mass
    datadirectory= '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhm000y273a17al00_grnodf','m120fhm000y273a17al00_grnodf','m140fhm000y273a17al00_grnodf'];,'m160fhm000y273a17al00_grnodf','m180fhm000y273a17al00_grnodf','m200fhm000y273a17al00_grnodf'$ 
;            ]

    outfile= 'CNmasstess'
    outtext=''
    textperrun=[  '1.0','1.2','1.4','1.6','1.8','2.0']

if gtype eq 'CNLogg' then begin
    xmin=4. ;3.7
    xmax=3.;3.2 ;
    ymin=-0.5
    ymax=0.2
endif
if gtype eq 'LiLogg' then begin
    xmin=4.2
    xmax=3.2
    ymin=-1
    ymax=3
endif

endif



if type eq 'Yvary02' then begin
;Testing varying mass
    datadirectory= '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhp020y239a17al00_grnodf','m100fhp020y273a17al00_grnodf', 'm100fhp020y290a17al00_grnodf','m100fhp020y330a17al00_grnodf'        ]

    outfile= 'Yvary02'
    outtext=''
    textperrun=[  '239', '273', '290', '330']

if gtype eq 'CNLogg' then begin
    xmin=4.0 ;3.7
    xmax=1.0 ;2.0
    ymin=-0.8
    ymax=0.2
endif
if gtype eq 'LiLogg' then begin
    xmin=4.2
    xmax=3.2
    ymin=-1
    ymax=3
endif

endif

if type eq 'MZeastman' then begin
;Testing varying mass
    datadirectory= '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhm000y273a17al00_grnodf','m110fhm000y273a17al00_grnodf','m120fhm000y273a17al00_grnodf','m100fhm020y273a17al00_grnodf'$ 
            ]

    outfile= 'MZeastman'
    outtext=''
    textperrun=[  'solar', 'm110', 'm120', '-020']


if gtype eq 'TeffLogg' then begin
    xmin=6500
    xmax=3500
    ymin=4.5
    ymax=2.5
endif


endif



if type eq 'meridithcheck' then begin
;Testing varying mass
    datadirectory= '/data/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm090fhm100y273a17al00_grnodf','m090fhm000y273a17al00_grnodf'];, 'm100fhp020y290a17al00_grnodf','m100fhp020y330a17al00_grnodf'        ]

    outfile= 'meridithcheck'
    outtext=''
    textperrun=[  '-1', 'solar']

if gtype eq 'CNLogg' then begin
    xmin=4.0 ;3.7
    xmax=1.0 ;2.0
    ymin=-0.8
    ymax=0.2
endif
if gtype eq 'LiLogg' then begin
    xmin=4.2
    xmax=2.0
    ymin=-5
    ymax=3
endif

endif

if type eq 'Limassp02' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhp020y273a17al00_grnodf','m120fhp020y273a17al00_grnodf','m140fhp020y273a17al00_grnodf','m160fhp020y273a17al00_grnodf','m180fhp020y273a17al00_grnodf','m200fhp020y273a17al00_grnodf','m220fhp020y273a17al00_grnodf'$ 
            ]

    outfile= 'Limassp02'
    outtext=''
    textperrun=[  '1.0','1.2','1.4','1.6','1.8','2.0', '2.2']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=2.0
    ymin=-0.8
    ymax=0.2
endif
if gtype eq 'LiMass' then begin
    xmin=2.2
    xmax=0.9
    ymin=-2.0
    ymax=2.0
endif
if gtype eq 'LiLogg' then begin
    xmin=4.5
    xmax=2.5
    ymin=-1.0
    ymax=3.0
endif

if gtype eq 'LiAge' then begin
    xmin=0
    xmax=15
    ymin=-2.5
    ymax=1.5
endif

endif


if type eq 'Limass12M' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm120fhp040y273a17al00_grnodf','m120fhp020y273a17al00_grnodf','m120fhm000y273a17al00_grnodf','m120fhm020y273a17al00_grnodf','m120fhm040y273a17al00_grnodf'$ 
            ]

    outfile= 'Limass12M'
    outtext=''
    textperrun=[  '+0.4','+0.2','0.0','-0.2','-0.4']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=2.0
    ymin=-0.8
    ymax=0.2
endif
if gtype eq 'LiMass' then begin
    xmin=2.2
    xmax=0.9
    ymin=-2.0
    ymax=2.0
endif
if gtype eq 'LiLogg' then begin
    xmin=4.5
    xmax=2.5
    ymin=-1.0
    ymax=3.0
endif

if gtype eq 'LiAge' then begin
    xmin=0
    xmax=15
    ymin=-2.5
    ymax=1.5
endif

endif


if type eq 'LimassExplore' then begin
;Testing varying mass
    datadirectory= '~/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm120fhp020y273a17al00_grnodf','m120fhm000y273a17al00_grnodf','m100fhp020y273a17al00_grnodf','m100fhm000y273a17al00_grnodf', 'm080fhp020y273a17al00_grnodf','m080fhm000y273a17al00_grnodf', 'm080fhm020y273a17al00_grnodf', 'm080fhm040y273a17al00_grnodf'$ 
            ]

    outfile= 'LimassExplore'
    outtext=''
    textperrun=[  '1.2+0.2','1.2+0.0','1.0+0.2','1.0+0.0', '0.8+0.2','0.8+0.0', '0.8-0.2', '0.8-0.4']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=2.0
    ymin=-0.8
    ymax=0.2
endif
if gtype eq 'LiMass' then begin
    xmin=2.2
    xmax=0.9
    ymin=-2.0
    ymax=2.0
endif
if gtype eq 'LiLogg' then begin
    xmin=5.5
    xmax=2.5
    ymin=-2.0
    ymax=3.0
endif

if gtype eq 'LiAge' then begin
    xmin=0
    xmax=15
    ymin=-2.5
    ymax=1.5
endif

endif



if type eq 'Limassm02' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhm020y273a17al00_grnodf','m120fhm020y273a17al00_grnodf','m140fhm020y273a17al00_grnodf','m160fhm020y273a17al00_grnodf','m180fhm020y273a17al00_grnodf','m200fhm020y273a17al00_grnodf'$ 
            ]

    outfile= 'Limassm02'
    outtext=''
    textperrun=[  '1.0','1.2','1.4','1.6','1.8','2.0']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=2.0
    ymin=-0.8
    ymax=0.2
endif

endif


if type eq 'cnmassTodd' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhm020y273a17al00_grnodf','m200fhm020y273a17al00_grnodf'$ 
            ]

    outfile= 'cnmassToddm020'
    outtext=''
    textperrun=[  '1.0','2.0']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=2.0
    ymin=-0.8
    ymax=0.2
endif

endif

if type eq 'cnfehak' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhm000y273a17al00_grnodf','m100fhm060y273a17al00_grnodf', 'm100fhm100y273a17al00_grnodf'$ 
            ]

    outfile= 'cnfehak'
    outtext=''
    textperrun=[  '0.0','-0.6', '-1.0']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=2.0
    ymin=-0.8
    ymax=0.2
endif

endif


if type eq 'cnfehag' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm090fhm000y273a17al00_grnodf','m090fhm060y273a17al00_grnodf', 'm090fhm120y273a17al00_grnodf'$ 
            ]

    outfile= 'cnfehag'
    outtext=''
    textperrun=[  '0.0','-0.6', '-1.0']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=1.0
    ymin=-1.0
    ymax=0.5
endif

endif


if type eq 'toddlogg' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm100fhm040y273a17al00_grnodf'$ ;,'m100fhm040y273a12al00_grnodf', 'm100fhm040y273a22al00_grnodf'$ 
            ]

    outfile= 'toddlogg'
    outtext=''
    textperrun=[  '1.7','1.2', '2.2']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=1.0
    ymin=-1.0
    ymax=0.5
endif

if gtype eq 'TeffLogg' then begin
    xmin=4600
    xmax=4500
    ymin=2.6
    ymax=2.3
endif
if gtype eq 'Track' then begin
    xmin=3.663 ;3.9 ;
    xmax=3.653 ;3.4 ;
    ymin=1.65
    ymax=1.75
endif

endif

if type eq 'MBclustertest' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm090fhm040y273a17al00_grnodf','m090fhm060y273a17al00_grnodf', 'm090fhm080y273a17al00_grnodf', $
              'm090fhm100y273a17al00_grnodf','m090fhm120y273a17al00_grnodf', 'm090fhm140y273a17al00_grnodf', $
              'm090fhm160y273a17al00_grnodf','m090fhm180y273a17al00_grnodf', 'm090fhm200y273a17al00_grnodf'$ 
            ]

    outfile= 'MBclustertest'
    outtext=''
    textperrun=[  '-0.4','-0.6','-0.8','-1.0', '-1.2','-1.4','-1.6', '-1.8','-2.0']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=1.0
    ymin=-1.0
    ymax=0.5
endif

if gtype eq 'TeffLoggData' then begin
    xmin=5000
    xmax=4500
    ymin=3.0
    ymax=1.0
endif
endif

if type eq 'MBclustertestCK' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	      'm090fhm000y265a18al00_cknodf','m090fhm050y265a18al00_cknodf','m090fhm100y265a18al00_cknodf', $
              'm090fhm150y265a18al00_cknodf','m090fhm200y265a18al00_cknodf'$ 
            ]

    outfile= 'MBclustertestCK'
    outtext=''
    textperrun=[  '0.0', '-0.5', '-1.0', '-1.5', '-2.0']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=1.0
    ymin=-1.0
    ymax=0.5
endif

if gtype eq 'TeffLoggData' then begin
    xmin=5000
    xmax=4500
    ymin=3.0
    ymax=1.0
endif
endif

if type eq 'MBclustertestCKGraycompare' then begin
;Testing varying mass
    datadirectory= '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
	       'm090fhm000y273a17al00_grnodf','m090fhm000y265a18al00_cknodf',$
              'm090fhm100y273a17al00_grnodf','m090fhm100y265a18al00_cknodf', $
              'm090fhm200y273a17al00_grnodf', 'm090fhm200y265a18al00_cknodf' $
              $ 
            ]

    outfile= 'MBclustertestCKGraycompare'
    outtext=''
    textperrun=[ '0.0g', '0.0c','-1.0g', '-1.0c',    '-2.0g', '-2.0c']

if gtype eq 'CNLogg' then begin
    xmin=3.7
    xmax=1.0
    ymin=-1.0
    ymax=0.5
endif

if gtype eq 'He3Logg' then begin
    xmin=3.7
    xmax=1.0
    ymin=-1.0
    ymax=0.5
endif


if gtype eq 'TeffLoggData' then begin
    xmin=5500
    xmax=4500
    ymin=3.0
    ymax=1.0
endif
if gtype eq 'TeffLoggDiff2' then begin
     xmin=0
     xmax=-120
     ymin=4.0
     ymax=0.0
endif
endif


if type eq 'AGBbumpcheck' then begin ;2.4p2b
;Testing varying mass
    datadirectory= '~/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
              'm240fhm060y273a17al00_grnodf' $;, $
;              'm240fhm080y273a17al00_grnodf'$
             ]

    outfile= 'AGBbumpcheck'
    outtext=''
    textperrun=[ '2.4-0.6', '2.4-0.8']
if gtype eq 'Track' then begin
    xmin=3.718;3.74
    xmax=3.708;3.68
    ymin=1.95;1.9
    ymax=2.1;2.5
endif
if gtype eq 'Deg' then begin
    xmin=0.5;0.38; .315
    xmax=0.53;0.64; .33
    ymin=.1
    ymax=30.0
endif
if gtype eq 'RadiusAge' then begin
    xmin=0.5;0.38;
    xmax=0.53;0.64 ;
    ymin=6;.26;
    ymax=60;1.8;
endif

endif


if type eq 'AGBbumpcheck2' then begin ;2.4p2b
;Testing varying mass
    datadirectory= '~/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
              'm240fhp040y273a17al00_grnodf' $;, $
;              'm240fhm080y273a17al00_grnodf'$
             ]

    outfile= 'AGBbumpcheck2'
    outtext=''
    textperrun=[ '2.4+0.4', '2.4-0.8']
if gtype eq 'Track' then begin
    xmin=3.661;3.672;3.7 ;3.718;
    xmax=3.647;3.616;3.56 ;l3.708;
    ymin=1.7 ;1.95;
    ymax=1.9 ;2.1;
endif
if gtype eq 'RTracknopms' then begin
    xmin=3.661 ;3.718;
    xmax=3.647 ;l3.708;
    ymin=1.041;0.90; 0.5 ;1.95;
    ymax=1.176;1.45;2 ;2.1;
endif
if gtype eq 'Deg' then begin
    xmin=1.062;1.02;0.5;0.38; .315
    xmax=1.064;1.14;0.53;0.64; .33
    ymin=.1
    ymax=20;100.0
endif
if gtype eq 'RadiusAge' then begin
    xmin=1.062;1.02; 0.8;0.38;
    xmax=1.064;1.14;1.24;0.53;0.64 ;
    ymin=11;.26;
    ymax=15;1.8;
endif

endif


if type eq 'Solar_Metallicity' then begin ;2.4p2b
;Testing varying mass
    datadirectory= '~/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
              'm080fhm000y273a17al00_grnodf' , $
              'm120fhm000y273a17al00_grnodf' , $
              'm160fhm000y273a17al00_grnodf' , $
              'm200fhm000y273a17al00_grnodf' $; , $
;              'm240fhm080y273a17al00_grnodf'$
             ]

    outfile= 'Solar_Metallicity'
    outtext=''
    textperrun=[ '0.8', '1.2', '1.6', '2.0']
if gtype eq 'Track' then begin
    xmin=4.0;3.74
    xmax=3.6;3.68
    ymin=-0.5;1.9
    ymax=2.0;2.5
endif
endif



if type eq 'Solar_Mass' then begin ;2.4p2b
;Testing varying mass
    datadirectory= '~/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
              'm100fhm040y273a17al00_grnodf' , $
              'm100fhm000y273a17al00_grnodf' , $
              'm100fhp040y273a17al00_grnodf'  $; , $
;              'm240fhm080y273a17al00_grnodf'$
             ]

    outfile= 'Solar_Mass'
    outtext=''
    textperrun=[ '[Fe/H]=-0.4', '[Fe/H]=0.0', '[Fe/H]=+0.4']
if gtype eq 'Track' then begin
    xmin=3.85;3.74
    xmax=3.55;3.68
    ymin=-1.0;1.9
    ymax=2.0;2.5
endif
endif

if type eq 'SolarvaryML' then begin ;2.4p2b
;Testing varying mass
    datadirectory= '~/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
              'm100fhm000y273a12al00_grnodf' , $
              'm100fhm000y273a17al00_grnodf' , $
              'm100fhm000y273a22al00_grnodf'  $; , $
;              'm240fhm080y273a17al00_grnodf'$
             ]

    outfile= 'SolarvaryML'
    outtext=''
    textperrun=[ 'a=1.2', 'a=1.7', 'a=2.2']
if gtype eq 'Tracknopms' then begin
    xmin=3.78;3.763; 85;3.74
    xmax=3.6;3.755; 55;3.68
    ymin=-1.0;1.9
    ymax=2.0;2.5
endif

if gtype eq 'Tracklin' then begin
    xmin=6000;3.74
    xmax=5400;3.68
    ymin=-0.2;1.9
    ymax=0.2;2.5
endif
endif

if type eq 'SolarvaryHe' then begin ;2.4p2b
;Testing varying mass
    datadirectory= '~/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'
    infiles=[ $
              'm100fhm000y239a17al00_grnodf' , $
              'm100fhm000y273a17al00_grnodf' , $
              'm100fhm000y290a17al00_grnodf'  $; , $
;              'm240fhm080y273a17al00_grnodf'$
             ]

    outfile= 'SolarvaryHe'
    outtext=''
    textperrun=[ 'Y=0.239', 'Y=0.273', 'Y=0.290']
if gtype eq 'Tracknopms' then begin
    xmin=3.78;3.74
    xmax=3.6; 3.6;3.755; 55;
    ymin=-1.0;1.9
    ymax=2.0;2.5
endif

if gtype eq 'Tracklin' then begin
    xmin=6000;3.74
    xmax=5400;3.68
    ymin=-0.2;1.9
    ymax=0.2;2.5
endif
endif

if type eq 'LeslieGrid1' then begin
    datadirectory= '~/EVOLUTION/output/YREC_Leslie_Tracks1/'
    infiles=[ $
'm050fehm000_Test_HPG_base_ZAHB', 'm050fehm050_Test_HPG_base_ZAHB', 'm050fehm100_Test_HPG_base_ZAHB', 'm050fehm200_Test_HPG_base_ZAHB', 'm050fehp050_Test_HPG_base_ZAHB', 'm060fehm000_Test_HPG_base_ZAHB', 'm060fehm050_Test_HPG_base_ZAHB', 'm060fehm100_Test_HPG_base_ZAHB', 'm060fehm200_Test_HPG_base_ZAHB', 'm060fehp050_Test_HPG_base_ZAHB', 'm070fehm000_Test_HPG_base_ZAHB', 'm070fehm050_Test_HPG_base_ZAHB', 'm070fehm100_Test_HPG_base_ZAHB', 'm070fehm200_Test_HPG_base_ZAHB', 'm070fehp050_Test_HPG_base_ZAHB', 'm080fehm000_Test_HPG_base_ZAHB', 'm080fehm050_Test_HPG_base_ZAHB', 'm080fehm100_Test_HPG_base_ZAHB', 'm080fehm200_Test_HPG_base_ZAHB', 'm080fehp050_Test_HPG_base_ZAHB', 'm090fehm000_Test_HPG_base_ZAHB', 'm090fehm050_Test_HPG_base_ZAHB', 'm090fehm100_Test_HPG_base_ZAHB', 'm090fehm200_Test_HPG_base_ZAHB', 'm090fehp050_Test_HPG_base_ZAHB', 'm100fehm000_Test_HPG_base_ZAHB', 'm100fehm050_Test_HPG_base_ZAHB', 'm100fehm100_Test_HPG_base_ZAHB', 'm100fehm200_Test_HPG_base_ZAHB', 'm100fehp050_Test_HPG_base_ZAHB', 'm110fehm000_Test_HPG_base_ZAHB', 'm110fehm050_Test_HPG_base_ZAHB', 'm110fehm100_Test_HPG_base_ZAHB', 'm110fehm200_Test_HPG_base_ZAHB', 'm110fehp050_Test_HPG_base_ZAHB', 'm120fehm000_Test_HPG_base_ZAHB', 'm120fehm050_Test_HPG_base_ZAHB', 'm120fehm100_Test_HPG_base_ZAHB', 'm120fehm200_Test_HPG_base_ZAHB', 'm120fehp050_Test_HPG_base_ZAHB', 'm130fehm000_Test_HPG_base_ZAHB', 'm130fehm050_Test_HPG_base_ZAHB', 'm130fehm100_Test_HPG_base_ZAHB', 'm130fehm200_Test_HPG_base_ZAHB', 'm130fehp050_Test_HPG_base_ZAHB', 'm140fehm000_Test_HPG_base_ZAHB', 'm140fehm050_Test_HPG_base_ZAHB', 'm140fehm100_Test_HPG_base_ZAHB', 'm140fehm200_Test_HPG_base_ZAHB', 'm140fehp050_Test_HPG_base_ZAHB', 'm150fehm000_Test_HPG_base_ZAHB', 'm150fehm050_Test_HPG_base_ZAHB', 'm150fehm100_Test_HPG_base_ZAHB', 'm150fehp050_Test_HPG_base_ZAHB', 'm160fehm000_Test_HPG_base_ZAHB', 'm160fehm050_Test_HPG_base_ZAHB', 'm160fehm100_Test_HPG_base_ZAHB', 'm160fehp050_Test_HPG_base_ZAHB', 'm170fehm000_Test_HPG_base_ZAHB', 'm170fehm050_Test_HPG_base_ZAHB', 'm170fehm100_Test_HPG_base_ZAHB', 'm170fehp050_Test_HPG_base_ZAHB', 'm180fehm000_Test_HPG_base_ZAHB', 'm180fehm050_Test_HPG_base_ZAHB', 'm180fehm100_Test_HPG_base_ZAHB', 'm180fehp050_Test_HPG_base_ZAHB', 'm190fehm000_Test_HPG_base_ZAHB', 'm190fehm050_Test_HPG_base_ZAHB', 'm190fehm100_Test_HPG_base_ZAHB', 'm190fehp050_Test_HPG_base_ZAHB', 'm200fehm000_Test_HPG_base_ZAHB', 'm200fehm050_Test_HPG_base_ZAHB', 'm200fehm100_Test_HPG_base_ZAHB', 'm200fehp050_Test_HPG_base_ZAHB', 'm210fehm000_Test_HPG_base_ZAHB', 'm210fehm050_Test_HPG_base_ZAHB', 'm210fehm100_Test_HPG_base_ZAHB', 'm210fehp050_Test_HPG_base_ZAHB', 'm220fehm000_Test_HPG_base_ZAHB', 'm220fehm050_Test_HPG_base_ZAHB', 'm220fehm100_Test_HPG_base_ZAHB', 'm220fehp050_Test_HPG_base_ZAHB', 'm229fehm000_Test_HPG_base_ZAHB', 'm229fehm050_Test_HPG_base_ZAHB', 'm229fehm100_Test_HPG_base_ZAHB', 'm229fehp050_Test_HPG_base_ZAHB', 'm240fehm000_Test_HPG_base_ZAHB', 'm240fehm050_Test_HPG_base_ZAHB', 'm240fehm100_Test_HPG_base_ZAHB', 'm240fehp050_Test_HPG_base_ZAHB', 'm250fehm000_Test_HPG_base_ZAHB', 'm250fehm050_Test_HPG_base_ZAHB', 'm250fehm100_Test_HPG_base_ZAHB', 'm250fehp050_Test_HPG_base_ZAHB', 'm260fehm000_Test_HPG_base_ZAHB', 'm260fehm050_Test_HPG_base_ZAHB', 'm260fehm100_Test_HPG_base_ZAHB', 'm260fehp050_Test_HPG_base_ZAHB', 'm270fehm000_Test_HPG_base_ZAHB', 'm270fehm050_Test_HPG_base_ZAHB', 'm270fehm100_Test_HPG_base_ZAHB', 'm270fehp050_Test_HPG_base_ZAHB', 'm280fehm000_Test_HPG_base_ZAHB', 'm280fehm050_Test_HPG_base_ZAHB', 'm280fehm100_Test_HPG_base_ZAHB', 'm280fehp050_Test_HPG_base_ZAHB', 'm290fehm000_Test_HPG_base_ZAHB', 'm290fehm050_Test_HPG_base_ZAHB', 'm290fehm100_Test_HPG_base_ZAHB', 'm290fehp050_Test_HPG_base_ZAHB', 'm300fehm000_Test_HPG_base_TAMS', 'm300fehm000_Test_HPG_base_ZAHB', 'm300fehm050_Test_HPG_base_TAMS', 'm300fehm050_Test_HPG_base_ZAHB', 'm300fehm100_Test_HPG_base_TAMS', 'm300fehm100_Test_HPG_base_ZAHB', 'm300fehp050_Test_HPG_base_TAMS', 'm300fehp050_Test_HPG_base_ZAHB', 'm310fehm000_Test_HPG_base_TAMS', 'm310fehm000_Test_HPG_base_ZAHB', 'm310fehm050_Test_HPG_base_TAMS', 'm310fehm050_Test_HPG_base_ZAHB', 'm310fehm100_Test_HPG_base_TAMS', 'm310fehm100_Test_HPG_base_ZAHB', 'm310fehp050_Test_HPG_base_TAMS', 'm310fehp050_Test_HPG_base_ZAHB', 'm320fehm000_Test_HPG_base_TAMS', 'm320fehm000_Test_HPG_base_ZAHB', 'm320fehm050_Test_HPG_base_TAMS', 'm320fehm050_Test_HPG_base_ZAHB', 'm320fehm100_Test_HPG_base_TAMS', 'm320fehm100_Test_HPG_base_ZAHB', 'm320fehp050_Test_HPG_base_TAMS', 'm320fehp050_Test_HPG_base_ZAHB', 'm330fehm000_Test_HPG_base_TAMS', 'm330fehm000_Test_HPG_base_ZAHB', 'm330fehm050_Test_HPG_base_TAMS', 'm330fehm050_Test_HPG_base_ZAHB', 'm330fehm100_Test_HPG_base_TAMS', 'm330fehm100_Test_HPG_base_ZAHB', 'm330fehp050_Test_HPG_base_TAMS', 'm330fehp050_Test_HPG_base_ZAHB', 'm340fehm000_Test_HPG_base_TAMS', 'm340fehm000_Test_HPG_base_ZAHB', 'm340fehm050_Test_HPG_base_TAMS', 'm340fehm050_Test_HPG_base_ZAHB', 'm340fehm100_Test_HPG_base_TAMS', 'm340fehm100_Test_HPG_base_ZAHB', 'm340fehp050_Test_HPG_base_TAMS', 'm340fehp050_Test_HPG_base_ZAHB', 'm350fehm000_Test_HPG_base_TAMS', 'm350fehm000_Test_HPG_base_ZAHB', 'm350fehm050_Test_HPG_base_TAMS', 'm350fehm050_Test_HPG_base_ZAHB', 'm350fehm100_Test_HPG_base_TAMS', 'm350fehm100_Test_HPG_base_ZAHB', 'm350fehp050_Test_HPG_base_TAMS', 'm350fehp050_Test_HPG_base_ZAHB', 'm360fehm000_Test_HPG_base_TAMS', 'm360fehm000_Test_HPG_base_ZAHB', 'm360fehm050_Test_HPG_base_TAMS', 'm360fehm050_Test_HPG_base_ZAHB', 'm360fehm100_Test_HPG_base_TAMS', 'm360fehm100_Test_HPG_base_ZAHB', 'm360fehp050_Test_HPG_base_TAMS', 'm360fehp050_Test_HPG_base_ZAHB', 'm370fehm000_Test_HPG_base_TAMS', 'm370fehm000_Test_HPG_base_ZAHB', 'm370fehm050_Test_HPG_base_TAMS', 'm370fehm050_Test_HPG_base_ZAHB', 'm370fehm100_Test_HPG_base_TAMS', 'm370fehm100_Test_HPG_base_ZAHB', 'm370fehp050_Test_HPG_base_TAMS', 'm370fehp050_Test_HPG_base_ZAHB', 'm380fehm000_Test_HPG_base_TAMS', 'm380fehm000_Test_HPG_base_ZAHB', 'm380fehm050_Test_HPG_base_TAMS', 'm380fehm050_Test_HPG_base_ZAHB', 'm380fehm100_Test_HPG_base_TAMS', 'm380fehm100_Test_HPG_base_ZAHB', 'm380fehp050_Test_HPG_base_TAMS', 'm380fehp050_Test_HPG_base_ZAHB', 'm390fehm000_Test_HPG_base_TAMS', 'm390fehm000_Test_HPG_base_ZAHB', 'm390fehm050_Test_HPG_base_TAMS', 'm390fehm050_Test_HPG_base_ZAHB', 'm390fehm100_Test_HPG_base_TAMS', 'm390fehm100_Test_HPG_base_ZAHB', 'm390fehp050_Test_HPG_base_TAMS', 'm390fehp050_Test_HPG_base_ZAHB', 'm400fehm000_Test_HPG_base_TAMS', 'm400fehm000_Test_HPG_base_ZAHB', 'm400fehm050_Test_HPG_base_TAMS', 'm400fehm050_Test_HPG_base_ZAHB', 'm400fehm100_Test_HPG_base_TAMS', 'm400fehm100_Test_HPG_base_ZAHB', 'm400fehp050_Test_HPG_base_TAMS', 'm400fehp050_Test_HPG_base_ZAHB', 'm409fehm000_Test_HPG_base_TAMS', 'm409fehm000_Test_HPG_base_ZAHB', 'm409fehm050_Test_HPG_base_TAMS', 'm409fehm050_Test_HPG_base_ZAHB', 'm409fehm100_Test_HPG_base_TAMS', 'm409fehm100_Test_HPG_base_ZAHB', 'm409fehp050_Test_HPG_base_TAMS', 'm409fehp050_Test_HPG_base_ZAHB', 'm420fehm000_Test_HPG_base_TAMS', 'm420fehm000_Test_HPG_base_ZAHB', 'm420fehm050_Test_HPG_base_TAMS', 'm420fehm050_Test_HPG_base_ZAHB', 'm420fehm100_Test_HPG_base_TAMS', 'm420fehm100_Test_HPG_base_ZAHB', 'm420fehp050_Test_HPG_base_TAMS', 'm420fehp050_Test_HPG_base_ZAHB', 'm430fehm000_Test_HPG_base_TAMS', 'm430fehm000_Test_HPG_base_ZAHB', 'm430fehm050_Test_HPG_base_TAMS', 'm430fehm050_Test_HPG_base_ZAHB', 'm430fehm100_Test_HPG_base_TAMS', 'm430fehm100_Test_HPG_base_ZAHB', 'm430fehp050_Test_HPG_base_TAMS', 'm430fehp050_Test_HPG_base_ZAHB', 'm440fehm000_Test_HPG_base_TAMS', 'm440fehm000_Test_HPG_base_ZAHB', 'm440fehm050_Test_HPG_base_TAMS', 'm440fehm050_Test_HPG_base_ZAHB', 'm440fehm100_Test_HPG_base_TAMS', 'm440fehm100_Test_HPG_base_ZAHB', 'm440fehp050_Test_HPG_base_TAMS', 'm440fehp050_Test_HPG_base_ZAHB', 'm450fehm000_Test_HPG_base_TAMS', 'm450fehm000_Test_HPG_base_ZAHB', 'm450fehm050_Test_HPG_base_TAMS', 'm450fehm050_Test_HPG_base_ZAHB', 'm450fehm100_Test_HPG_base_TAMS', 'm450fehm100_Test_HPG_base_ZAHB', 'm450fehp050_Test_HPG_base_TAMS', 'm450fehp050_Test_HPG_base_ZAHB', 'm459fehm000_Test_HPG_base_TAMS', 'm459fehm000_Test_HPG_base_ZAHB', 'm459fehm050_Test_HPG_base_TAMS', 'm459fehm050_Test_HPG_base_ZAHB', 'm459fehm100_Test_HPG_base_TAMS', 'm459fehm100_Test_HPG_base_ZAHB', 'm459fehp050_Test_HPG_base_TAMS', 'm459fehp050_Test_HPG_base_ZAHB', 'm470fehm000_Test_HPG_base_TAMS', 'm470fehm000_Test_HPG_base_ZAHB', 'm470fehm050_Test_HPG_base_TAMS', 'm470fehm050_Test_HPG_base_ZAHB', 'm470fehm100_Test_HPG_base_TAMS', 'm470fehm100_Test_HPG_base_ZAHB', 'm470fehp050_Test_HPG_base_TAMS', 'm470fehp050_Test_HPG_base_ZAHB', 'm480fehm000_Test_HPG_base_TAMS', 'm480fehm000_Test_HPG_base_ZAHB', 'm480fehm050_Test_HPG_base_TAMS', 'm480fehm050_Test_HPG_base_ZAHB', 'm480fehm100_Test_HPG_base_TAMS', 'm480fehm100_Test_HPG_base_ZAHB', 'm480fehp050_Test_HPG_base_TAMS', 'm480fehp050_Test_HPG_base_ZAHB', 'm490fehm000_Test_HPG_base_TAMS', 'm490fehm000_Test_HPG_base_ZAHB', 'm490fehm050_Test_HPG_base_TAMS', 'm490fehm050_Test_HPG_base_ZAHB', 'm490fehm100_Test_HPG_base_TAMS', 'm490fehm100_Test_HPG_base_ZAHB', 'm490fehp050_Test_HPG_base_TAMS', 'm490fehp050_Test_HPG_base_ZAHB', 'm500fehm000_Test_HPG_base_TAMS', 'm500fehm000_Test_HPG_base_ZAHB', 'm500fehm050_Test_HPG_base_TAMS', 'm500fehm050_Test_HPG_base_ZAHB', 'm500fehm100_Test_HPG_base_TAMS', 'm500fehm100_Test_HPG_base_ZAHB', 'm500fehp050_Test_HPG_base_TAMS', 'm500fehp050_Test_HPG_base_ZAHB', 'm509fehm000_Test_HPG_base_TAMS', 'm509fehm000_Test_HPG_base_ZAHB', 'm509fehm050_Test_HPG_base_TAMS', 'm509fehm050_Test_HPG_base_ZAHB', 'm509fehp050_Test_HPG_base_TAMS', 'm509fehp050_Test_HPG_base_ZAHB', 'm520fehm000_Test_HPG_base_TAMS', 'm520fehm000_Test_HPG_base_ZAHB', 'm520fehm050_Test_HPG_base_TAMS', 'm520fehm050_Test_HPG_base_ZAHB', 'm520fehp050_Test_HPG_base_TAMS', 'm520fehp050_Test_HPG_base_ZAHB', 'm530fehm000_Test_HPG_base_TAMS', 'm530fehm000_Test_HPG_base_ZAHB', 'm530fehm050_Test_HPG_base_TAMS', 'm530fehm050_Test_HPG_base_ZAHB', 'm530fehp050_Test_HPG_base_TAMS', 'm530fehp050_Test_HPG_base_ZAHB', 'm540fehm000_Test_HPG_base_TAMS', 'm540fehm000_Test_HPG_base_ZAHB', 'm540fehm050_Test_HPG_base_TAMS', 'm540fehm050_Test_HPG_base_ZAHB', 'm540fehp050_Test_HPG_base_TAMS', 'm540fehp050_Test_HPG_base_ZAHB', 'm550fehm000_Test_HPG_base_TAMS', 'm550fehm000_Test_HPG_base_ZAHB', 'm550fehm050_Test_HPG_base_TAMS', 'm550fehm050_Test_HPG_base_ZAHB', 'm550fehp050_Test_HPG_base_TAMS', 'm550fehp050_Test_HPG_base_ZAHB', 'm560fehm000_Test_HPG_base_TAMS', 'm560fehm000_Test_HPG_base_ZAHB', 'm560fehm050_Test_HPG_base_TAMS', 'm560fehm050_Test_HPG_base_ZAHB', 'm560fehp050_Test_HPG_base_TAMS', 'm560fehp050_Test_HPG_base_ZAHB', 'm570fehm000_Test_HPG_base_TAMS', 'm570fehm000_Test_HPG_base_ZAHB', 'm570fehm050_Test_HPG_base_TAMS', 'm570fehm050_Test_HPG_base_ZAHB', 'm570fehp050_Test_HPG_base_TAMS', 'm570fehp050_Test_HPG_base_ZAHB', 'm580fehm000_Test_HPG_base_TAMS', 'm580fehm000_Test_HPG_base_ZAHB', 'm580fehm050_Test_HPG_base_TAMS', 'm580fehm050_Test_HPG_base_ZAHB', 'm580fehp050_Test_HPG_base_TAMS', 'm580fehp050_Test_HPG_base_ZAHB', 'm590fehm000_Test_HPG_base_TAMS', 'm590fehm000_Test_HPG_base_ZAHB', 'm590fehm050_Test_HPG_base_TAMS', 'm590fehm050_Test_HPG_base_ZAHB', 'm590fehp050_Test_HPG_base_TAMS', 'm590fehp050_Test_HPG_base_ZAHB', 'm600fehm000_Test_HPG_base_TAMS', 'm600fehm000_Test_HPG_base_ZAHB', 'm600fehm050_Test_HPG_base_TAMS', 'm600fehm050_Test_HPG_base_ZAHB', 'm600fehp050_Test_HPG_base_TAMS', 'm600fehp050_Test_HPG_base_ZAHB', 'm610fehm000_Test_HPG_base_TAMS', 'm610fehm000_Test_HPG_base_ZAHB', 'm610fehm050_Test_HPG_base_TAMS', 'm610fehm050_Test_HPG_base_ZAHB', 'm610fehp050_Test_HPG_base_TAMS', 'm610fehp050_Test_HPG_base_ZAHB', 'm620fehm000_Test_HPG_base_TAMS', 'm620fehm000_Test_HPG_base_ZAHB', 'm620fehm050_Test_HPG_base_TAMS', 'm620fehm050_Test_HPG_base_ZAHB', 'm620fehp050_Test_HPG_base_TAMS', 'm620fehp050_Test_HPG_base_ZAHB', 'm630fehm000_Test_HPG_base_TAMS', 'm630fehm000_Test_HPG_base_ZAHB', 'm630fehm050_Test_HPG_base_TAMS', 'm630fehm050_Test_HPG_base_ZAHB', 'm630fehp050_Test_HPG_base_TAMS', 'm630fehp050_Test_HPG_base_ZAHB', 'm640fehm000_Test_HPG_base_TAMS', 'm640fehm000_Test_HPG_base_ZAHB', 'm640fehm050_Test_HPG_base_TAMS', 'm640fehm050_Test_HPG_base_ZAHB', 'm640fehp050_Test_HPG_base_TAMS', 'm640fehp050_Test_HPG_base_ZAHB', 'm650fehm000_Test_HPG_base_TAMS', 'm650fehm000_Test_HPG_base_ZAHB', 'm650fehm050_Test_HPG_base_TAMS', 'm650fehm050_Test_HPG_base_ZAHB', 'm650fehp050_Test_HPG_base_TAMS', 'm650fehp050_Test_HPG_base_ZAHB', 'm660fehm000_Test_HPG_base_TAMS', 'm660fehm000_Test_HPG_base_ZAHB', 'm660fehm050_Test_HPG_base_TAMS', 'm660fehm050_Test_HPG_base_ZAHB', 'm660fehp050_Test_HPG_base_TAMS', 'm660fehp050_Test_HPG_base_ZAHB', 'm670fehm000_Test_HPG_base_TAMS', 'm670fehm000_Test_HPG_base_ZAHB', 'm670fehm050_Test_HPG_base_TAMS', 'm670fehm050_Test_HPG_base_ZAHB', 'm670fehp050_Test_HPG_base_TAMS', 'm670fehp050_Test_HPG_base_ZAHB', 'm680fehm000_Test_HPG_base_TAMS', 'm680fehm000_Test_HPG_base_ZAHB', 'm680fehm050_Test_HPG_base_TAMS', 'm680fehm050_Test_HPG_base_ZAHB', 'm680fehp050_Test_HPG_base_TAMS', 'm680fehp050_Test_HPG_base_ZAHB', 'm690fehm000_Test_HPG_base_TAMS', 'm690fehm000_Test_HPG_base_ZAHB', 'm690fehm050_Test_HPG_base_TAMS', 'm690fehm050_Test_HPG_base_ZAHB', 'm690fehp050_Test_HPG_base_TAMS', 'm690fehp050_Test_HPG_base_ZAHB', 'm700fehm000_Test_HPG_base_TAMS', 'm700fehm000_Test_HPG_base_ZAHB', 'm700fehm050_Test_HPG_base_TAMS', 'm700fehm050_Test_HPG_base_ZAHB', 'm700fehp050_Test_HPG_base_TAMS', 'm700fehp050_Test_HPG_base_ZAHB', 'm710fehm000_Test_HPG_base_TAMS', 'm710fehm000_Test_HPG_base_ZAHB', 'm710fehm050_Test_HPG_base_TAMS', 'm710fehm050_Test_HPG_base_ZAHB', 'm710fehp050_Test_HPG_base_TAMS', 'm710fehp050_Test_HPG_base_ZAHB', 'm720fehm000_Test_HPG_base_TAMS', 'm720fehm000_Test_HPG_base_ZAHB', 'm720fehm050_Test_HPG_base_TAMS', 'm720fehm050_Test_HPG_base_ZAHB', 'm720fehp050_Test_HPG_base_TAMS', 'm720fehp050_Test_HPG_base_ZAHB', 'm730fehm000_Test_HPG_base_TAMS', 'm730fehm000_Test_HPG_base_ZAHB', 'm730fehm050_Test_HPG_base_TAMS', 'm730fehm050_Test_HPG_base_ZAHB', 'm730fehp050_Test_HPG_base_TAMS', 'm730fehp050_Test_HPG_base_ZAHB', 'm740fehm000_Test_HPG_base_TAMS', 'm740fehm000_Test_HPG_base_ZAHB', 'm740fehm050_Test_HPG_base_TAMS', 'm740fehm050_Test_HPG_base_ZAHB', 'm740fehp050_Test_HPG_base_TAMS', 'm740fehp050_Test_HPG_base_ZAHB', 'm750fehm000_Test_HPG_base_TAMS', 'm750fehm000_Test_HPG_base_ZAHB', 'm750fehm050_Test_HPG_base_TAMS', 'm750fehm050_Test_HPG_base_ZAHB', 'm750fehp050_Test_HPG_base_TAMS', 'm750fehp050_Test_HPG_base_ZAHB', 'm760fehm000_Test_HPG_base_TAMS', 'm760fehm000_Test_HPG_base_ZAHB', 'm760fehm050_Test_HPG_base_TAMS', 'm760fehm050_Test_HPG_base_ZAHB', 'm760fehp050_Test_HPG_base_TAMS', 'm760fehp050_Test_HPG_base_ZAHB', 'm770fehm000_Test_HPG_base_TAMS', 'm770fehm000_Test_HPG_base_ZAHB', 'm770fehm050_Test_HPG_base_TAMS', 'm770fehm050_Test_HPG_base_ZAHB', 'm770fehp050_Test_HPG_base_TAMS', 'm770fehp050_Test_HPG_base_ZAHB', 'm780fehm000_Test_HPG_base_TAMS', 'm780fehm000_Test_HPG_base_ZAHB', 'm780fehm050_Test_HPG_base_TAMS', 'm780fehm050_Test_HPG_base_ZAHB', 'm780fehp050_Test_HPG_base_TAMS', 'm780fehp050_Test_HPG_base_ZAHB', 'm790fehm000_Test_HPG_base_TAMS', 'm790fehm000_Test_HPG_base_ZAHB', 'm790fehm050_Test_HPG_base_TAMS', 'm790fehm050_Test_HPG_base_ZAHB', 'm790fehp050_Test_HPG_base_TAMS', 'm790fehp050_Test_HPG_base_ZAHB', 'm800fehm000_Test_HPG_base_TAMS', 'm800fehm000_Test_HPG_base_ZAHB', 'm800fehm050_Test_HPG_base_TAMS', 'm800fehm050_Test_HPG_base_ZAHB', 'm800fehp050_Test_HPG_base_TAMS', 'm800fehp050_Test_HPG_base_ZAHB'$
             ]

    outfile= 'LeslieYrec1'
    outtext=''
    textperrun=[ $
    'm050fehm000_Test_HPG_base_ZAHB', 'm050fehm050_Test_HPG_base_ZAHB', 'm050fehm100_Test_HPG_base_ZAHB', 'm050fehm200_Test_HPG_base_ZAHB', 'm050fehp050_Test_HPG_base_ZAHB', 'm060fehm000_Test_HPG_base_ZAHB', 'm060fehm050_Test_HPG_base_ZAHB', 'm060fehm100_Test_HPG_base_ZAHB', 'm060fehm200_Test_HPG_base_ZAHB', 'm060fehp050_Test_HPG_base_ZAHB', 'm070fehm000_Test_HPG_base_ZAHB', 'm070fehm050_Test_HPG_base_ZAHB', 'm070fehm100_Test_HPG_base_ZAHB', 'm070fehm200_Test_HPG_base_ZAHB', 'm070fehp050_Test_HPG_base_ZAHB', 'm080fehm000_Test_HPG_base_ZAHB', 'm080fehm050_Test_HPG_base_ZAHB', 'm080fehm100_Test_HPG_base_ZAHB', 'm080fehm200_Test_HPG_base_ZAHB', 'm080fehp050_Test_HPG_base_ZAHB', 'm090fehm000_Test_HPG_base_ZAHB', 'm090fehm050_Test_HPG_base_ZAHB', 'm090fehm100_Test_HPG_base_ZAHB', 'm090fehm200_Test_HPG_base_ZAHB', 'm090fehp050_Test_HPG_base_ZAHB', 'm100fehm000_Test_HPG_base_ZAHB', 'm100fehm050_Test_HPG_base_ZAHB', 'm100fehm100_Test_HPG_base_ZAHB', 'm100fehm200_Test_HPG_base_ZAHB', 'm100fehp050_Test_HPG_base_ZAHB', 'm110fehm000_Test_HPG_base_ZAHB', 'm110fehm050_Test_HPG_base_ZAHB', 'm110fehm100_Test_HPG_base_ZAHB', 'm110fehm200_Test_HPG_base_ZAHB', 'm110fehp050_Test_HPG_base_ZAHB', 'm120fehm000_Test_HPG_base_ZAHB', 'm120fehm050_Test_HPG_base_ZAHB', 'm120fehm100_Test_HPG_base_ZAHB', 'm120fehm200_Test_HPG_base_ZAHB', 'm120fehp050_Test_HPG_base_ZAHB', 'm130fehm000_Test_HPG_base_ZAHB', 'm130fehm050_Test_HPG_base_ZAHB', 'm130fehm100_Test_HPG_base_ZAHB', 'm130fehm200_Test_HPG_base_ZAHB', 'm130fehp050_Test_HPG_base_ZAHB', 'm140fehm000_Test_HPG_base_ZAHB', 'm140fehm050_Test_HPG_base_ZAHB', 'm140fehm100_Test_HPG_base_ZAHB', 'm140fehm200_Test_HPG_base_ZAHB', 'm140fehp050_Test_HPG_base_ZAHB', 'm150fehm000_Test_HPG_base_ZAHB', 'm150fehm050_Test_HPG_base_ZAHB', 'm150fehm100_Test_HPG_base_ZAHB', 'm150fehp050_Test_HPG_base_ZAHB', 'm160fehm000_Test_HPG_base_ZAHB', 'm160fehm050_Test_HPG_base_ZAHB', 'm160fehm100_Test_HPG_base_ZAHB', 'm160fehp050_Test_HPG_base_ZAHB', 'm170fehm000_Test_HPG_base_ZAHB', 'm170fehm050_Test_HPG_base_ZAHB', 'm170fehm100_Test_HPG_base_ZAHB', 'm170fehp050_Test_HPG_base_ZAHB', 'm180fehm000_Test_HPG_base_ZAHB', 'm180fehm050_Test_HPG_base_ZAHB', 'm180fehm100_Test_HPG_base_ZAHB', 'm180fehp050_Test_HPG_base_ZAHB', 'm190fehm000_Test_HPG_base_ZAHB', 'm190fehm050_Test_HPG_base_ZAHB', 'm190fehm100_Test_HPG_base_ZAHB', 'm190fehp050_Test_HPG_base_ZAHB', 'm200fehm000_Test_HPG_base_ZAHB', 'm200fehm050_Test_HPG_base_ZAHB', 'm200fehm100_Test_HPG_base_ZAHB', 'm200fehp050_Test_HPG_base_ZAHB', 'm210fehm000_Test_HPG_base_ZAHB', 'm210fehm050_Test_HPG_base_ZAHB', 'm210fehm100_Test_HPG_base_ZAHB', 'm210fehp050_Test_HPG_base_ZAHB', 'm220fehm000_Test_HPG_base_ZAHB', 'm220fehm050_Test_HPG_base_ZAHB', 'm220fehm100_Test_HPG_base_ZAHB', 'm220fehp050_Test_HPG_base_ZAHB', 'm229fehm000_Test_HPG_base_ZAHB', 'm229fehm050_Test_HPG_base_ZAHB', 'm229fehm100_Test_HPG_base_ZAHB', 'm229fehp050_Test_HPG_base_ZAHB', 'm240fehm000_Test_HPG_base_ZAHB', 'm240fehm050_Test_HPG_base_ZAHB', 'm240fehm100_Test_HPG_base_ZAHB', 'm240fehp050_Test_HPG_base_ZAHB', 'm250fehm000_Test_HPG_base_ZAHB', 'm250fehm050_Test_HPG_base_ZAHB', 'm250fehm100_Test_HPG_base_ZAHB', 'm250fehp050_Test_HPG_base_ZAHB', 'm260fehm000_Test_HPG_base_ZAHB', 'm260fehm050_Test_HPG_base_ZAHB', 'm260fehm100_Test_HPG_base_ZAHB', 'm260fehp050_Test_HPG_base_ZAHB', 'm270fehm000_Test_HPG_base_ZAHB', 'm270fehm050_Test_HPG_base_ZAHB', 'm270fehm100_Test_HPG_base_ZAHB', 'm270fehp050_Test_HPG_base_ZAHB', 'm280fehm000_Test_HPG_base_ZAHB', 'm280fehm050_Test_HPG_base_ZAHB', 'm280fehm100_Test_HPG_base_ZAHB', 'm280fehp050_Test_HPG_base_ZAHB', 'm290fehm000_Test_HPG_base_ZAHB', 'm290fehm050_Test_HPG_base_ZAHB', 'm290fehm100_Test_HPG_base_ZAHB', 'm290fehp050_Test_HPG_base_ZAHB', 'm300fehm000_Test_HPG_base_TAMS', 'm300fehm000_Test_HPG_base_ZAHB', 'm300fehm050_Test_HPG_base_TAMS', 'm300fehm050_Test_HPG_base_ZAHB', 'm300fehm100_Test_HPG_base_TAMS', 'm300fehm100_Test_HPG_base_ZAHB', 'm300fehp050_Test_HPG_base_TAMS', 'm300fehp050_Test_HPG_base_ZAHB', 'm310fehm000_Test_HPG_base_TAMS', 'm310fehm000_Test_HPG_base_ZAHB', 'm310fehm050_Test_HPG_base_TAMS', 'm310fehm050_Test_HPG_base_ZAHB', 'm310fehm100_Test_HPG_base_TAMS', 'm310fehm100_Test_HPG_base_ZAHB', 'm310fehp050_Test_HPG_base_TAMS', 'm310fehp050_Test_HPG_base_ZAHB', 'm320fehm000_Test_HPG_base_TAMS', 'm320fehm000_Test_HPG_base_ZAHB', 'm320fehm050_Test_HPG_base_TAMS', 'm320fehm050_Test_HPG_base_ZAHB', 'm320fehm100_Test_HPG_base_TAMS', 'm320fehm100_Test_HPG_base_ZAHB', 'm320fehp050_Test_HPG_base_TAMS', 'm320fehp050_Test_HPG_base_ZAHB', 'm330fehm000_Test_HPG_base_TAMS', 'm330fehm000_Test_HPG_base_ZAHB', 'm330fehm050_Test_HPG_base_TAMS', 'm330fehm050_Test_HPG_base_ZAHB', 'm330fehm100_Test_HPG_base_TAMS', 'm330fehm100_Test_HPG_base_ZAHB', 'm330fehp050_Test_HPG_base_TAMS', 'm330fehp050_Test_HPG_base_ZAHB', 'm340fehm000_Test_HPG_base_TAMS', 'm340fehm000_Test_HPG_base_ZAHB', 'm340fehm050_Test_HPG_base_TAMS', 'm340fehm050_Test_HPG_base_ZAHB', 'm340fehm100_Test_HPG_base_TAMS', 'm340fehm100_Test_HPG_base_ZAHB', 'm340fehp050_Test_HPG_base_TAMS', 'm340fehp050_Test_HPG_base_ZAHB', 'm350fehm000_Test_HPG_base_TAMS', 'm350fehm000_Test_HPG_base_ZAHB', 'm350fehm050_Test_HPG_base_TAMS', 'm350fehm050_Test_HPG_base_ZAHB', 'm350fehm100_Test_HPG_base_TAMS', 'm350fehm100_Test_HPG_base_ZAHB', 'm350fehp050_Test_HPG_base_TAMS', 'm350fehp050_Test_HPG_base_ZAHB', 'm360fehm000_Test_HPG_base_TAMS', 'm360fehm000_Test_HPG_base_ZAHB', 'm360fehm050_Test_HPG_base_TAMS', 'm360fehm050_Test_HPG_base_ZAHB', 'm360fehm100_Test_HPG_base_TAMS', 'm360fehm100_Test_HPG_base_ZAHB', 'm360fehp050_Test_HPG_base_TAMS', 'm360fehp050_Test_HPG_base_ZAHB', 'm370fehm000_Test_HPG_base_TAMS', 'm370fehm000_Test_HPG_base_ZAHB', 'm370fehm050_Test_HPG_base_TAMS', 'm370fehm050_Test_HPG_base_ZAHB', 'm370fehm100_Test_HPG_base_TAMS', 'm370fehm100_Test_HPG_base_ZAHB', 'm370fehp050_Test_HPG_base_TAMS', 'm370fehp050_Test_HPG_base_ZAHB', 'm380fehm000_Test_HPG_base_TAMS', 'm380fehm000_Test_HPG_base_ZAHB', 'm380fehm050_Test_HPG_base_TAMS', 'm380fehm050_Test_HPG_base_ZAHB', 'm380fehm100_Test_HPG_base_TAMS', 'm380fehm100_Test_HPG_base_ZAHB', 'm380fehp050_Test_HPG_base_TAMS', 'm380fehp050_Test_HPG_base_ZAHB', 'm390fehm000_Test_HPG_base_TAMS', 'm390fehm000_Test_HPG_base_ZAHB', 'm390fehm050_Test_HPG_base_TAMS', 'm390fehm050_Test_HPG_base_ZAHB', 'm390fehm100_Test_HPG_base_TAMS', 'm390fehm100_Test_HPG_base_ZAHB', 'm390fehp050_Test_HPG_base_TAMS', 'm390fehp050_Test_HPG_base_ZAHB', 'm400fehm000_Test_HPG_base_TAMS', 'm400fehm000_Test_HPG_base_ZAHB', 'm400fehm050_Test_HPG_base_TAMS', 'm400fehm050_Test_HPG_base_ZAHB', 'm400fehm100_Test_HPG_base_TAMS', 'm400fehm100_Test_HPG_base_ZAHB', 'm400fehp050_Test_HPG_base_TAMS', 'm400fehp050_Test_HPG_base_ZAHB', 'm409fehm000_Test_HPG_base_TAMS', 'm409fehm000_Test_HPG_base_ZAHB', 'm409fehm050_Test_HPG_base_TAMS', 'm409fehm050_Test_HPG_base_ZAHB', 'm409fehm100_Test_HPG_base_TAMS', 'm409fehm100_Test_HPG_base_ZAHB', 'm409fehp050_Test_HPG_base_TAMS', 'm409fehp050_Test_HPG_base_ZAHB', 'm420fehm000_Test_HPG_base_TAMS', 'm420fehm000_Test_HPG_base_ZAHB', 'm420fehm050_Test_HPG_base_TAMS', 'm420fehm050_Test_HPG_base_ZAHB', 'm420fehm100_Test_HPG_base_TAMS', 'm420fehm100_Test_HPG_base_ZAHB', 'm420fehp050_Test_HPG_base_TAMS', 'm420fehp050_Test_HPG_base_ZAHB', 'm430fehm000_Test_HPG_base_TAMS', 'm430fehm000_Test_HPG_base_ZAHB', 'm430fehm050_Test_HPG_base_TAMS', 'm430fehm050_Test_HPG_base_ZAHB', 'm430fehm100_Test_HPG_base_TAMS', 'm430fehm100_Test_HPG_base_ZAHB', 'm430fehp050_Test_HPG_base_TAMS', 'm430fehp050_Test_HPG_base_ZAHB', 'm440fehm000_Test_HPG_base_TAMS', 'm440fehm000_Test_HPG_base_ZAHB', 'm440fehm050_Test_HPG_base_TAMS', 'm440fehm050_Test_HPG_base_ZAHB', 'm440fehm100_Test_HPG_base_TAMS', 'm440fehm100_Test_HPG_base_ZAHB', 'm440fehp050_Test_HPG_base_TAMS', 'm440fehp050_Test_HPG_base_ZAHB', 'm450fehm000_Test_HPG_base_TAMS', 'm450fehm000_Test_HPG_base_ZAHB', 'm450fehm050_Test_HPG_base_TAMS', 'm450fehm050_Test_HPG_base_ZAHB', 'm450fehm100_Test_HPG_base_TAMS', 'm450fehm100_Test_HPG_base_ZAHB', 'm450fehp050_Test_HPG_base_TAMS', 'm450fehp050_Test_HPG_base_ZAHB', 'm459fehm000_Test_HPG_base_TAMS', 'm459fehm000_Test_HPG_base_ZAHB', 'm459fehm050_Test_HPG_base_TAMS', 'm459fehm050_Test_HPG_base_ZAHB', 'm459fehm100_Test_HPG_base_TAMS', 'm459fehm100_Test_HPG_base_ZAHB', 'm459fehp050_Test_HPG_base_TAMS', 'm459fehp050_Test_HPG_base_ZAHB', 'm470fehm000_Test_HPG_base_TAMS', 'm470fehm000_Test_HPG_base_ZAHB', 'm470fehm050_Test_HPG_base_TAMS', 'm470fehm050_Test_HPG_base_ZAHB', 'm470fehm100_Test_HPG_base_TAMS', 'm470fehm100_Test_HPG_base_ZAHB', 'm470fehp050_Test_HPG_base_TAMS', 'm470fehp050_Test_HPG_base_ZAHB', 'm480fehm000_Test_HPG_base_TAMS', 'm480fehm000_Test_HPG_base_ZAHB', 'm480fehm050_Test_HPG_base_TAMS', 'm480fehm050_Test_HPG_base_ZAHB', 'm480fehm100_Test_HPG_base_TAMS', 'm480fehm100_Test_HPG_base_ZAHB', 'm480fehp050_Test_HPG_base_TAMS', 'm480fehp050_Test_HPG_base_ZAHB', 'm490fehm000_Test_HPG_base_TAMS', 'm490fehm000_Test_HPG_base_ZAHB', 'm490fehm050_Test_HPG_base_TAMS', 'm490fehm050_Test_HPG_base_ZAHB', 'm490fehm100_Test_HPG_base_TAMS', 'm490fehm100_Test_HPG_base_ZAHB', 'm490fehp050_Test_HPG_base_TAMS', 'm490fehp050_Test_HPG_base_ZAHB', 'm500fehm000_Test_HPG_base_TAMS', 'm500fehm000_Test_HPG_base_ZAHB', 'm500fehm050_Test_HPG_base_TAMS', 'm500fehm050_Test_HPG_base_ZAHB', 'm500fehm100_Test_HPG_base_TAMS', 'm500fehm100_Test_HPG_base_ZAHB', 'm500fehp050_Test_HPG_base_TAMS', 'm500fehp050_Test_HPG_base_ZAHB', 'm509fehm000_Test_HPG_base_TAMS', 'm509fehm000_Test_HPG_base_ZAHB', 'm509fehm050_Test_HPG_base_TAMS', 'm509fehm050_Test_HPG_base_ZAHB', 'm509fehp050_Test_HPG_base_TAMS', 'm509fehp050_Test_HPG_base_ZAHB', 'm520fehm000_Test_HPG_base_TAMS', 'm520fehm000_Test_HPG_base_ZAHB', 'm520fehm050_Test_HPG_base_TAMS', 'm520fehm050_Test_HPG_base_ZAHB', 'm520fehp050_Test_HPG_base_TAMS', 'm520fehp050_Test_HPG_base_ZAHB', 'm530fehm000_Test_HPG_base_TAMS', 'm530fehm000_Test_HPG_base_ZAHB', 'm530fehm050_Test_HPG_base_TAMS', 'm530fehm050_Test_HPG_base_ZAHB', 'm530fehp050_Test_HPG_base_TAMS', 'm530fehp050_Test_HPG_base_ZAHB', 'm540fehm000_Test_HPG_base_TAMS', 'm540fehm000_Test_HPG_base_ZAHB', 'm540fehm050_Test_HPG_base_TAMS', 'm540fehm050_Test_HPG_base_ZAHB', 'm540fehp050_Test_HPG_base_TAMS', 'm540fehp050_Test_HPG_base_ZAHB', 'm550fehm000_Test_HPG_base_TAMS', 'm550fehm000_Test_HPG_base_ZAHB', 'm550fehm050_Test_HPG_base_TAMS', 'm550fehm050_Test_HPG_base_ZAHB', 'm550fehp050_Test_HPG_base_TAMS', 'm550fehp050_Test_HPG_base_ZAHB', 'm560fehm000_Test_HPG_base_TAMS', 'm560fehm000_Test_HPG_base_ZAHB', 'm560fehm050_Test_HPG_base_TAMS', 'm560fehm050_Test_HPG_base_ZAHB', 'm560fehp050_Test_HPG_base_TAMS', 'm560fehp050_Test_HPG_base_ZAHB', 'm570fehm000_Test_HPG_base_TAMS', 'm570fehm000_Test_HPG_base_ZAHB', 'm570fehm050_Test_HPG_base_TAMS', 'm570fehm050_Test_HPG_base_ZAHB', 'm570fehp050_Test_HPG_base_TAMS', 'm570fehp050_Test_HPG_base_ZAHB', 'm580fehm000_Test_HPG_base_TAMS', 'm580fehm000_Test_HPG_base_ZAHB', 'm580fehm050_Test_HPG_base_TAMS', 'm580fehm050_Test_HPG_base_ZAHB', 'm580fehp050_Test_HPG_base_TAMS', 'm580fehp050_Test_HPG_base_ZAHB', 'm590fehm000_Test_HPG_base_TAMS', 'm590fehm000_Test_HPG_base_ZAHB', 'm590fehm050_Test_HPG_base_TAMS', 'm590fehm050_Test_HPG_base_ZAHB', 'm590fehp050_Test_HPG_base_TAMS', 'm590fehp050_Test_HPG_base_ZAHB', 'm600fehm000_Test_HPG_base_TAMS', 'm600fehm000_Test_HPG_base_ZAHB', 'm600fehm050_Test_HPG_base_TAMS', 'm600fehm050_Test_HPG_base_ZAHB', 'm600fehp050_Test_HPG_base_TAMS', 'm600fehp050_Test_HPG_base_ZAHB', 'm610fehm000_Test_HPG_base_TAMS', 'm610fehm000_Test_HPG_base_ZAHB', 'm610fehm050_Test_HPG_base_TAMS', 'm610fehm050_Test_HPG_base_ZAHB', 'm610fehp050_Test_HPG_base_TAMS', 'm610fehp050_Test_HPG_base_ZAHB', 'm620fehm000_Test_HPG_base_TAMS', 'm620fehm000_Test_HPG_base_ZAHB', 'm620fehm050_Test_HPG_base_TAMS', 'm620fehm050_Test_HPG_base_ZAHB', 'm620fehp050_Test_HPG_base_TAMS', 'm620fehp050_Test_HPG_base_ZAHB', 'm630fehm000_Test_HPG_base_TAMS', 'm630fehm000_Test_HPG_base_ZAHB', 'm630fehm050_Test_HPG_base_TAMS', 'm630fehm050_Test_HPG_base_ZAHB', 'm630fehp050_Test_HPG_base_TAMS', 'm630fehp050_Test_HPG_base_ZAHB', 'm640fehm000_Test_HPG_base_TAMS', 'm640fehm000_Test_HPG_base_ZAHB', 'm640fehm050_Test_HPG_base_TAMS', 'm640fehm050_Test_HPG_base_ZAHB', 'm640fehp050_Test_HPG_base_TAMS', 'm640fehp050_Test_HPG_base_ZAHB', 'm650fehm000_Test_HPG_base_TAMS', 'm650fehm000_Test_HPG_base_ZAHB', 'm650fehm050_Test_HPG_base_TAMS', 'm650fehm050_Test_HPG_base_ZAHB', 'm650fehp050_Test_HPG_base_TAMS', 'm650fehp050_Test_HPG_base_ZAHB', 'm660fehm000_Test_HPG_base_TAMS', 'm660fehm000_Test_HPG_base_ZAHB', 'm660fehm050_Test_HPG_base_TAMS', 'm660fehm050_Test_HPG_base_ZAHB', 'm660fehp050_Test_HPG_base_TAMS', 'm660fehp050_Test_HPG_base_ZAHB', 'm670fehm000_Test_HPG_base_TAMS', 'm670fehm000_Test_HPG_base_ZAHB', 'm670fehm050_Test_HPG_base_TAMS', 'm670fehm050_Test_HPG_base_ZAHB', 'm670fehp050_Test_HPG_base_TAMS', 'm670fehp050_Test_HPG_base_ZAHB', 'm680fehm000_Test_HPG_base_TAMS', 'm680fehm000_Test_HPG_base_ZAHB', 'm680fehm050_Test_HPG_base_TAMS', 'm680fehm050_Test_HPG_base_ZAHB', 'm680fehp050_Test_HPG_base_TAMS', 'm680fehp050_Test_HPG_base_ZAHB', 'm690fehm000_Test_HPG_base_TAMS', 'm690fehm000_Test_HPG_base_ZAHB', 'm690fehm050_Test_HPG_base_TAMS', 'm690fehm050_Test_HPG_base_ZAHB', 'm690fehp050_Test_HPG_base_TAMS', 'm690fehp050_Test_HPG_base_ZAHB', 'm700fehm000_Test_HPG_base_TAMS', 'm700fehm000_Test_HPG_base_ZAHB', 'm700fehm050_Test_HPG_base_TAMS', 'm700fehm050_Test_HPG_base_ZAHB', 'm700fehp050_Test_HPG_base_TAMS', 'm700fehp050_Test_HPG_base_ZAHB', 'm710fehm000_Test_HPG_base_TAMS', 'm710fehm000_Test_HPG_base_ZAHB', 'm710fehm050_Test_HPG_base_TAMS', 'm710fehm050_Test_HPG_base_ZAHB', 'm710fehp050_Test_HPG_base_TAMS', 'm710fehp050_Test_HPG_base_ZAHB', 'm720fehm000_Test_HPG_base_TAMS', 'm720fehm000_Test_HPG_base_ZAHB', 'm720fehm050_Test_HPG_base_TAMS', 'm720fehm050_Test_HPG_base_ZAHB', 'm720fehp050_Test_HPG_base_TAMS', 'm720fehp050_Test_HPG_base_ZAHB', 'm730fehm000_Test_HPG_base_TAMS', 'm730fehm000_Test_HPG_base_ZAHB', 'm730fehm050_Test_HPG_base_TAMS', 'm730fehm050_Test_HPG_base_ZAHB', 'm730fehp050_Test_HPG_base_TAMS', 'm730fehp050_Test_HPG_base_ZAHB', 'm740fehm000_Test_HPG_base_TAMS', 'm740fehm000_Test_HPG_base_ZAHB', 'm740fehm050_Test_HPG_base_TAMS', 'm740fehm050_Test_HPG_base_ZAHB', 'm740fehp050_Test_HPG_base_TAMS', 'm740fehp050_Test_HPG_base_ZAHB', 'm750fehm000_Test_HPG_base_TAMS', 'm750fehm000_Test_HPG_base_ZAHB', 'm750fehm050_Test_HPG_base_TAMS', 'm750fehm050_Test_HPG_base_ZAHB', 'm750fehp050_Test_HPG_base_TAMS', 'm750fehp050_Test_HPG_base_ZAHB', 'm760fehm000_Test_HPG_base_TAMS', 'm760fehm000_Test_HPG_base_ZAHB', 'm760fehm050_Test_HPG_base_TAMS', 'm760fehm050_Test_HPG_base_ZAHB', 'm760fehp050_Test_HPG_base_TAMS', 'm760fehp050_Test_HPG_base_ZAHB', 'm770fehm000_Test_HPG_base_TAMS', 'm770fehm000_Test_HPG_base_ZAHB', 'm770fehm050_Test_HPG_base_TAMS', 'm770fehm050_Test_HPG_base_ZAHB', 'm770fehp050_Test_HPG_base_TAMS', 'm770fehp050_Test_HPG_base_ZAHB', 'm780fehm000_Test_HPG_base_TAMS', 'm780fehm000_Test_HPG_base_ZAHB', 'm780fehm050_Test_HPG_base_TAMS', 'm780fehm050_Test_HPG_base_ZAHB', 'm780fehp050_Test_HPG_base_TAMS', 'm780fehp050_Test_HPG_base_ZAHB', 'm790fehm000_Test_HPG_base_TAMS', 'm790fehm000_Test_HPG_base_ZAHB', 'm790fehm050_Test_HPG_base_TAMS', 'm790fehm050_Test_HPG_base_ZAHB', 'm790fehp050_Test_HPG_base_TAMS', 'm790fehp050_Test_HPG_base_ZAHB', 'm800fehm000_Test_HPG_base_TAMS', 'm800fehm000_Test_HPG_base_ZAHB', 'm800fehm050_Test_HPG_base_TAMS', 'm800fehm050_Test_HPG_base_ZAHB', 'm800fehp050_Test_HPG_base_TAMS', 'm800fehp050_Test_HPG_base_ZAHB' $
    ]
if gtype eq 'WriteOutStates' then begin
    xmin=3.78;3.74
    xmax=3.6; 3.6;3.755; 55;
    ymin=-1.0;1.9
    ymax=2.0;2.5
endif
endif



if type eq 'LeslieGrid1test' then begin
    datadirectory= '~/EVOLUTION/output/YREC_Leslie_Tracks1/'
    infiles=[ $
'm100fehm000_Test_HPG_base_ZAHB', 'm100fehm050_Test_HPG_base_ZAHB', 'm100fehm100_Test_HPG_base_ZAHB', 'm100fehm200_Test_HPG_base_ZAHB', 'm100fehp050_Test_HPG_base_ZAHB' $
             ]

    outfile= 'LeslieYrec1test'
    outtext=''
    textperrun=[ $
  'm100fehm000_Test_HPG_base_ZAHB', 'm100fehm050_Test_HPG_base_ZAHB', 'm100fehm100_Test_HPG_base_ZAHB', 'm100fehm200_Test_HPG_base_ZAHB', 'm100fehp050_Test_HPG_base_ZAHB'$
    ]
if gtype eq 'WriteOutStates' then begin
    xmin=3.78;3.74
    xmax=3.6; 3.6;3.755; 55;
    ymin=-1.0;1.9
    ymax=2.0;2.5
endif
endif




title=outfile
if gtype eq 'Track' then begin

         outfile=outfile+'track.ps'
         GraphTrackModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RTracknopms' then begin

         outfile=outfile+'Rtracknopms.ps'
         GraphRadiusTracknopmsModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Tracknopms' then begin

         outfile=outfile+'tracknopms.ps'
         GraphTracknopmsModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'DeltaTeffFeH' then begin

         outfile=outfile+'DeltaTeffFeH.ps'
         GraphDeltaTeffFeHModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Tracklin' then begin

         outfile=outfile+'tracklin.ps'
         GraphTracklinearModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'TrackConv' then begin

         outfile=outfile+'trackconv.ps'
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
if gtype eq 'CoreRPub' then begin
        outfile=outfile+'coreRPub.ps'
        GraphCoreRPubModel, type, outdirectory, datadirectory, infiles, $
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
if gtype eq 'TeffLoggData' then begin
        outfile=outfile+'TeffLoggData.ps'
        GraphTeffLoggModelData, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'RadiusAge' then begin
        outfile=outfile+'RadiusAge.ps'
        GraphRadiusAgeModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'TeffLoggDiff2' then begin
        outfile=outfile+'TeffLoggDiff2.ps'
        GraphTeffLoggDiff2Model, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Li' then begin
        outfile=outfile+'Li.ps'
        GraphLiModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'C1213' then begin
        outfile=outfile+'C1213.ps'
        GraphC1213Model, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'CN' then begin
        outfile=outfile+'CN.ps'
        GraphCNModel, type, outdirectory, datadirectory, infiles, $
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
if gtype eq 'LiLogg' then begin
        outfile=outfile+'LiLogg.ps'
        GraphLiLoggModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'LiMass' then begin
        outfile=outfile+'LiMass.ps'
        GraphLiMassModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'LiAge' then begin
        outfile=outfile+'LiAge.ps'
        GraphLiAgeModel, type, outdirectory, datadirectory, infiles, $
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
if gtype eq 'BCZLogg' then begin
        outfile=outfile+'BCZLogg.ps'
        GraphBCZLoggModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Age' then begin

         outfile=outfile+'age.ps'
         GraphAgeModel, type, outdirectory, datadirectory, infiles, $
            outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'Deg' then begin
        outfile=outfile+'Deg.ps'
        GraphDegModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'write' then begin
        outfile=outfile+'WriteOut.txt'
        WriteOutModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif
if gtype eq 'WriteOutStates' then begin
        outfile=outfile+'WriteOutStates.txt'
        WriteOutStatesModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
endif

end
