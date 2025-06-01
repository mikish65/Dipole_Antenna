# Dipole_Antenna
Visualizing changes in dipole antenna pattern, resonance with length
## Overview
This is a matlab code to simulate the initial stages of a dipole antenna manual optimization
The optimization is done via the adjustment of the dipole antena length periodically and measurement of the effects on the pattern, the reflection coefficient/return loss (S11) and the impedance.

### Reflection coefficient/ Return loss/ S11
S11 indicates the resonant frequency to be the point at which S11 is most negative, i.e. where antenna reflects the least power.
It also determines the bandwidth since BW is the range of frequencies around resonant frequency below a threshold i.e. -10dB that is VSWR = 2:1. 
S11 offers the point of best match for resonant frequency.
Lengths above 0.8lambda have poorer matching indicated by shallower depths
### Impedance
Impedance at resonant frequency should be close to 50ohms for real part and 0 ohms for imaginary part.
Indicates resonant frequency as the frequency where imaginary part crosses zero or the real part is at its maximum.
At longer lengths from 0.9lambda, there are multiple zero crossings by imaginary Z indicating harmonic resonances. The conclusion is, the antenna has optimal length beyond which the waves start being reflected within it, causing there to be standing waves (VSWR), hence resulting in the harmonics (sidelobes) or higher order nodes, beside the fundamental gain lobe.
### Gain/Pattern
The omnidirectional property ceases at length = 1*lambda
At lengths greater than 0.5lambda (ideal antenna height), pattern should develop side lobes and weaken amin lobe due to current distribution distortion. These reduce directivity hence length increases gain but beyond 1lambda decreases gain directivity.

The Gain and pattern does not change with frequency. 300MHz gain is equal to 1GHz gain.
The resonance frequency falls by 100MHz for every increase in length by (+)0.1lambda. The widest BW is at 0.6lambda, equaling 63MHz around resonant frequency 800MHz, then 0.8lambda, equaling 60MHz, around center frequency 600MHz. BW fluctuates and doesn’t vary linearly due to Q-Factor, radiation resistance and matching.

