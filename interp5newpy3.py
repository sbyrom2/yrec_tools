## This program will interpolate in Jamie's grid of models.

import sys, os
from time import time
from numpy import loadtxt, arange, linspace, array, log10, average
import matplotlib.pyplot as plt
from scipy.interpolate import UnivariateSpline as US
from numpy.linalg import inv
from linecache import getline

def find_indis(N,I,grid,val):
	'''
	This program will determine the bounding box for
	an arbitrary number of grid points. This will permit
	non-fixed grid lengths.

	N = length of the grid.
	I = desired interpolation order.
	grid = a vector which contains the grid.
	val = the value to locate within the grid.
	'''
	## Make sure I is 0, 1, 2, or 3.
	if I not in (0,1,2,3):
		print( 'Invalid interpolation order requested.')
		sys.exit()

	## Make sure I is smaller than N. Otherwise, depricate.
	if I >= N:
		print( 'Interpolation order same size, or larger, than grid! Depricating...')
		print( 'I =', I, ', N =', N)
		print( 'Grid =', grid, ', val =', val)
		I = N-1

	## If N = 1, just use that value.
	if N == 1: return (0,), 0
	## If N = 2, use linear interpolation.
	if N == 2: return (0,1), 1
	## If N = 3, use quadratic interpolation.
	elif N == 3 and I == 2: return (0,1,2), 2
	## If N = 3 and linear interpolation is requested
	elif N == 3 and I == 1:
		## Make sure val is within the grid.
		themin, themax = min(grid), max(grid)
		if val < themin-0.10 or val > themax:
			return -99, -99
		#this is going to be alpha/fe, and we're passing only slightly subzero alphas
		if val < grid[1]: return (0,1), 1
		if val > grid[1]: return (1,2), 1
	## If N > 3, use cubic interpolation.
	else:
		## Make sure val is within the grid.
		themin, themax = min(grid), max(grid)
		if val < themin or val > themax:
			## A value falls outside the grid! Skip this star for now.
			return -99, -99
		## If we are next to a grid edge, take the four closest.
		if grid[0] < val < grid[1]:
			if I == 1: return (0,1), 1
			if I == 2: return (0,1,2), 2
			if I == 3: return (0,1,2,3), 3
		if grid[-2] < val < grid[-1]:
			if I == 1: return (N-2,N-1), 1
			if I == 2: return (N-3,N-2,N-1), 2
			if I == 3: return (N-4,N-3,N-2,N-1), 3
		## If deeper in the grid, search for the location
		for i, gm in enumerate(grid):
			## If we fall right on a grid point, take it.
			if gm == val: return (i,), 0
			## Else, return the necessary interpolation indicies.
			if gm > val:
				if I == 3: return (i-2,i-1,i,i+1), 3
				if I == 1: return (i-1,i), 1
				## If 2nd order interpolation requested, determine
				## which central point to use.
				if abs(gm-val) < abs(grid[i-1]-val): return (i-1,i,i+1), 2
				else: return (i-2,i-1,i), 2

def model_read(fname,LOGG,AgeCN):

	ttt = time()

	## Find the desired location, and extract the loggs and gravs.
	tm2, tm1, t0, tp1 = 0, 0, 0, 0
	gm2, gm1, g0, gp1 = 0, 0, 0, 0
	## Also save age and surface C12, C13, N14 ratio, if desired.
	if AgeCN:
		agem2, agem1, age0, agep1 = 0, 0, 0, 0
		c12m2, c12m1, c120, c12p1 = 0, 0, 0, 0
		c13m2, c13m1, c130, c14p1 = 0, 0, 0, 0
		n14m2, n14m1, n140, n13p1 = 0, 0, 0, 0
		hydm2, hydm1, hyd0, hydp1 = 0, 0, 0, 0

	with open(fname) as f:
		for i, line in enumerate(f):
			## Skip the header.
			if line[0] == '#': continue
			## Find the right logg.
			g0 = line[2:14]
			if float(g0) < LOGG: break

	teffs, gravs = [], []
	if AgeCN: ages, carbo12, carbo13, nitro14, hydrogen = [], [], [], [], []
	with open(fname) as f:
		for j, line in enumerate(f):
			## Skip the header.
			if line[0] == '#': continue
			##
			if j < i-2: continue

			teffs.append(float(line[18:30]))
			gravs.append(float(line[2:14]))
			if AgeCN:
				ages.append(float(line[34:46]))
				carbo12.append(float(line[50:62]))
				carbo13.append(float(line[66:78]))
				nitro14.append(float(line[82:94]))
				hydrogen.append(float(line[98:110]))

			if j == i+1: break

	## Reverse them, for ease of interpolation.
	if AgeCN: return teffs[::-1], gravs[::-1], ages[::-1], carbo12[::-1], carbo13[::-1], nitro14[::-1], hydrogen[::-1]
	return teffs[::-1], gravs[::-1]

