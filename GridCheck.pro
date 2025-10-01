pro GridCheck, dir
;
;  Jamie Tayar OSU 3/25/2013
;  Examine the results of an MZYa grid
;  Mark which models ran at all and which 
;  of those ran up the giant branch
;
;  GridCheck, 'nodiff/nodiff_out'

tvlct, 255,0,0,100
tvlct, 0,255,0,101
tvlct, 0,0,255,102
tvlct, 20,23,56,103

cd, '~/EVOLUTION/output/YRECgrid'
cd, dir


mmin=.5
mmax=3.2
zhmin=-2.5
zhmax=0.5
mmax=mmax+.3
goodalph='00'  ;need to do 06
rtype='grnodf'

filesearchname='*al'+goodalph+'*'+rtype+'.track'
;filesearchname='m110zhp040y264a18al00_*.track'
;filesearchname='*.track'
infiles=file_search(filesearchname)

; SET UP PLOT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   yrang=(zhmax-zhmin)
   xrang=(mmax-mmin)
   set_plot, 'ps'
   device, file='Gridcheckal'+goodalph+'.ps', $
         /inches, /encapsulated, xsize=6, $
         ysize=5, /portrait, /color
   
    plot,  [mmin, mmax], [zhmin,zhmax], /nodata, $
         TITLE=dir+'alpha'+goodalph, $
         XTITLE="Mass (Msun)", $
         YTITLE="[Fe/H]", xstyle=1, $
         ystyle=1, xthick=5, ythick=5, $
;         charsize=2.3,$ 
         charthick=5, $
;         xticks=2, yticks=2, $
         xrange=[mmin, mmax], yrange=[zhmin, zhmax]

;    print, outtext


for i=0, n_elements(infiles)-1 do begin
              Age=[0, 0.00000000000001]
          readcol2, infiles[i], skipline=14, $
                
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
 ;this read in is wrong, se coreAngMomPlotter  ; FIXED 15/3/27

; parse string

massp=float(strmid(infiles[i], 1, 3))/100.
zhp=float(strmid(infiles[i],7, 3))/100.
sign=strmid(infiles[i], 6,1)
if sign eq 'm' then zhp=-1.0*zhp

alpha='00'
alphacheck=strmid(infiles[i], 17,2)
if alphacheck eq 'al' then alpha=(strmid(infiles[i],19,2))

yp=float(strmid(infiles[i],11, 3))/1000.
ap=float(strmid(infiles[i],15, 2))/10.

HEdiff=CY(n_elements(CY)-2)-CY(n_elements(CY)-1)
if CY(n_elements(CY)-1) lt .1 then HEdiff=1


;GB=ClogRHO(n_elements(ClogRHO)-1)  ; old and stupid density 10^6=strong degeneracy, 4=normal, so use 5 as cutoff?
MS=where(CX lt (CX[0]-0.1))
MS=MS[0]
GB= -1
if MS gt 2 then GB=where(CX lt 0.01 and logLLsun gt 2.9)
GB=GB[0]
if ap le 1.6 then colorz=100
if (ap gt 1.6 and ap lt 1.9) then colorz=101
if ap ge 1.9 then colorz=102

if yp le .25 then sym=4
if yp eq .264 then sym=5
if yp ge .27 then sym=6





if MS gt 2 && alpha eq goodalph then oplot, [massp+(ap-1.8)/0.5*.03], [zhp+(yp-.264)/.015*.06], color=colorz, psym=sym 

if MS gt 2 && (GB gt 2 || HEdiff gt 0) && alpha eq goodalph then oplot, [massp+(ap-1.8)/0.5*.03], [zhp+(yp-.264)/.015*.06], color=colorz, psym=2 

;if GB gt 0 && alpha eq '02' then oplot,  [massp+(ap-1.8)/0.5*.03], [zhp+(yp-.264)/.015*.06], color=103, psym=1 

end

legend, ['ML=1.3', 'ML=1.8', 'ML=2.3', 'Y=.249', 'Y=.264', $
        'Y=.279', 'GB'], psym=[4,4,4,4,5,6,2], $
        colors=[100,101,102,100,100,100,100],/right_legend


device, /close
cd, '~/EVOLUTION/output/idl'
set_plot, 'x'
end
