## This program will run int.py on the stars in the list.

import os, sys
from numpy import loadtxt
from interp5newpy3 import interpolator
from time import time

## Specify the input and output files.
infile = 'data_files/APOK2.txt' #MainTable.Cateta172024July26d_agewithloss.txt' #MLtestIPL3ASPCAP_HON.txt' #A3PMLtesterr3bDR17alphaM2023_MO.txt' #A3PMLtesterr3bDR17alphaMlogglt2_good.txt' #A3PMLtesterr3bDR16alphaM2022_A3CRGB.txt' #APOTIC17_mh_artemis3.txt' #MLtesterr3bDR16A3PalphaM_july.txt' #MLtesterr3bDR16A3PalphaM_2021_05_31.txt'
outfile = infile.replace('data_files','new_outfiles').replace('.txt','5.out')

## Read in the stars.
stars = loadtxt(infile,usecols=(0,1,2,3,4,5))
ids, mass, logg, feoh, alfe, teff = zip(*stars)

## Now read in the lines for outputting later. Cut out the header.
stars = open(infile).readlines()[1:]

## Start the output file if it hasn't been opened. Otherwise,
## figure out which stars we've interpolated and skip them
if not os.path.exists(outfile): 
#	open(outfile,'a').write('#StarID\t\tA_ML\n')
	open(outfile,'a').write('## KICID      Mass         Logg       M_H          alp_M         Teff       C_N           ')
	open(outfile,'a').write('M_err       Logg_err     M_H_err     alp_M_err      Teff_err    TMASSID       IntTeff      IntML      ')
	open(outfile,'a').write('     IntAge          IntC12          IntC13          IntN14          IntXsurf\n')
#	open(outfile,'a').write('6792689\t-99.000000\n')
#	open(outfile,'a').write('8285712\t-99.000000\n')
#	open(outfile,'a').write('8459156\t-99.000000\n')
#	open(outfile,'a').write('8609704\t-99.000000\n')

DoneStars = loadtxt(outfile,usecols=(0,)).tolist()
try: len(DoneStars)
except TypeError: DoneStars = [DoneStars,]

## For the full Tayar sample.
#OnesToSkip = (5371676,8285712, 8459156,8587329,8609704,9390017)
# Full Tayar sample with SYD
#OnesToSkip=(6122976,6792689,7045503,8285712,8587329,9965582)
# Full Tayar Sarbani Mcor
#OnesToSkip=(8285712,8587329)
# Full Tayar Sarbani Mcor Loggcor
#OnesToSkip=( 8285712, 8587329)
# Full Tayar, Dennis Masses
#OnesToSkip=(10226276,10292156,10418503,2018537,3866912,5371676,7989213,8026963,8285712,8366239,8459156,8587329,8609704,	8824732,9165879,9712510)
# Full Tayar, Aldo Scale
#OnesToSkip=(8285712,8587329,8609704)
# Full Tayar, Aldo Individual
#OnesToSkip=(8587329,8587329)

##OnesToSkip = (5371676,6792689,8285712,8459156,8609704,5113061,3222519,3543433,8569991,9726045)
#Full Tayar, corrected Teffs, quadratic alpha interpolation
#OnesToSkip = (10004825,10004825, 10014959, 10018923, 10023439, 10025387)
#Full Tayar, corrected Teffs, linear alpha interpolation
#OnesToSkip=(10033231,10053392,10053594,10055061,10055196,10090568,10147167, 10206622)
#Full Tayar, corrected Teffs, quadratic alpha interpolation, remove +0.6 option
#OnesToSkip = (10004825, 10014959, 10018923, 10023439, 10025387)
#Full Tayar, corrected Teffs, linear alpha interpolation, remove +0.6 option
#OnesToSkip = (12022099,12022099,3633335,5371676,5376348,5983251,6679464, 6792689,7800922, 8285712,8459156,8587329, 8609704)

## Dennis Sample
#OnesToSkip = (10428163,10453652,10722954,12056819,2164379,4042300,4756934,5371676,5392313,6890257,
#              7831636,8285712,8459156,8462113,8609704,8959259,9334666,9447310,9846098,9880435,)
#OnesToSkip = (10192458,11147333,11722424,2711477,4755560,5284948,5371676,5479483,5940587,6865501,8162973, 7547964, 8285712, 8459156, 8555265, 8609704, 9269772, 9698133, 9904365)

