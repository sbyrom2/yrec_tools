pro GraphTeffLoggModelData, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title
tvlct,255,0,0,100
tvlct,0,0,255,101
tvlct,255,255,0,102
tvlct,0,255,255,103
tvlct,255,0,255,104
tvlct,0,255,0,105
tvlct,70,70,70,106

datatype='tess';'nlte' ;'lte' ; 'nlte'
colortype='rot'  ;mass, feh, rot
vsinilim=20

   Omsun=2.86e-6  ; Denissenkov2010 page 3
   Rsuncm=6.958e10
   Gcgs=6.67259e-8
   Msung=1.99e33
   Rsun=6.958e5
;;; WRONG   Lisun=5.7474e-11 ;Asplund etal2009
   Lisun=6.74e-10   ;from MP's calibrations
; SET UP PLOT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   yrang=(ymax-ymin)
   xrang=(xmax-xmin)
   set_plot, 'ps'
   device, file=outdirectory+datatype+outfile, $
         /inches, /encapsulated, /color, xsize=8, $
         ysize=5, /portrait
   
    plot,  [xmin, xmax], [ymin,ymax], /nodata, $
         TITLE=datatype, $
         XTITLE="Teff", $
         YTITLE="log(g)", xstyle=1, $
         ystyle=1, xthick=5, ythick=5, $
         charsize=2.3, charthick=5, $
         xticks=4, xminor=10, $; yticks=4, $
         xrange=[xmin, xmax], yrange=[ymin, ymax];, $
;         /ylog ;,
;         /xlog, $
;         ytickv=[10, 100, 400], $
;         xtickv=[3,4,5,6,8,10,12,15]
    xyouts,  xmin+(.2*xrang), ymax-ALOG10(.1*yrang), outtext, charsize=1, $
         charthick=2
;    print, outtext
; LOOP THROUGH TO READ IN AND PLOT EACH EVOLUTION RUN'S DATA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    for i=0, n_elements(infiles)-1 do begin
         file=datadirectory+infiles[i]+'.track'
            ;        s1={model:0, shells:0, Age:0.0, logLLsun:0.0, $
            ;             logRRsun:0.0, logg:0.0, logTeff:0.0, Mccore:0.0, $
            ;             Mcenv:0.0, R:0.0, T:0.0, Rho:0.0, P:0.0, $
            ;             cappaenv:0.0, ClogT:0.0, ClogRHO:0.0, $
            ;             ClogP:0.0, CBETA:0.0, CETA:0.0,CX:0.0, $
            ;             CY:0.0, CZ:0.0, LppI:0.0, LppII:0.0, LppIII:0.0, $
            ;             LCNO:0.0, Ltripalpha:0.0, LHeC:0.0, Lgrav:0.0, $
            ;             Lneutrinos:0.0}
           n_lines=file_lines(file)-hlines
            ;         data=replicate(s1,n_lines)
            ;         print, file, n_lines
            ;         openr, lun, file, /get_lun , /SWAP_IF_LITTLE_ENDIAN;, $
            ;               /F77_unformatted, 
            ;         readu, lun, data
            ;         close, lun
            ;         free_lun, lun

          readcol2, file, skipline=14, $
                
                model, shells, Age, logLLsun, logRRsun, $
               logg, logTeff, Mccore, $
               Mcenv, R, T, Rho, P, $
               cappaenv, $
               ClogT, ClogRHO, $
               ClogP, CBETA, CETA,CX, $
               CY, CZ, LppI, LppII, LppIII, $
               LCNO, Ltripalpha, LHeC, Lgrav, $
               Lneutrinos, clSNU, GaSNU,$
               pp, pep, hep, Be7, B8, N13, O15, F17, diag1, diag2,$
               cHe3, cC12, cC13, cN14, cN15, cO16, cO17, cO18, $
               sHe3, sC12, sC13, sN14, sN15, sO16, sO17,sO18, sH2, $
               sLi6, sLi7, sBe9, $
               sX, sY, sZ, sZovrX, $
               Jtot, KErottot, totalI, CZI, Omsurface, Omcenter, $ ;FIXED 10/8
               Prot, Vrot, TauCZ, Hshellmfracbase, Hshellmfracmidpoint, $
               Hshellmfractop,  rfracbase, rfracmidpoint, rfractop, $
               Pphot, mass, $
           FORMAT="F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,D,D,D,D,D,F,F,F,F,F,F,F,F,F,F,F,F,F"

Vrot=Omsurface*10^(logRRsun)*Rsun

;ap=float(strmid(infiles[i],15, 2))/10.
;if ap le 1.3 then sym=4
;if ap eq 1.8 then 
;if ap ge 2.3 then 

