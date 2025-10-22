pro WriteOutStatesModel, type, outdirectory, datadirectory, infiles, $
         outfile, outtext, textperrun, xmin, xmax, ymin, ymax, hlines, title

tvlct, [255],[0], [0], 100
    
   Omsun=2.86e-6  ; Denissenkov2010 page 3 in RADS/sec
   Msun=1.99e33
   Rsun=696000 ; km const sheet
   bigG=6.67259e-8

get_lun, lun
openw, lun, outdirectory+outfile, width=400
printf, lun, 'File  phase  mass  feh  logLLsun  logRRsun  Age  logTeff  logg Mccore  Mcenv  ClogRHO  ClogT CX  CY' 
close, lun
free_lun, lun

;get_lun, lun2
;openw, lun2, outdirectory+'Teff5000'+outfile, width=400
;printf, lun2, 'File, log10(L/Lsun), mass, log10(Teff), current surface [Fe/H], current surface Y, Age (Gyr), log(g)' 
;close, lun2
;free_lun, lun2

; LOOP THROUGH TO READ IN AND PLOT EACH EVOLUTION RUN'S DATA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
loadct,0
    for i=0, n_elements(infiles)-1 do begin
         file=datadirectory+infiles[i]+'.track'
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
lastmod=n_elements(model)-1
zams=where(CX lt CX[0]-0.01)
zams0=zams[0]
if CX[zams0] lt 0.5 then zams0 = -1
tams=where(CX lt 0.001)
tams0=tams[0]
if Ltripalpha[tams0] gt 0.001 then tams0=-1
heburn=where(Ltripalpha gt 0.001 and CY lt max(CY)-0.01)
heburn0=heburn[0]
beginclump=-1
if heburn0 ne -1 then begin
beginclump=where(logRRsun eq min(logRRsun(heburn0:lastmod)))
beginclump=beginclump[0]
endif
;difflogg=logg(beginclump+1:lastmod)-logg(beginclump:lastmod-1)
;endclump=where(difflogg gt 0)
;endclump=lastmod
;nohe=where(CY lt 0.01) 
;if nohe[0] ne -1 then endclump=nohe[0]
;tip=where(logRRsun eq max(logRRsun(heburn0:beginclump)))

feh=ALOG10(sZ/sX)-ALOG10(0.0231295562) ;change to use leslie's

infilelist=make_array(n_elements(Age), /string, value=infiles[i])

good=where(10.^logTeff gt 5000 and 10.^logTeff lt 6000 and CX lt CX[0]-0.01)
good1=good[0]
;print, infilelist(good1), feh(good1), sZ(good1), sX(good1)

;writecola, outdirectory+outfile, infilelist, logLLsun, mass, logTeff, feh, sY, Age, logg

if zams0 ne -1 then writecola, outdirectory+outfile, infilelist(zams0), ' zams ', mass(zams0), feh(zams0), logLLsun(zams0), logRRsun(zams0), Age(zams0), logTeff(zams0), logg(zams0), Mccore(zams0), Mcenv(zams0), ClogRHO(zams0), ClogT(zams0), CX(zams0), CY(zams0)
if tams0 ne -1 then writecola, outdirectory+outfile, infilelist(tams0), ' tams ', mass(tams0), feh(tams0), logLLsun(tams0), logRRsun(tams0), Age(tams0), logTeff(tams0), logg(tams0), Mccore(tams0), Mcenv(tams0), ClogRHO(tams0), ClogT(tams0), CX(tams0), CY(tams0)
if beginclump ne -1 then writecola, outdirectory+outfile, infilelist(beginclump), ' zahb ', mass(beginclump), feh(beginclump), logLLsun(beginclump), logRRsun(beginclump), Age(beginclump), logTeff(beginclump), logg(beginclump), Mccore(beginclump), Mcenv(beginclump), ClogRHO(beginclump), ClogT(beginclump), CX(beginclump), CY(beginclump)
 end
end