def interpolator(MASSS,FEOHS,ALFES,LOGGS,TEFFS):

	## Save Age and C/N ratio?
	AgeCN = True

	if False: ## Old grid.
		## Point to the grid location.
		grid_loc = '/home/newton/somers/Documents/FeH_ML_Interpolator/ProcessedMods/OldGrid/'

		## Define the grids, and set the desired interpolation order IO.
		grid_mass = (0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.4,2.5,2.6)
		name_mass = ('060','070','080','090','100','110','120','130','140','150','160','170','180','190','200','210','220','230','240','250','260')
		N_mass = len(name_mass)
		IO_mass = 3

		grid_feoh = (-2.0,-1.8,-1.6,-1.4,-1.2,-1.0,-0.8,-0.6,-0.4,-0.2,0.0,0.2,0.4)
		name_feoh = ('m200','m180','m160','m140','m120','m100','m080','m060','m040','m020','m000','p020','p040')
		N_feoh = len(name_feoh)
		IO_feoh = 3

	#	grid_alfe = (0.0,0.2,0.4)
	#	name_alfe = ('00','02','04')

		grid_alfe = (0.0,0.4)
		name_alfe = ('00','04')
		N_alfe = len(name_alfe)
		IO_alfe = 1

		grid_alml = (1.2,1.754,2.2)
		name_alml = ('12','17','22')
		N_alml = len(name_alml)
		IO_alml = 2


		grid_heli = (0.249585,0.264585,0.279585,0.324585)
		name_heli = ('250','265','280','325')
		N_heli = len(name_heli)
		IO_heli = 3

	if True: ## New grid.
		## Point to the grid location.
		grid_loc = '/home/jtayar/Documents/MixingLength/Garrett/ProcessedMods/NewBigGrid/'

		## Define the grids, and set the desired interpolation order IO.
		grid_mass = (0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.4,2.5,2.6)
		name_mass = ('060','070','080','090','100','110','120','130','140','150','160','170','180','190','200','210','220','230','240','250','260')
		N_mass = len(name_mass)
		IO_mass = 3

		grid_feoh = (-2.0,-1.8,-1.6,-1.4,-1.2,-1.0,-0.8,-0.6,-0.4,-0.2,0.0,0.2,0.4)
		name_feoh = ('m200','m180','m160','m140','m120','m100','m080','m060','m040','m020','m000','p020','p040')
		N_feoh = len(name_feoh)
		IO_feoh = 3

		grid_alfe = (0.0,0.2,0.4)
		name_alfe = ('00','02','04')
		N_alfe = len(name_alfe)
		IO_alfe = 1

		grid_alml = (1.224485,1.724485,2.224485)
		name_alml = ('12','17','22')
		N_alml = len(name_alml)
		IO_alml = 2
		if False:
			grid_alml = (1.2,1.724485)
			name_alml = ('17','17')
			N_alml = len(name_alml)
			IO_alml = 1

		grid_heli = (0.239,0.272683,0.290,0.330)
		name_heli = ('239','273','290','330')
		N_heli = len(name_heli)
		IO_heli = 3

	## Determine the edges of the grid.
	min_mass, max_mass = min(grid_mass), max(grid_mass)
	min_feoh, max_feoh = min(grid_feoh), max(grid_feoh)
	min_alfe, max_alfe = min(grid_alfe), max(grid_alfe)
	min_alml, max_alml = min(grid_alml), max(grid_alml)
	min_heli, max_heli = min(grid_heli), max(grid_heli)

	## Create the function for finding Y as a function of Z. To do
	## this, we must solve 3 equations with 3 unknowns. They are:
	##
	##  X + Y + Z = 1                         --   Consevation of mass
	##  Y = Z * (Ysol-Ybb)/Zsol + Ybb         --   Galactic He enrichment 
	##  Z/X = 10^([Fe/H] + log10(Zsol/Xsol))  --   Stellar metallicity
	## 
	## This system can be solved by matrix inversion, but we
	## must know [Fe/H] before we can fully construct it.
	## Set up the first two lines, with the third to be
	## set up for each individual star.
	##
	## First, set the solar abundances and BBN helium abundance.
	Xsol, Ysol, Zsol = 0.709370, 0.272683, 0.0179471
