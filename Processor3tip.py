## This program will interpolate in Jamie's grid of models.

import sys, os
from time import time
from numpy import loadtxt, arange, linspace, array, log10, average
import matplotlib.pyplot as plt
from scipy.interpolate import UnivariateSpline as US
from numpy.linalg import inv

def model_read(fname,LOGGS,IntInds):
	## Make a vector to save the indicies.
	logg_is = []
	## Set a counter, and collect the first logg.
	l = 0
	LOGG = LOGGS[l]
	## Open the model.
	with open(fname) as f:
		for i, line in enumerate(f):
			## Skip the header.
			if line[0] == '#': continue
			## Check if core X is exhausted.
			corex = float(line[267:281])
			if corex > 0.05: continue
			## If corex okay, find the right logg.
			g0 = line[67:81]
			if float(g0) < LOGG:
				## We've found a logg. Save the location, and go to the next.
				logg_is.append(i)
				l+=1
				## If we're at the last logg, quit.
				if l == len(LOGGS): break
				## Get the next logg.
				LOGG = LOGGS[l]
				## Ensure that the next logg doesn't need the same index.
				Loop = True
				while Loop:
					if float(g0) > LOGG: Loop = False
					else:
						logg_is.append(i)
						l+=1
						LOGG = LOGGS[l]

	## Some models will be empty...for some reason. If you
	## encounter this, just return a string, which will be
	## be interpreted as "do not make model."
	if len(logg_is) == 0:
		return 'fail!'

	## Make a vector for saving active values.
	active = []
	## Create vectors to save the interpolation products.
	TEFFS = []
	for II in IntInds:
		vars()['ALL_'+str(II[0])+'_'+str(II[1])] = []

	with open(fname) as f:
		for j, line in enumerate(f):
			## First check if any new triggers have gone off.
			if j+2 in logg_is: ## yes!!
				## Collect the index of this number.
				k = str(logg_is.index(j+2))
				## Make the new storage vectors for logg, teff, and others.
				vars()['gravs_'+k] = []
				vars()['teffs_'+k] = []
				for II in IntInds:
					vars()[str(II[0])+'_'+str(II[1])+'_'+k] = []
				## Make this index active.
				active.append(k)

			## Check if any counters have reached 0. If so, do the
			## interpolation, and save the results.
			if j-2 in logg_is:
				## Determine how many points can be interpolated
				## from this vector.
				k = str(logg_is.index(j-2))
				num = logg_is.count(j-2)
				## Do the interpolation for each in turn.
				for n in range(num):
					## Collect the vectors.
					gravs = vars()['gravs_'+k][::-1]
					teffs = vars()['teffs_'+k][::-1]
					## Interpolate to Teff. Make sure to use LOGGS[k+n], to
					## account for the possibility of multiple interpolations
					## with the same vectors.
					## JNT 2022-05-20 add try except to deal with small spacings including reversed direction of track around the bump
					try: 
						TEFF = US(gravs[::-1],teffs[::-1],k=3,s=0)(LOGGS[int(k)+n])
						TEFFS.append(10.**float(TEFF))
						for II in IntInds:
							vect = vars()[str(II[0])+'_'+str(II[1])+'_'+k][::-1]
							#print IntInds.index(II), gravs,vect
							Val = US(gravs,vect,k=3,s=0)(LOGGS[int(k)+n])
							vars()['ALL_'+str(II[0])+'_'+str(II[1])].append(float(Val))
					except: 
						#print( 'logg bad ', (LOGGS[int(k)+n]))
						try:
							TEFF = US(gravs,teffs,k=3,s=0)(LOGGS[int(k)+n])
							TEFFS.append(10.**float(TEFF))
							for II in IntInds:
								vect = vars()[str(II[0])+'_'+str(II[1])+'_'+k][::-1]
								#print IntInds.index(II), gravs,vect
								Val = US(gravs,vect,k=3,s=0)(LOGGS[int(k)+n])
								vars()['ALL_'+str(II[0])+'_'+str(II[1])].append(float(Val))
						except:
							print( 'logg bad ', (LOGGS[int(k)+n]))
							
#					## Interpolate to the other variables.
#					for II in IntInds:
#						vect = vars()[str(II[0])+'_'+str(II[1])+'_'+k][::-1]
#						#print IntInds.index(II), gravs,vect
#						Val = US(gravs,vect,k=3,s=0)(LOGGS[int(k)+n])
#						vars()['ALL_'+str(II[0])+'_'+str(II[1])].append(float(Val))
				## Make this index inactive.
				del active[active.index(k)]

			## Check if we have any active indicies. If so, read the
			## values out of the line, and same them to vectors.
			if len(active) > 0:
				for k in active:
					vars()['gravs_'+k].append(float(line[67:81]))
					vars()['teffs_'+k].append(float(line[83:97]))
					for II in IntInds:
						i1, i2 = II[0], II[1]
						name = str(i1)+'_'+str(i2)+'_'+k
						vars()[name].append(float(line[i1:i2]))

			## Check if we've reached the end. If so, quit.
			if len(TEFFS) == len(logg_is): break

	## Return a vector of vectors.
	AllReturn = []
	AllReturn.append(TEFFS)
	for II in IntInds:
		VECT = vars()['ALL_'+str(II[0])+'_'+str(II[1])]
		AllReturn.append(VECT)
	return AllReturn

