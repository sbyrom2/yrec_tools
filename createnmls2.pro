pro createnmls2, olddirectory, oldn, newn, params, nvalues

; Jamie Tayar, OSU, 8/30/2012
; This program takes the old .nml1 and .nml2 files, copies+renames them to 
; /EVOLUTION/output, updates them for a new run with a 
; different name and copies the updated files to the code directory
; It requires the old and new run names as strings.  
; It also takes in the parameter name you want to change and 
; replaces it with the new value.  It also pauses 
; to allow you to update the paramters in the files for the run ; functionality off 9/25
;
; at some point I should probably code up an optional directory keyword
; for greater flexibility
;
; Make sure the oldn is not a substring of newn ;No longer a problem 9/17
;
; newn MUST be the same number of characters as oldn ; No longer true 9/25
;
; this version outputs the new files to the same directory as the old files


;  INPUTS
;;;;;;;;;;;;;;;;;


   if olddirectory ne '' and strmid(olddirectory, strlen(olddirectory)-1, 1) ne '/' then olddirectory=olddirectory+'/'
   newdirectory=olddirectory
;  COPY OLD FILES
;;;;;;;;;;;;;;;;;;;;;;
 
    cd, '~/EVOLUTION/output/'
    oldfile1= olddirectory+oldn+'yrec8.nml1'
    oldfile2= olddirectory+oldn+'yrec8.nml2'  
;    oldfile1= olddirectory+oldn+'.nml1'
;    oldfile2= olddirectory+oldn+'.nml2'  
    newfile1= newdirectory+newn+'yrec8.nml1'
    newfile2= newdirectory+newn+'yrec8.nml2'  
    file_copy, oldfile1, newfile1
    file_copy, oldfile2, newfile2
    

;  OPEN FILES+ REPLACE OLD NAMES in .NML1
;;;;;;;;;;;;;;;;;;;;;;;;;;

;     readline, newfile1, fileinfo
    readcol, newfile1, format='A', delimiter=':', fileinfo
    for j=0, n_elements(fileinfo)-1 do begin ; 
         filline=fileinfo(j)
         if (I=STRPOS(filline, oldn) NE -1) then begin
              bb=strsplit(filline, oldn, /EXTRACT, /REGEX)
              filline=bb(0)+newn+bb(1)
             
         endif
         fileinfo(j)=filline
    end
    for k=0, n_elements(params)-1 do begin
      param=params(k)+'='
      nvalue=nvalues(k)
      kk=0
      for j=0, n_elements(fileinfo)-1 do begin ; 
         filline=fileinfo(j)
         
         if strcmp (param, filline, strlen(param), /FOLD_CASE)  then begin
          if nvalue eq '' then begin
            filline=''
            kk=kk+1  
            if kk gt 1 then print, "too many things deleted, check for errors"
            print, filline 
          endif else if nvalue eq '2to1' then begin
            bb=strsplit(filline, '(2)', /EXTRACT, /REGEX)
            filline=bb(0)+'1'+bb(1)  ;not sure why there's no () here 
            kk=kk+1  
            if kk gt 1 then print, "too many things (2) to (1)nd, check for errors"
            print, filline 
          endif else begin
            filline=param+ ' '+strcompress(string(nvalue), /REMOVE_ALL);
            kk=kk+1  
            if kk gt 1 then print, "too many things replaced, check for errors"
             print, filline 
           endelse
         endif
          fileinfo(j)=filline
         
 ;      print, fileinfo(j) 
 ;        wait, 100
      end
   end
    writecol, newfile1, fmt=(A),fileinfo(0:j-1)
;  OPEN FILES+ REPLACE VALUES in .NML2
;;;;;;;;;;;;;;;;;;;;;;;;;;    

    readcol, newfile2, format='A', delimiter=':', fileinfo
    for k=0, n_elements(params)-1 do begin
      param=params(k)+'='
      nvalue=nvalues(k)
      kk=0
      for j=0, n_elements(fileinfo)-1 do begin ; 
         filline=fileinfo(j)
        if strcmp (param, filline, strlen(param), /FOLD_CASE)  then begin
          if nvalue eq '' then begin
            filline=''
            if kk gt 1 then print, "too many things deleted, check for errors"
            print, filline 
          endif else begin
            filline=param+ ' '+strcompress(string(nvalue), /REMOVE_ALL);
            kk=kk+1  
            if kk gt 1 then print, "too many things replaced, check for errors"
            print, filline  
           fileinfo(j)=filline
          endelse
         endif
       end
    end
    writecol, newfile2, fmt=(A),fileinfo(0:j-1)

; WAIT FOR USE TO MAKE ANY UPDATES
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    print, 'Make any necessary parameter changes in ~/EVOLUTION/output now'
;    print, 'Then hit any key'
;    wait=get_kbrd(1)

; COPY FILES TO /CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;   file_copy, newfile1, '~/EVOLUTION/code/yrec8.nml1',/overwrite
;   file_copy, newfile2, '~/EVOLUTION/code/yrec8.nml2', /overwrite

cd, '~/EVOLUTION/output/idl'

end