#	Xsol, Ysol, Zsol = 0.718958, 0.264585, 0.0164569
	Ybb = 0.2484 ## Cyburt et al. (2004)
#	Ybb = 0.2565 ## Izotov & Thuan (2010)
	## Now build the first two rows.
	mtxline1 = [1., 1., 1.]
	mtxline2 = [0., 1., (Ybb-Ysol)/Zsol]

	##################################################################################
	AllTimes = []
	## Now comes the fun part.
	##
	## First check to make sure the parameter vectors are the same size.
	if not len(MASSS) == len(FEOHS) == len(ALFES) == len(LOGGS) == len(TEFFS):
		print( 'The five input vectors are not the same length!')
		print( 'MASSS', len(MASSS), 'FEOHS', len(FEOHS), 'ALFES', len(ALFES), 'LOGGS', len(LOGGS), 'TEFFS', len(TEFFS) )
		sys.exit()
	## Iterate through the input stars, and interpolate for each.
	AllStars = zip(MASSS,FEOHS,ALFES,LOGGS,TEFFS)
	AllMLs, AllTeffs = [], []
	for MASS, FEOH, ALFE, LOGG, TEFF in AllStars:

		## First, determine the desired helium abundnace. In order to properly
		## track Z, make sure to correct for the change in Z due to [Al/Fe]. Ignore
		## this step if we are only using one Helium abundance.
		if N_heli > 1:
			## Invert a 3x3 matrix to find Ystar. The first two matrix
			## lines have already been defined. Make the third.
			## First step is to correct Z for the Alpha enhancement.
			## Calculate ZXsol, and add the Alpha correction.
			ZXsol = log10(Zsol/Xsol)+0.75*ALFE
			mtxline3 = [10.**(FEOH+ZXsol),0.,-1.]
			## Invert the matrix.
			mtx = array([mtxline1,mtxline2,mtxline3])
			mtx_inv = inv(mtx)
			## Determine Y.
			I21, I22, I23 = mtx_inv[1][0], mtx_inv[1][1], mtx_inv[1][2]
			YINT = 1.*I21 + Ybb*I22 + 0.*I23
			## For checking X and Z interpolation.
			## I11, I12, I13 = mtx_inv[0][0], mtx_inv[0][1], mtx_inv[0][2]
			## I31, I32, I33 = mtx_inv[2][0], mtx_inv[2][1], mtx_inv[2][2]
			## XINT = 1.*I11 + Ybb*I12 + 0.*I13
			## ZINT = 1.*I31 + Ybb*I32 + 0.*I33
		else:
			## If we only have one grid spaing for helium, just collect
			## that value.
			YINT = grid_heli[0]

		## Announce the star.
		print ('Running M F A G T Y', MASS, FEOH, ALFE, LOGG, TEFF, YINT)

		## First task is to determine the bounding boxes. For now, return
		## ML == -99 if outside the grid.
		ThrowOut = False
		if MASS < min_mass or MASS > max_mass: ThrowOut = True
		if FEOH < min_feoh or FEOH > max_feoh: ThrowOut = True
		if ALFE < min_alfe-0.10 or ALFE > max_alfe: ThrowOut = True
		if ThrowOut:
			print( 'A value fell outside the grid...')
			return [[-99.,-99.,-99.,-99.,-99.,-99.,-99.],]

		## Retrive the bounding box for mass, [Fe/H], [Al/Fe], and A_ML
		mass_indis, mass_k = find_indis(N_mass,IO_mass,grid_mass,MASS)
		feoh_indis, feoh_k = find_indis(N_feoh,IO_feoh,grid_feoh,FEOH)
		alfe_indis, alfe_k = find_indis(N_alfe,IO_alfe,grid_alfe,ALFE)
		alml_indis, alml_k = find_indis(N_alml,IO_alml,grid_alml,1.88)