def interpolator():

	PRINT = True

	Header = '     Step    Shls     Age_(Gyr)     log(L/Lsun)     log(R/Rsun)        log(g)        log(Teff)       Mconv.core      Mconv.env     Rcore     Tcore      Rho_core     P_core     kappa_env    log(T)_cen     log(Rho)_cen     log(P)_cen        BETA             ETA            X_cen           Y_cen           Z_cen          ppI_lum         ppII_lum       ppIII_lum        CNO_lum       3-alpha_lum       He-C_lum        gravity        OLDNUTRINOS    Cl_SNU     GaSNU    **pp**    **pep**   **hep**   **Be7**   **B8**    **N13**   **O15**   **F17**  **diag1** **diag2**      He3_cen        C12_cen         C13_cen         N14_cen         B10_cen         O16_cen         B11_cen         O18_cen         He3_surf        C12_surf        C13_surf        N14_surf        B10_surf        O16_surf        B11_surf        O18_surf        H2_surf         Li6_surf        Li7_surf        Be9_surf         X_surf          Y_surf          Z_surf         Z/X_surf          Jtot         KE_rot_tot       total_I           CZ_I         Omega_surf      Omega_cen       Prot_(days)     Vrot_(km/s)     TauCZ_(s)       Mfrac_base      Mfrac_midp      Mfrac_top       Rfrac_base      Rfrac_midp      Rfrac_top         P_phot           Mass     '
	ExLine = '     2923    1517  7.88529915E+00  5.07556705E-01  2.67977938E-01  3.94356753E+00  3.75420831E+00  0.10000000E+00  3.26482965E-02  1.2262  1.6600E+06  3.8799E-02  8.7321E+12  1.5018E+01  7.32700592E+00  3.46963702E+00  1.86593097E+01  9.99887681E-01  1.20821094E+00  0.20000000E+00  9.83530005E-01  1.64699951E-02  7.37590673E-01  5.85978589E-01  7.54855260E-03  1.89753481E+00  0.30000000E+00  0.40000000E+00 -1.08699752E-02  0.50000000E+00 0.000E+00 0.000E+00 0.000E+00 0.000E+00 0.000E+00 0.000E+00 0.000E+00 0.000E+00 0.000E+00 0.000E+00 0.000E+00 0.000E+00  0.65800000E+00  3.13824811E-05  7.11412449E-06  9.48273794E-03  0.71200000E+00  9.76093927E-04  0.82400000E+00  1.91134490E-05  5.20385949E-05  1.38265511E-03  1.55326071E-05  4.09640871E-04  0.00052401E+00  9.53328971E-03  0.04800001E+00  1.91134491E-05  0.00000124E+00  0.00000322E+00  1.08478909E-09  2.99603710E-11  7.19522462E-01  2.63955501E-01  1.64700001E-02  2.28901819E-02  0.00856000E+00  0.00074000E+00  1.80929180E+54  4.19367166E+53  0.00000260E+00  0.00000270E+00  0.00000280E+00  0.00000290E+00  1.30330910E+06  6.71736739E-02  1.50482618E-01  5.49951840E-01  1.60600615E+09  3.12213478E+09  1.13261601E+10  4.66337379E+00  1.10000000E+00'
	DesiredLines = (3,52,53,54,63)
#	DesiredLines = (3, 4, 5, 8, 9, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 43, 44, 45, 46, 48, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 69, 70, 75, 82)

	## What LogGs do you want interpolated to?
	LOGGS = arange(-10.0,2.50001,0.005)[::-1] # arange(-10.0,4.00001,0.02)[::-1]

	## Point to the grid location.
#	grid_loc = '/home/spitzer/tayar/EVOLUTION/output/YRECgrid/nodiff/nodiff_out3/'
#	grid_loc = '/data/zuul/0/tayar/YRECgrid/nodiff_out4z/'
	grid_loc = '/home/jtayar/EVOLUTION/zuul/0/tayar/YRECgrid/nodiff_out4z/'


	## Point to where you want to output the models.
