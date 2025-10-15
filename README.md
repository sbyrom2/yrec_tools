# yrec_tools
Tools for creating a grid of models using YREC

How to write documentation for python: https://realpython.com/documenting-python-code/#why-documenting-your-code-is-so-important


How to use YREC to compute the ages of a population of stars

Generally this is done with a grid of models- models making the same physical assumptions, but run at a range of masses and compositions, and then a separate program is used to interpolate between those models to the values of each data point (e.g. the Mass, Metallicity, alpha-abundance, and logg of a giant) (this can also be e.g. the luminosity and composition and temperature of a subgiant, or the logg, Teff and composition of a dwarf)


**Create a Base Model**


This is one model where you have calibrated the physics of interest. This is most commonly a model of solar mass, and solar composition calibrated to match the solar luminosity and solar radius at the solar age, but any similarly precise choice may be justifiable.

Look at the inlists for a model- what choices do you want to make for atmosphere boundary condition, rotation, nuclear reaction rates, timestepping, etc? I tend to change things by hand in the file for this first run, but something like createnmls2.pro can make these changes programmatically if you prefer that.

Recommended: update_nml.py contains the function update_namelists() that allows you to easily change variables in namelists. 

Run the solar model, as well as models with slightly different mixing length and helium abundance. Interpolate and run a few models again, and interpolate again, getting a relatively close calibration. Technically I think there is code to do this automatically, but I don’t think I’ve ever actually done it that way. 

At this point I generally create a sparse grid of models (often just the corner of the grid- maximum and minimum mass, maximum and minimum metallicity, as well as the base model) in order to check that the numerics will run for a range of cases (e.g. all models will make it up to the tip of the giant branch or whatever the metric of interest is).

**File List**

Recommended: make_modelgrid.py

make_modelgrid.py allows you to create a grid of models that vary in mass and metallicity. It is the most up-to-date and well-documented way to create a file list. If you want to vary other quantities such as rotation or mixing length, look at Jamie's older files:

createnmls2.pro

createwrapper.pro

Once you have the base model decided, you come up with a list of things you want to perturb. Mass and Metallicity are the most common things to change, but rotation, mixing length, helium, or other quantities may also be things you want to change. I tend to use something like createwrapper to make all of those changes in an automated way, generating large numbers of input files, and make sure that a change in metallicity is propagated to a change in the atmosphere model, a change in the opacity and so forth. This newer version of YREC should be better at making sure that happens automatically, but there may be other changes you want to make (e.g. a metallicity-dependent mixing length). 


**Running the Models**

Recommended: batchrunner.py is a script to run a grid of namelists in python. It is intended to be used from the command line and has 2 versions within it: one for generating and running a mass-Fe/H grid, the other for running a pre-existing grid. 

batchdistributer.sc

batchrunner2017aeryn.sc


Once all the inlists have been generated you actually have to run them. In general, I’ve found that the slowest part of running large grids is file input and output, so you don’t gain anything by running on other people’s cores if they’re all writing to the same place (e.g. a condor-like system). Similarly, there isn’t really any multithreading in YREC, so it’s one core per model and they will run in series. I make that happen with a shell script batchrunner2017aeryn.sc, that copies things to the model running directory, and then pipes the terminal output to a file and keeps count of how long (wall time) each model took to run.  That said, if your computer has many cores, you can take advantage of that by having many of these runs going in parallel. I did that by distributing the input files into several different folders (batchdistributer.sc) and then starting a batchrunner run for each folder. Note that, if you’re doing a lot of models at a time, they will run into issues if they try to access the same input files at the same time. I dealt with that by copying the yrec code roughly half as many times as I was going to have folders so that conflicts would be rare. I’m sure there are smarter ways to do things, but that worked for me. 

**Processing Big Grids**

Gridcheck.pro

processor3tip.py

https://zenodo.org/records/15792763

Once you have run a big grid like this, it’s useful to get a sense of which models actually ran. I use Gridcheck.pro to do this in a graphical way (for each mass and metallicity make a symbol on a plot if the model ran, leave it blank if no model did). Processor3tip.py is Garrett Somer’s code that interpolates in the tracks to set up regularly spaced points, which functionally downsamples the models for ease of uses, as well as removes excess columns. That similarly can provide lists of tracks that didn’t run or didn’t complete which may be useful.

**Interpolating in Big Grids**

kiauhoku: https://github.com/zclaytor/kiauhoku

runner5py3.py

interp5newpy3.py

https://zenodo.org/records/15792763

In order to actually estimate something like ages from the grids of models, you have to be able to interpolate between them to predict the properties of any observed (or hypothetical) star of any particular mass/metallicity/temperature/luminosity/logg/Teff/etc. This is usually handled by a separate code. The two versions I have used for this interpolation are the public open source option called kiauhoku, built by Dr. Zachary Claytor, which has the functionality to load in new grids of models, and a particular interpolator designed for red giant models built by Dr. Garrett Somers. In general, such codes will involve resampling the original model tracks into something more regular- often but not always these are EEPs, equivalent evolutionary points, to allow for more reasonable alignment of and interpolation between tracks. 