#		heli_indis, heli_k = find_indis(N_heli,IO_heli,grid_heli,YINT)
		heli_indis, heli_k = (0,1,2,3), 3

		## Determine the number of mods to be run.
		ModNum = len(mass_indis)*len(feoh_indis)*len(alfe_indis)*len(alml_indis)

		t1 = time()
		## Now do the interpolation. This will progress as follows.
		## 1) for each A_ML, interpolate in mass and [Fe/H] to the specified logg at both [Al/Fe]s.
		## 2) Interpolate between those loggs to the specified Teff, and retrieve the stellar A_ML. 
		##
		## First, set up storage vectors for the final interpolation. Make age and CN ones, even
		## if we aren't interpolating. Its just easier that way.
		alml_names, alml_teffs = [], []
		alml_ages, alml_c12s, alml_c13s, alml_n14s, alml_hyds = [], [], [], [], []

		zzz = 0
		for i in alml_indis:
			## Retrieve the name of the mixing length specification.
			alml, alml_name = grid_alml[i], name_alml[i]
			## Make the storage vectors.
			heli_names, heli_teffs = [], []
			heli_ages, heli_c12s, heli_c13s, heli_n14s, heli_hyds = [], [], [], [], []
			## Run through helium abundances.
			for m in heli_indis:
				heli, heli_name = grid_heli[m], name_heli[m]
				## Make the storage vectors.
				alfe_names, alfe_teffs = [], []
				alfe_ages, alfe_c12s, alfe_c13s, alfe_n14s, alfe_hyds = [], [], [], [], []
				## Run through [Al/Fe].
				for j in alfe_indis:
					alfe, alfe_name = grid_alfe[j], name_alfe[j]
					## Apply a correction to account for the decreased amount of
					## iron the alpha-enhanced models.
					alfe_corr = 0.00