#	outloc = '/home/newton/somers/Documents/FeH_ML_Interpolator/ProcessedMods/NewBigGrid/'
#	outloc = '/home/spitzer/tayar/Documents/MixingLength/Garrett/ProcessedMods/NewBigGrid/'
	outloc = '/home/jtayar/Documents/MixingLength/Garrett/ProcessedMods/NewBigGridTip/'


	## Define the grids, and set the desired interpolation order IO.
	grid_mass = (0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.4,2.5,2.6)
	name_mass = ('060','070','080','090','100','110','120','130','140','150','160','170','180','190','200','210','220','230','240','250','260')
	N_mass = len(name_mass)

	grid_feoh = (-2.0,-1.8,-1.6,-1.4,-1.2,-1.0,-0.8,-0.6,-0.4,-0.2,0.0,0.2,0.4,0.6)
	name_feoh = ('m200','m180','m160','m140','m120','m100','m080','m060','m040','m020','m000','p020','p040','p060')
	N_feoh = len(name_feoh)

	grid_alfe = (0.0,0.2,0.4)
	name_alfe = ('00','02','04')
	N_alfe = len(name_alfe)

#	grid_alml = (1.2,1.754,2.2)
	grid_alml = (1.224485,1.724485,2.224485)
	name_alml = ('12','17','22')
	N_alml = len(name_alml)

#	grid_heli = (0.249585,0.264585,0.279585,0.324585)
#	name_heli = ('250','265','280','325')
	grid_heli = (0.239,0.272683,0.290,0.330)
	name_heli = ('239','273','290','330')
	N_heli = len(name_heli)

	##################################################################################

	## Figure out the indicies desired.
	InterpIndicies = []
	InterpHeaders = []
	for DL in DesiredLines:
		val = ExLine.split()[DL-1]	
		InterpIndicies.append([ExLine.find(val),ExLine.find(val)+len(val)])
		InterpHeaders.append(Header.split()[DL-1])
	## Generate the header to be continuously written out later.
	names = '# logg            Teff            '
	for IH in InterpHeaders:
		names += '%-16s'%IH
	names += '\n'
	## Open the list of fails, so we can skip them. If nonexistant,
	## make it.
	try: failnames = open(outloc+'aaa_EmptyTracks.txt').readlines()
	except IOError:
		open(outloc+'aaa_EmptyTracks.txt','w')
		failnames = []

	AllTimes = []

	## Determine the number of mods to be run.
	ModNum = len(grid_mass)*len(grid_feoh)*len(grid_alfe)*len(grid_alml)*len(grid_heli)

	t1 = time()
	zzz = 0
	for i in range(len(grid_alml)):
		## Retrieve the name of the mixing length specification.
		alml, alml_name = grid_alml[i], name_alml[i]
		## Run through helium abundances.
		for m in range(len(grid_heli)):
			heli, heli_name = grid_heli[m], name_heli[m]
			## Run through [Al/Fe].
			for j in range(len(grid_alfe)):
				alfe, alfe_name = grid_alfe[j], name_alfe[j]
				## Run through [Fe/H]
				for k in range(len(grid_feoh)):
					feoh, feoh_name = grid_feoh[k], name_feoh[k]	
					## Run through mass.
					for l in range(len(grid_mass)):
						mass, mass_name = grid_mass[l], name_mass[l]
						zzz += 1
						## Assemble the file name.
						fname  = 'm'+mass_name
						fname += 'fh'+feoh_name
						fname += 'y'+heli_name
						fname += 'a'+alml_name
						fname += 'al'+alfe_name
						fname += '_grnodf.track'
						## Make sure the file exists.
						if not os.path.exists(grid_loc+fname):
							print (fname, 'nonexistant...')
							continue
						## Make sure we haven't made this one already.
						if os.path.exists(outloc+fname):
							print (fname, 'already made!')
							continue
						## Make sure this isn't a previous failure. If so, skip.
#						if fname+'\n' in failnames:
#							print fname, 'already failed. skipping!'
#							continue
						#print 'processing', fname, '(', zzz, '/', ModNum, ')'
						## Now read in the desired Teff and Logg values. Also,
						## pass a flag which says whether to int Age, C/N.
						ttt = time()
						teffs = model_read(grid_loc+fname,LOGGS,InterpIndicies)
						## Check for the failure mode where the model was empty.
						## If yes, record the name for later info.
						if teffs == 'fail!':
							print ('no', fname, '!')
							open(outloc+'/aaa_EmptyTracks.txt','a').writelines(fname+'\n')
							continue
						else: 
							print ('processed', fname, '(', zzz, '/', ModNum, ')')
						## Now write out the interpolation product names.
						outlines = [names,]
						## Make each line and append to outlines.
						for a in range(len(teffs[0])):
							line = '%14.6e' % LOGGS[a]
							for b in range(len(teffs)):
								line += '%16.6e' % (teffs[b][a])
							if a != len(teffs[0])-1: line = line + '\n'
							outlines.append(line)
						## Write outlines to a file, if desired.
						if PRINT: open(outloc+fname,'w').writelines(outlines)
						#sys.exit()

						AllTimes.append(time()-ttt)
						#sys.exit()



						#################################################
						## Report the finished model for sanity purposes.
						#print fname, 'complete! '
						#zzz+=1
						#print zzz, '/', ModNum
						#################################################
					##################################################################################################



	##################################################################################


if __name__ == '__main__':

	interpolator()






















































