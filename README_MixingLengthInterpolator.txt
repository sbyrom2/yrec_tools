(this is actually a copy of an email to Joel, not a real readme, but it's better than nothing. good luck future me)

Here's what I have for interpolating in the grid of models.

I modified Garrett's code, which was designed to take in the mass, logg and composition (metallicity and [alpha/Fe], it assumes helium enrichment Y goes linearly with Z) and output the predicted temperature of the model grid. It would also use the measured temperature to predict what mixing length would be needed to get the model and measured temperatures to agree

I wrote runner5noseis.py and interp5newnoSeis.py to instead take in the metallicity, logg, composition and temperature and interpolate to figure out what mass the star should have, assuming a mixing length. I'm guessing you can either use that directly (having a mass and a logg you can get a radius, and with radius and temperature you have luminosity), or you could modify the code to actually interpolate to the luminosity. 

all of this is located at /home/spitzer/tayar/Documents/MixingLength/Garrett and written in python

Here's how it works:

 Processor.py takes my grid of YREC .track files and downsamples and interpolates them into a grid of temperatures at regularly spaced gravities. This substantially speeds up the interpolation time.

interp5newnonSeis.py is based off of Garrett's interp5new.py which took the given mass, gravity, and composition and predicted a temperature and a mixing length. This version of it takes in the the stellar gravity, temperature, and composition and predicts a mass given a mixing length and the grid of models. 

The python code is located in /home/spitzer/tayar/Documents/MixingLength/Garrett. It reads in data from 'data_files' and outputs results to 'new_outfiles'. To use the interpolator in interp5newnonSeis.py, you actually run runner5noseis.py, which loops through the stars listed in the input file. Note that if a star fails, it will crash the program with some error (usually telling you that a bunch of tracks didn't go to the logg you requested). At that point, you can add that star to OnesToSkip, and rerun the program. It is smart enough to detect that it has already run all the previous stars in the list, so it will start with the broken one, skip it, and then move on. This is an extremely annoying process, especially if your list has hundreds of stars that break, but it works, so I'll take what I can get. I'm pretty sure OnesToSkip has to have at least two numbers in it at all times, so I usually start it out with two random numbers I'm not using in my list, or two copies of the first broken star. 

At this point, the code does not do anything to measure the errors in the interpolated value, even though the input lists contain the errors on the inputs. I assume you could write some sort of wrapper which samples the probability distributions for each of the input parameters and computes the range of outputs if that's important to what you're doing it. Note that interp5newnonSeis is currently slow, because I wrote it, and because it interpolates a temperature in the full grid for every mass between 0.6 and 2.6, so it's not crazy to think about optimizing that somehow if you're going to end up monte carloing errors or something.


Note that right now the code is set up to run on 4z, which is my most current grid of models. In case you're interested in what that contains, the models are at /data/zuul/0/tayar/YRECgrid/nodiff_out4z

Track files are named things like m100fhm000y273a17al00_grnodf.track for a mass of 1.00 (ranges from 0.60-2.60 in steps of 0.1), an [Fe/H] (note that this is [Fe/H] and not [M/H]) of -0.00 (ranges from -2.0 to +0.6 in steps of 0.2), a helium value of 0.273, with a mixing length of 1.7, an [alpha/fe] enhancement of +0.0, and a grey atmosphere run without diffusion. This is the solar model. Other options in the grid are:

masses:
       ms=['0.60D0', '0.70D0', '0.80D0', '0.90D0', '1.00D0', '1.10D0', '1.20D0', '1.30D0', '1.40D0', $
           '1.50D0', '1.60D0', '1.70D0', '1.80D0', '1.90D0', '2.00D0', '2.10D0', '2.20D0', $
           '2.30D0', '2.40D0', '2.50D0', '2.60D0'  ]
       mname=['060', '070','080', '090', '100', '110','120', '130','140', '150','160',$
              '170', '180','190', '200', '210', '220','230', '240','250', '260']

[Fe/H]:
       fh=[0.60, 0.40, 0.20, 0.00, -0.2, -0.4, -0.6, -0.8, -1.0, -1.2, -1.4, -1.6, -1.8, -2.0]
       fhname=['p060','p040', 'p020', 'm000', 'm020', 'm040', 'm060', 'm080', 'm100', 'm120', 'm140','m160', 'm180', 'm200']

helium values:

       ys=[0.239, 0.272683, 0.290,0.330]
       yname=['239', '273', '290','330']

Mixing lengths:

       as=['17', '12', '22']
       alphas=['1.724485D0', '1.224485D0', '2.224485D0']

Alpha element enhancements
       aenhances=['00', '02','04']
       for +0.0, +0.2, and +0.4

All of the models are run with a grey atmosphere and no diffusion. Note that if you want really metal rich, alpha enhanced models, you actually hit the metallicity edge of the opacity tables, so those files will have crashed. 

Sorry that's so long, but definitely let me know if you have questions or I can be helpful.

Cheers,
Jamie

November 2017 update, because I had to pull this out again

To run the code on a new list

Generate a dataset in APGquick14savb.txt using writecol (copy the old MLtesterr stuff modified for the new file)
copy that file into Garrett/data_files

remember to find-replace 2M to space 2M 
and you HAVE to add the header line

Open runner5.py

Replace the infile at the top with your new infile
Set up a new OnesToSkip vector (might need to have two elements, so just put 0 twice)
run > python runner5.py

as stars fail, copy their name into the OnesToSkip vector so that the program skips it

The program will output fits to Garrett/new_outfiles with the same name as your infile plus a 5.out

copy that file to MixingLength/out_files  (why this step exists I'm not sure, but we'll go with it)

MixingLength/QuantifyJT.py was what I used for the paper, but I made a QuantifyJTDR14.py so that I can edit without breaking that version


June 7, 2018 note:
when you run the new grid modeling grid

when doing grid modeling (talk at KASC)?
- convective overshoot
- diffusion on
- no mass loss
- LOOK at TEFFS- 2sigma teffs off -> binaries, mergers
- C/N, same thing

February 20, 2018 note:
Aeryn has python 3, so I've created 
runner5noseispy3.py and interp5newnonSeispy3.py
to run with python 3 on Aeryn. The only things that needed changing were:
-print statements (print x to print (x)) 
-the location of the grid /home/tayar.1/Documents versus /home/jtayar/Documents
-xrange(len( -> range(len(

May 13, 2020 note:
Making a new runner5py3.py

QuantifyJTDR14.py doesn't seem to work with python 3. too lazy to fix it now.

January 26, 2020 note:
added a try except to runner5py3.py that seems to remove the need for the OnesToSkip list (I think?)