#					if alfe == 0.0: alfe_corr = 0.00
#					if alfe == 0.2: alfe_corr = 0.15
#					if alfe == 0.4: alfe_corr = 0.30
					## Make the storage vectors.
					feoh_names, feoh_teffs = [], []
					feoh_ages, feoh_c12s, feoh_c13s, feoh_n14s, feoh_hyds = [], [], [], [], []
					## Run through [Fe/H]
					for k in feoh_indis:
						feoh, feoh_name = grid_feoh[k], name_feoh[k]	
						## Make the storage vectors.
						mass_names, mass_teffs = [], []
						mass_ages, mass_c12s, mass_c13s, mass_n14s, mass_hyds = [], [], [], [], []
						## Run through mass.
						for l in mass_indis:
							mass, mass_name = grid_mass[l], name_mass[l]
							## Assemble the file name.
							fname  = 'm'+mass_name
							fname += 'fh'+feoh_name
							fname += 'y'+heli_name
							fname += 'a'+alml_name
							fname += 'al'+alfe_name
							fname += '_grnodf.track'
							## Make sure the file exists.
							if not os.path.exists(grid_loc+fname):
								print( fname, 'nonexistant...')
								continue
							## Now read in the desired Teff and Logg values. Also,
							## pass a flag which says whether to int Age, C/N.
							ttt = time()
							if not AgeCN: teffs, gravs = model_read(grid_loc+fname,LOGG,False)
							else: teffs, gravs, ages, c12s, c13s, n14s, hyds = model_read(grid_loc+fname,LOGG,True)
							AllTimes.append(time()-ttt)
							## Make sure this logg was contained in the model. If not, skip.
							if LOGG < min(gravs):
								print( 'logg =', LOGG, 'not reached in', fname)
								continue
							## Interpolate teffs to LOGG.
							mass_teff = US(gravs,teffs,k=len(gravs)-1,s=0)(LOGG)
							if AgeCN: ## Interpolate age, C12, C13, N14, X
								mass_age = US(gravs,ages,k=len(gravs)-1,s=0)(LOGG)
								mass_c12 = US(gravs,c12s,k=1,s=0)(LOGG)
								mass_c13 = US(gravs,c13s,k=1,s=0)(LOGG)
								mass_n14 = US(gravs,n14s,k=1,s=0)(LOGG)
								mass_hyd = US(gravs,hyds,k=1,s=0)(LOGG)
							## Test to make sure that the models were read in,
							## cropped, and interpolated okay.
							if False:
								fig, ax = plt.subplots()
								xs = linspace(min(gravs),max(gravs),100)
								ys = US(gravs,teffs,k=len(gravs)-1,s=0)(xs)
								ax.plot(ys,xs,color='b')
								ax.scatter(teffs,gravs,color='b')
								ax.scatter(mass_teff,LOGG,color='r')
								ax.set_xlim(ax.get_xlim()[::-1])
								ax.set_ylim(ax.get_ylim()[::-1])
								ax.set_title(fname)
								plt.show()
							## Store the mass and Teff.
							mass_names.append(mass)
							mass_teffs.append(float(mass_teff))
							if AgeCN: ## Interpolate age, C12, C13, N14, X
								mass_ages.append(float(mass_age))
								mass_c12s.append(float(mass_c12))
								mass_c13s.append(float(mass_c13))
								mass_n14s.append(float(mass_n14))
								mass_hyds.append(float(mass_hyd))
							#print fname
							#################################################
							## Report the finished model for sanity purposes.
							#print fname, 'complete! '
							#zzz+=1
							#print zzz, '/', ModNum
							#################################################
						##################################################################################################
						## Determine if any of the models broke. If its just one, go ahead
						## and interp anyways.
						if len(mass_names) == 0: continue
						if len(mass_names) == 1:
							feoh_teff = mass_teffs[0]
							if AgeCN:
								feoh_age = mass_ages[0]
								feoh_c12 = mass_c12s[0]
								feoh_c13 = mass_c13s[0]
								feoh_n14 = mass_n14s[0]
								feoh_hyd = mass_hyds[0]
						## Now interpolate to the Teff given by the desired [Fe/H] if need be.
						else:
							if   len(mass_names) == 2: IO = 1
							elif len(mass_names) == 3: IO = 2
							else: IO = mass_k

							feoh_teff = US(mass_names,mass_teffs,k=IO,s=0)(MASS)
							if AgeCN:
								feoh_age = US(mass_names,mass_ages,k=IO,s=0)(MASS)
								feoh_c12 = US(mass_names,mass_c12s,k=IO,s=0)(MASS)
								feoh_c13 = US(mass_names,mass_c13s,k=IO,s=0)(MASS)
								feoh_n14 = US(mass_names,mass_n14s,k=IO,s=0)(MASS)
								feoh_hyd = US(mass_names,mass_hyds,k=IO,s=0)(MASS)

						## Test to make sure that the masses interpolated okay.
						if False:
							fig, ax = plt.subplots()
							xs = linspace(min(mass_names),max(mass_names),100)
							ys = US(mass_names,mass_teffs,k=IO,s=0)(xs)
							ax.plot(xs,ys,color='b')
							ax.scatter(mass_names,mass_teffs,color='b')
							ax.scatter(MASS,feoh_teff,color='r')
							plt.show()
						## Store the feoh and Teff.
						feoh_names.append(feoh)
						feoh_teffs.append(float(feoh_teff))
						if AgeCN: ## Interpolate age, C12, C13, N14, X
							feoh_ages.append(float(feoh_age))
							feoh_c12s.append(float(feoh_c12))
							feoh_c13s.append(float(feoh_c13))
							feoh_n14s.append(float(feoh_n14))
							feoh_hyds.append(float(feoh_hyd))
					##################################################################################################
					## Now interpolate to the desired [Al/Fe] if need be. 
					if len(feoh_names) == 1:
						alfe_teff = feoh_teffs[0]
						if AgeCN:
							alfe_age = feoh_ages[0]
							alfe_c12 = feoh_c12s[0]
							alfe_c13 = feoh_c13s[0]
							alfe_n14 = feoh_n14s[0]
							alfe_hyd = feoh_hyds[0]
					else:
#JNT 18 Sep 2018 add the try except steps here to bypass the OnetoSkip mechanic
						try:
							alfe_teff = US(feoh_names,feoh_teffs,k=feoh_k,s=0)(FEOH+alfe_corr)
						except:
							print ('interpolation failed, return null values')
							return [[-99.,-99.,-99.,-99.,-99.,-99.,-99.],]

