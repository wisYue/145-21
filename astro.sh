cd /mnt/d/gildas-src-sep21a/gildas-src-sep21a/
#source admin/gildas-env.sh -o openmp

export DISPLAY=":0.0"
echo $DISPLAY 
xhost + 
#xclock

source admin/gildas-env.sh


@ 30m-setup.astro
project pi "Yue Hu" 
project obs "Yue Hu" 
project id "145-21" 
project nick "W28" 
project clean
project open !Create directories and general.pako script.
$ls
$cat W28/general.pako

newsetup
sourcat open
sourcat add w28 18:02:00.0 -23:30:00.0 8.5 ![J2000 RA] [J2000 Dec] [km s-1].
sourcat close

sourvis !Create a source catalog and save source visibility plot.
$cat w28/w28.sou

let size 1200 1500
sourima w28_2d_image.lm
sourrep w28_2d_image.lm

pointing

psw +700 -700

let setup30m%otf%inp%freq 115.27120 !Requested frequency for the target molecular line [GHz].

otftime dump 0.25 ![second].
otftime stab 100 !Time between two consecutive references [second].
otftime cycle 12 !Time between two consecutive calibrations [minute].
otfgeo w28 2040 2040 0 0 0 ![arcsec] [arcsec] [deg] [arcsec] [arcsec].
otfinput !Dump user inputs.
otfpro