yp=float(strmid(infiles[i],11, 3))/1000.
if yp le .25 then colorz=100
if yp gt .25 and yp lt .27 then colorz=101
if yp ge .27 then colorz=102

feh=float(strmid(infiles[i],7, 3))/100.
if ((strmid(infiles[i],6, 1)) eq 'm') then feh=-1.*feh
alpha=float(strmid(infiles[i],19,2))

;print, strmid(infiles[i],7, 3), feh

colorz=colorz+alpha*3.0/4.0 
atm=strmid(infiles[i],22,2)

if atm eq 'no' then colorz=colorz
if atm eq 'gr' then colorz=colorz+6
if atm eq 'ck' then colorz=colorz+4
if outfile eq 'PaulbasesTeffLogg.ps' then begin
   loadct, 34
   colorz=[(mass(0)-2.2)*255./(2.8-2.2)]
endif
if colortype eq 'feh' then begin
   loadct, 34
   colorz=[(feh+2.0)*255./(2.0-0.4)]
endif
if colortype eq 'rot' then begin
   loadct, 34
   colorz=[(Vrot)*255./(vsinilim)]
endif
   
 solage=where(Age ge .0001)
;good=where(Age gt .05)
 good=where(CX lt 0.6 and 10^logTeff lt xmin and 10^logTeff gt xmax and logg gt ymax and logg lt ymin)
if good[0] eq -1 then good=where(Age gt .005)

 clump=where(logRRsun(good)gt 0.027 and logRRsun(good)lt 0.03)
 clump=clump[0]
; print, 10^logTeff(good[0:3]),logg(good[0:3])
 n_lines2=n_elements(good)-1
 if solage(0) ne -1 then begin

          plots, 10^logTeff(good),logg(good), psym=3, color=colorz
          xyouts,10^logTeff(good(n_lines2)), logg(good(n_lines2)), $
                textperrun(i), charsize=1, charthick=2
;          xyouts,10^logTeff(good(clump)),logg(good(clump)), $
;                textperrun(i), charsize=1, charthick=2
;print, 10^logRRsun(good(clump)),Age(good(clump)), 10^logTeff(good(clump)), logg(good(clump)) 
;wait, 100
     end
     end
; oplot, [5708], [4.344], psym=6, color=100
teffs=[5808, 5669, 6050, 5991, 5837, 6097]
loggs=[4.28, 4.07, 4.40, 4.09, 4.21, 4.00]
tefferr=[92, 97, 70, 124, 97, 130]
loggerr=[.21, .21, .08, .21, .22, .21]
kicnames=['4914923', '5184732','6106415', '6116048', '6933899', '10963065'] 
teffs=[5771.8, 5771.8]
loggs=[4.43812,4.43812]
tefferr=[0.7, 0.7]
loggerr=[0.00013, 0.00013]
;oploterror, teffs,  loggs,tefferr, loggerr, psym=3, color=100

if outfile eq 'PaulbasesTeffLogg.ps' then begin
   loadct, 34
   loggs= [2.5095456, 2.7789705, 2.8086717, 2.9731152, 2.7768106, 2.8549826, 2.9414923, 2.9495091, 2.7952685, 2.6147032, 2.5605512, 2.8310049, 3.3229847, 2.7489321, 3.1943035, 2.9689126, 3.0055976, 2.9692726, 2.618078, 2.805285, 2.6440217, 2.5289319, 2.9964566, 2.3617692, 2.8034787, 2.5590436, 2.8902276, 2.6213307, 2.6573982, 2.7676337, 2.7421103, 2.5535321, 2.9731152, 2.9692726, 2.805285, 2.8293681, 2.8861639, 2.876961, 2.6650748, 2.7948158, 2.6328142, 2.8936255 ] ; speclogg
   teffs=[4922.2062, 5052.1775, 4913.3318, 5038.6086, 5077.3936, 5159.175, 5143.4698, 5088.2152, 5004.7435, 5223.6491, 5034.1844, 5083.3, 5247.8518, 5018.9186, 5509.7203, 5008.3186, 5137.9756, 5129.7508, 4912.5757, 5109.131, 4912.2169, 4798.6669, 5165.8825, 4746.6615, 5197.8809, 5137.8632, 5044.3713, 5083.9483, 4975.215, 5122.8603, 5045.6145, 5007.0663, 5038.6086, 5129.7508, 5109.131, 5124.3466, 5063.629, 5045.9159, 4988.8991, 5035.9792, 4983.4648, 5074.1968] ;CorTeff13(post)
  plots, teffs, loggs, psym=sym(3)