#						alfe_teff = US(feoh_names,feoh_teffs,k=feoh_k,s=0)(FEOH+alfe_corr)
						if AgeCN:
							alfe_age = US(feoh_names,feoh_ages,k=feoh_k,s=0)(FEOH+alfe_corr)
							alfe_c12 = US(feoh_names,feoh_c12s,k=feoh_k,s=0)(FEOH+alfe_corr)
							alfe_c13 = US(feoh_names,feoh_c13s,k=feoh_k,s=0)(FEOH+alfe_corr)
							alfe_n14 = US(feoh_names,feoh_n14s,k=feoh_k,s=0)(FEOH+alfe_corr)
							alfe_hyd = US(feoh_names,feoh_hyds,k=feoh_k,s=0)(FEOH+alfe_corr)
					## Test to make sure that the masses interpolated okay.
					if False:
						fig, ax = plt.subplots()
						xs = linspace(min(feoh_names),max(feoh_names),100)
						ys = US(feoh_names,feoh_teffs,k=feoh_k,s=0)(xs)
						ax.plot(xs,ys,color='b')
						ax.scatter(feoh_names,feoh_teffs,color='b')
						ax.scatter(FEOH+alfe_corr,alfe_teff,color='r')
						plt.show()
					## Store the [Al/Fe] and Teff.
					alfe_names.append(alfe)
					alfe_teffs.append(float(alfe_teff))
					if AgeCN: ## Interpolate age, C12, C13, N14, X
						alfe_ages.append(float(alfe_age))
						alfe_c12s.append(float(alfe_c12))
						alfe_c13s.append(float(alfe_c13))
						alfe_n14s.append(float(alfe_n14))
						alfe_hyds.append(float(alfe_hyd))
				##################################################################################################
				## Interpolate to the desired helium abundance.
				if len(alfe_names) == 1:
					heli_teff = alfe_teffs[0]
					if AgeCN:
						heli_age = alfe_ages[0]
						heli_c12 = alfe_c12s[0]
						heli_c13 = alfe_c13s[0]
						heli_n14 = alfe_n14s[0]
						heli_hyd = alfe_hyds[0]
				else:
					heli_teff = US(alfe_names,alfe_teffs,k=alfe_k,s=0)(ALFE)
					if AgeCN:
						heli_age = US(alfe_names,alfe_ages,k=alfe_k,s=0)(ALFE)
						heli_c12 = US(alfe_names,alfe_c12s,k=alfe_k,s=0)(ALFE)
						heli_c13 = US(alfe_names,alfe_c13s,k=alfe_k,s=0)(ALFE)
						heli_n14 = US(alfe_names,alfe_n14s,k=alfe_k,s=0)(ALFE)
						heli_hyd = US(alfe_names,alfe_hyds,k=alfe_k,s=0)(ALFE)
				## Test to make sure that the masses interpolated okay.
				if False:
					fig, ax = plt.subplots()
					xs = linspace(min(alfe_names),max(alfe_names),100)
					ys = US(alfe_names,alfe_teffs,k=alfe_k,s=0)(xs)
					ax.plot(xs,ys,color='b')
					ax.scatter(alfe_names,alfe_teffs,color='b')
					ax.scatter(ALFE,heli_teff,color='r')
					plt.show()
				## Store the [Al/Fe] and Teff.
				heli_names.append(heli)
				heli_teffs.append(float(heli_teff))
				if AgeCN: ## Interpolate age, C12, C13, N14, X
					heli_ages.append(float(heli_age))
					heli_c12s.append(float(heli_c12))
					heli_c13s.append(float(heli_c13))
					heli_n14s.append(float(heli_n14))
					heli_hyds.append(float(heli_hyd))
			##################################################################################################
			## Finally, find the Teff predicted by this mixing length if need be.
			if len(heli_names) == 1:
				alml_teff = heli_teffs[0]
				if AgeCN:
					alml_age = heli_ages[0]
					alml_c12 = heli_c12s[0]
					alml_c13 = heli_c13s[0]
					alml_n14 = heli_n14s[0]
					alml_hyd = heli_hyds[0]
			else:
				alml_teff = US(heli_names,heli_teffs,k=heli_k,s=0)(YINT)
				if AgeCN:
					alml_age = US(heli_names,heli_ages,k=heli_k,s=0)(YINT)
					alml_c12 = US(heli_names,heli_c12s,k=heli_k,s=0)(YINT)
					alml_c13 = US(heli_names,heli_c13s,k=heli_k,s=0)(YINT)
					alml_n14 = US(heli_names,heli_n14s,k=heli_k,s=0)(YINT)
					alml_hyd = US(heli_names,heli_hyds,k=heli_k,s=0)(YINT)
			## Test to make sure that the masses interpolated okay.
			if False:
				fig, ax = plt.subplots()
				xs = linspace(min(heli_names),max(heli_names),100)

				ys = US(heli_names,heli_ages,k=heli_k,s=0)(xs)
				ax.scatter(heli_names,heli_ages,color='b')
				ax.scatter(YINT,alml_age,color='r')

				ax.plot(xs,ys,color='b')
				plt.show()
			## Store the A_ML and Teff.
			alml_names.append(alml)
			alml_teffs.append(alml_teff)
			if AgeCN: ## Interpolate age, C12, C13, N14, X
				alml_ages.append(float(alml_age))
				alml_c12s.append(float(alml_c12))
				alml_c13s.append(float(alml_c13))
				alml_n14s.append(float(alml_n14))
				alml_hyds.append(float(alml_hyd))
			## If this is the solar mixing length, store the Teff value.
			if alml_name == '17': SolarTeff = float(alml_teff)
		##################################################################################################
		## At last, find the corresponding A_ML.
		final_ML = US(alml_teffs,alml_names,k=alml_k,s=0)(TEFF)
		## Also, find the model predictions for Age, C12, C13, N14, and X if desired.
		if AgeCN: 
			final_age = US(alml_teffs,alml_ages,k=alml_k,s=0)(TEFF)
			final_c12 = US(alml_teffs,alml_c12s,k=alml_k,s=0)(TEFF)
			final_c13 = US(alml_teffs,alml_c13s,k=alml_k,s=0)(TEFF)
			final_n14 = US(alml_teffs,alml_n14s,k=alml_k,s=0)(TEFF)
			final_hyd = US(alml_teffs,alml_hyds,k=alml_k,s=0)(TEFF)

		## Small test to make sure that the masses interpolated okay.
		if False:
			fig, ax = plt.subplots()
			xs = arange(min(alml_teffs),max(alml_teffs),10)
			ys = US(alml_teffs,alml_names,k=alml_k,s=0)(xs)
			ax.plot(xs,ys,color='b')
			ax.scatter(alml_teffs,alml_names,color='b')
			ax.scatter(TEFF,final_ML,color='r')
			plt.show()
		## Store the mixing length and Solar Teff!