#Clusterfin1
#OnesToSkip=(24206, 24207, 24208, 24209)
#Clusterfin1_mass plus 
#OnesToSkip = (2297384,2297825,2436417,2437496,2437804,2437816,2437965,2569055,2570518,710,711,712)
# mass minus
#OnesToSkip = (1070, 1071, 1072, 1073)
#Diogo 2420
#OnesToSkip = (0,1)
#47tuc
#OnesToSkip = (14, 15)
#M4spectra
#OnesToSkip = (1, 17,30,37, 38, 57,58, 63, 72, 73, 92, 93, 95, 109, 118, 120, 125, 145, 151)
#47tucspectrac
#OnesToSkip=(19, 23, 51, 53, 55, 56, 57, 66, 67, 97,110,121, 135, 136, 168, 183, 192, 215, 221, 230, 237, 246, 263, 273, 285, 296, 325, 335, 340, 354, 356, 358,366, 379, 386, 392, 400, 404, 409, 438, 452, 461, 465, 489, 500, 526, 530)
#Hawkins
#OnesToSkip = (2973894,2973894,10200377,10293335,11349014,9333501,11512096,11083613,10796378,4569691,6844293,9205952, 5685000,9942816,10749112,3849027,9909804,9574650,11250139,5597397, 6594505,10975126,12121207,9405555,4638317,9028511, 11561379,9395535, 9706209, 5461921, 10600926, 10992711, 12120230, 6501676, 11395816, 11357004,8612811, 10002647, 10068810, 5512777, 11196963, 10553844, 10196797, 9330758, 12266056, 11244855, 11753211, 	11342308, 8759207, 9658793, 11599342,7430415, 9264889, 8737032, 7672292, 3934458, 4139914, 10459794, 11468340, 3631092, 9080445, 10263341, 	7267593, 10793890, 9396363, 5080831, 11918016, 9893889, 9641484, 9641246, 3658136, 12122151, 11905393, 4141815, 9898999, 9456478, 8086192, 11247049, 5545303, 10973854 , 11521155, 8677701,3748691,	1725732, 4840774, 11673900, 6266772, 10863535, 10271721, 6188215,9511938, 9887488, 8547669,4636731, 10474071, 9903290, 	9970467, 10603170, 7813414, 11152753, 2141928, 8738333, 6421579, 11072334, 11410217,10858520, 9351186, 6939158, 4991732, 10966950, 10226276, 3734104, 10593078, 9702841, 	9711269, 5371626, 4908025, 11442227, 2696628, 9146423,6508300,6677653, 5200152, 7347195,6756648, 9147335, 6192431,9100325, 3730854,10528911, 3646933, 6025031, 11820688, 	5112734, 8219125, 11753010, 4346319, 9291249,3529480,11513798, 11513798, 11663387, 9767332, 4243796, 6755830, 9727675, 9727675, 	5426041, 10534826, 5024851, 5024851, 2975717, 6026983, 4039831,9470055, 5288607 , 	7591311, 11805876, 10979742, 1725552, 10089758, 	9640886, 	11668246, 9762752, 6928997, 5342486, 11670367, 10395638, 9292180, 11284798, 	3346501, 10592249, 10527754, 5599763, 10992390, 4169130, 2995197, 5112481, 4276070, 11232225, 	9772366, 12168406, 10724041, 10922821, 5859492, 10910802, 11564787, 9166023, 	9329200, 2437965, 11665692, 10290315, 	5515314, 10721900, 10418503, 10972288, 4481621)
#GHB
#OnesToSkip = (8285712, 8609704, 9390017)
#Marcclusters
#OnesToSkip=(33,50,77, 87,90, 150,174, 309, 341, 392, 465, 494, 528, 531, 536)

#Massarotti
#OnesToSkip = (47310,51069,67459,69427,69673,81008,92512)

#DR14 november
#OnesToSkip = (10402207,2447046,6792689,8459156,9390017)

#aldodr13solar
#OnesToSkip= (10004975,10329008,10732526,11400880,11598459, 11769563 , 11770790, 11805489, 11954989,12153362, 2283093, 3747777, 3954327, 4077249, 4933782, 4946997, 5113061, 5343454, 5601827, 5620636, 5647719, 5696539, 5780142, 6045141, 6504978, 6591762, 6604237, 6888756, 6952984, 7733106, 8366262, 8459156, 8587329, 9390017, 9932339 )

