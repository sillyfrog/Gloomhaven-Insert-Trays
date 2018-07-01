# Gloomhaven-Insert-Trays
Remixed Gloomhaven Insert Trays from https://www.thingiverse.com/thing:2735536 - these are the source files to allow tweaking for your setup.

The main changes here are:

- Source files, I have re-implemented in OpenSCAD, this allows for easy customisation.
- Thinner floors and walls, I found I didn't need them 3mm thick, so saved the plastic and improved printing times by making everything thinner. This can be tweaked in the `ghmodules.scad` file.
- Holes, lots and lots of holes. These are to make it better when printing with ABS (in theory, not well tested). I wanted ABS so I could use ABS Slurry to join the pieces together reliably.

## ABS Holes

The theory is when printing with ABS, to help prevent warping, putting regular breaks in long runs helps to stop the pull from shrinkage having as much of an impact (which makes sense). I have not tested this well, but managed to print all of these (large) parts in ABS OK. The drawback however is it makes the rendering time for each part *MASSIVE* - so you have to be very patient.

I then used ABS slurry to join them all together, this worked great and the joins are very strong (probably stronger than the rest of the print). As the ABS slurry "welds" the plastic together, there is none of the issues (that I have had at least) with glue.