#		if not AgeCN: AllMLs.append([SolarTeff,float(final_ML)])
		if not AgeCN: 
			AllMLs.append([SolarTeff,float(final_ML),0.0,0.0,0.0,0.0,0.0,])
		else:
			AllMLs.append([SolarTeff,float(final_ML),float(final_age),float(final_c12),float(final_c13),float(final_n14),float(final_hyd),])

		print( 'Teff interpolation gives', SolarTeff)
		print( 'Mixing length interpolation gives', float(final_ML))
#		if AgeCN:
#			print 'Predicted Age =', final_age
#			print 'Predicted C12 =', final_c12
#			print 'Predicted C13 =', final_c13
#			print 'Predicted N14 =', final_n14
#			print 'Predicted X =', final_hyd
		t2 = time()-t1
		print( 'This interpolation took', t2, 'seconds')
		
		print( 'Average of', len(AllTimes), 'reads was', average(AllTimes), 'for s=', sum(AllTimes), '\n')

	##################################################################################

	return AllMLs

	##################################################################################


if __name__ == '__main__':
# Test
#	MASSS = (1.30,)
#	FEOHS = (-0.30,)
#	ALFES = (0.00,)
#	LOGGS = (2.782,)
#	TEFFS = (4866.2,)
# Alpha Poor
	MASSS = (1.19648,)
	FEOHS = (-0.300051,)
	ALFES = (0.0277216,)
	LOGGS = (2.76090,)
	TEFFS = (4799.80,)
# Alpha Rich
	MASSS = (1.10781,)
	FEOHS = (-0.309753,)
	ALFES = (0.309487,)
	LOGGS = (2.19172,)
	TEFFS = (4325.80,)
	interpolator(MASSS,FEOHS,ALFES,LOGGS,TEFFS)


## Alpha poor star.
## #KICID         Mass          Logg       Fe_H        alpha_Fe      Teff	Orig_ML		New_ML
## 10916563      1.19648      2.76090    -0.300051    0.0277216      4799.80	1.792426	1.81156582299
## 
## Alpha rich star.
## #KICID         Mass          Logg       Fe_H        alpha_Fe      Teff	Orig_ML		New_ML
## 6878800      1.10781      2.19172    -0.309753     0.309487      4325.80	1.506129	1.70808671102























































