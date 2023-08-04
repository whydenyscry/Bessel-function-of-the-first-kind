# Bessel functions of the first kind
The Bessel functions of the first kind $J_n(x)$ are defined as the solutions to the Bessel differential equation
$$x^2\frac{\mathrm{d}^2y}{\mathrm{d}x^2}+x\frac{\mathrm{d}y}{\mathrm{d}x}+\left(x^2-n^2\right)y=0$$
which are nonsingular at the origin. 

**Hansen-Bessel formula**
$${\displaystyle J_{n}(x)={\frac {1}{\pi }}\int _{0}^{\pi }\cos(n\tau -x\sin \tau )\mathrm{d}\tau ={\frac {1}{2\pi }}\int _{-\pi }^{\pi }e^{i(n\tau -x\sin \tau )}\mathrm{d}\tau } $$

The script evaluates the zeros of Bessel functions $J_n(x)$ and  Bessel prime functions $J'_n(x)$. By default, the files _BZerosGuess.xlsx_, _BPrimeZerosGuess.xlsx_ contain the initial guesses of the first five positive roots of the six Bessel functions. The structure of these files is described in the document _BesselFunctionZeros_report.pdf_. You have the possibility to add to the files with initial guesses the number of zeros and functions you need.

The output is two documents _BesselZeros.xlsx_ and _BesselPrimeZeros.xlsx_ of identical structure that contain the zeros of the above functions.