endif

readcol, 'bergemannclusters.txt', cluster, teffnlte, loggnlte, fehnlte,  mgfenlte,  tefflte, logglte, fehlte, mgfelte, format='A,X,X,X, F,F,F,X,F,X,X,F,F,F,X,F,X,X'
teffnlte=teffnlte*1000
tefflte=tefflte*1000



if datatype eq 'lte' then begin
    good=where(tefflte lt xmin and tefflte gt xmax and logglte lt ymin and logglte gt ymax)
    plots, tefflte(good),logglte(good), psym=sym(1), color=[(fehlte(good)+2.0)*255./(2.0-0.4)]
endif
if datatype eq 'nlte' then begin
    good=where(teffnlte lt xmin and teffnlte gt xmax and loggnlte lt ymin and loggnlte gt ymax)
    plots, teffnlte(good),loggnlte(good), psym=sym(1), color=[(fehnlte(good)+2.0)*255./(2.0-0.4)]
endif
if datatype eq 'tess' then begin
    readcol, '~/Documents/TESS/APOGEE_dr16_c14.txt', tmassa, feha, loggfa, teffa, vsinia, loggca, logga, format='A,F,F,F,F,F,F'
    
    plots, teffa, logga, psym=sym(2), color=[vsinia*255/(vsinilim)]
    readcol, '~/Documents/TESS/APOGEE_sample_hermes_obs14gaia.txt', tich, tmassh, fehh, loggfh, teffh, vsinih, format='A, A,F,F,F,F'
    print, 'hermes', n_elements(tich)
    goodh=where(vsinih eq vsinih)
    plots, teffh(goodh), loggfh(goodh), psym=sym(3), color=[vsinih(goodh)*255/(vsinilim)]
    loadct, 0
    plots, teffh, loggfh, psym=sym(8)

    loadct, 34

; not working because T here is period, not temperature. There's probably one with temperatures somewhere
;    readcol, '~/EVOLUTION/output/idl/vsini13toprot_vgt5.txt', kic, tmass, vsini13, vsini13err, mSdw, rSdw, TSdw, mH14, rH14, TH14, format='A,A,F,F,F,F,F,F,F,F'
;    loggH14=Alog10(Gcgs*mH14*Msung/(rH14*Rsuncm)^2.)
;    print, loggH14(0:5), 'H14', TH14(0:5)
;    gH=where(rH14 gt 0)
;    plots,  TH14(gH),loggH14(gH), psym=sym(1), color=[vsini13*255/(vsinilim)]

;    loggSdw=Alog10(Gcgs*mSdw*Msung/(rSdw*Rsuncm)^2.)
;    gS=where(rSdw gt 0)
;    plots,  TSdw(gS), loggSdw(gS), psym=sym(4), color=[vsini13*255/(vsinilim)]
;    loadct, 0
;    for ik=0, n_elements(mSdw)-1 do begin
;       if (rSdw(ik) gt 0 and rH14(ik) gt 0) then oplot, [TH14(ik),loggH14(ik)], [TH14(ik),loggH14(ik)] 
;    end
loadct, 0
; connect points of the same star measured by both galah and apogee. 
    match2,tmassa, tmassh, f1, f2
    goodm=where(f1 ne -1)
;    print, tmassa((goodm)), tmassh(f1(goodm))
    for il=0, n_elements(goodm)-1 do begin
    oplot, [teffa(goodm(il)),teffh(f1(goodm(il)))], [logga(goodm(il)),loggfh(f1(goodm(il)))] 
    end


; connect stars with two different apogee observations on different loc-ids
    match2,tmassa, tmassa, f1, f2
    goodm=where(f1 ne -1)
;    print, tmassa((goodm)), tmassa(f1(goodm))
    for il=0, n_elements(goodm)-1 do begin
    oplot, [teffa(goodm(il)),teffa(f1(goodm(il)))], [logga(goodm(il)),logga(f1(goodm(il)))] 
    end

    loadct, 34

endif

if colortype eq 'rot' then begin
colorstring='v sin(i) '
colorlist=[0,vsinilim]
al_legend, [colorstring+string(max(colorlist)), $
                          colorstring+string(fix(.5*(max(colorlist)+min(colorlist)))), $
			colorstring+string(min(colorlist)),  'APOGEE', 'GALAH'],$
		        psym=[7,7,7,5, sym(8)], $
		        colors=[255,127,0, 0,0],/right_legend, /bottom_legend
endif


;xyouts, teffs, loggs, kicnames
;wait, 100
device, /close
loadct, 0
cd, '~/EVOLUTION/output/idl'
set_plot, 'x'
end
