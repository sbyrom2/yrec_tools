'''

A script to run a grid of yrec models all at once.

'''

import os
import numpy as np
from make_modelgrid import make_MZgrid
from glob import glob

yrecpath = '/home/sus/Masters/yrec/src/yrec'



masses = np.array([0.5,.6,1,2.5])
FeHs = np.array([-.5,0,.5])

# if you haven't already created the grid
# change the base_fname, base_fpath, yrec_writepath, and yrec_inputpath parameters
# and run this
# nml_names = make_MZgrid(masses,FeHs,base_fname='test_sus',
#                 base_fpath='/home/sus/Masters/yrec_tools/test_mzgrid_sus',
#             yrec_writepath='/home/sus/Masters/yrec_tools/test_mzgrid_sus/output',yrec_inputpath='/home/sus/Masters/yrec/input')

# OR if you have already created the grid
path_to_nmlfiles = 'test_mzgrid_sus'
os.chdir(path_to_nmlfiles)
nml_names = glob(f'm*.nml1')
nml_names = np.array([name[:-5] for name in nml_names])
nml_names = np.reshape(nml_names,(len(masses),len(FeHs)))


for i in range(len(masses)):
    for j in range(len(FeHs)):
        filename = nml_names[i][j]
        os.system(f'{yrecpath} {filename}.nml1 {filename}.nml2')