#aldodr14solar rc,rgb, (ambiguous use aldo's rc age)

#OnesToSkip=(10459696, 1160789,11653073, 11769563 ,11770790, 11805489, 2860010,3642038 , 3729799 ,3756737, 4586817, 5005217, 5171575, 5522822, 6045141, 6103082, 6124244,6272964, 6313603, 6504725,6604237 ,6928997 , 6952984,6967600 ,8296729, 	8418437,  8459156, 8747415, 9110060, 9390017, 9903422, 9904563, 9942292 )

#aldodr13alpha rgb

#OnesToSkip=(10459696,11769563,11770790, 11805489 ,3642038, 3729799, 4586817 , 5171575,6045141, 6103082, 6124244, 6272964 , 6604237, 6928997,6952984, 8296729 ,8459156,	8747415 , 9110060 , 9390017,9903422, 9942292 )

#Bergemann NLTE
#OnesToSkip=(68, 121, 123, 125, 127, 128, 130, 131, 132, 134, 139, 141, 143, 147, 148, 149, 150, 151, 152, 154, 155, 157, 159, 160, 162, 163, 167, 169, 170, 171, 172, 176, 178, 179, 180, 181, 183, 184, 213, 493, 496, 506, 507, 509, 512, 513, 515, 516, 517, 520, 522, 523, 525, 526, 529, 532, 533, 536, 539, 541, 542, 544, 545, 546, 549, 551, 552, 553, 555, 557, 558, 560, 562, 565, 566, 567, 568, 569, 570, 571, 572, 574, 576, 579, 580, 581, 582, 583, 584, 644, 645, 648, 656, 668, 674, 677)

#aldogbm sep18 1
#OnesToSkip=(3852384,5297605, 5734154, 6045141, 6604237, 6792689, 8459156, 9390017, 10329008, 11805489, 5985218)
OnesToSkip=(0,0)

#DR16 alpha vs Mg check
#OnesToSkip=(6129632,6129632)

#DR16 A3P
#OnesToSkip=(10538796,11820528,12056614,12217121,3936047,4347503,4456143,5386317, 5772756,6129632,6545726,7613227,7739152, 8753927,9837673,9882697)

#DR16 A3P Jan 2021
#OnesToSkip=(10005321,10088136,10140201,10275709,10518207,10850763,11019452,11616733)

#DR16 A3P May 2021
OnesToSkip=(0,0)

t1 = time()

## Now run the loop.
for i in range(len(ids)):

	#if i > 20: break
   
	I, M, F, A, L, T = ids[i], [mass[i],], [feoh[i],], [alfe[i],], [logg[i],], [teff[i],]

	print ('\n#', i, '\t', I, '\n')
	## Check that this star hasn't been interpolated before.
	if I in DoneStars: continue

	## Check if its one we want to skip.
	if I in OnesToSkip:
		print ('Skipping this one!')
		lin = '#'+'%.0d'%I+'\t-99.000000\n'
		open(outfile,'a').write(lin)
		continue

	if True: ## Include Age and C/N
		try:
			thetef, theml, theage, thec12, thec13, then14, thehyd = interpolator(M, F, A, L, T)[0]

			lin  = stars[i].replace('\n','')
			lin += '       %.1f'%thetef+'\t'
			lin += '   %.6f'%theml+'\t'
			lin += '   %.4e'%theage+'\t'
			lin += '   %.4e'%thec12+'\t'
			lin += '   %.4e'%thec13+'\t'
			lin += '   %.4e'%then14+'\t'
			lin += '   %.4e'%thehyd+'\n'
			open(outfile,'a').write(lin)
		except:
			print ('Skipping this one!')
			lin = '#'+'%.0d'%I+'\t-99.000000\n'
			open(outfile,'a').write(lin)

	else:
		thetef, theml = interpolator(M, F, A, L, T)[0]

		lin  = stars[i].replace('\n','')
		lin += '       %.1f'%thetef+'\t'
		lin += '   %.6f'%theml+'\n'
		open(outfile,'a').write(lin)


print( '\n\nThis whole run took', time()-t1, 'seconds!')



















