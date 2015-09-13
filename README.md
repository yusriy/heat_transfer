# Heat transfer calculations using R
Some numerical solutions to heat transfer problems for IEK212/3 heat transfer and its application course.
One of the first simple example is the unsteady-state one-dimensional heat conduction equation (Fourier equation).

1. `unsteady_state_conduc_1D.R` - function to calculate the one-dimensional temperature changes with time and distance caused by heat conduction at a source.
2. `plot_results.R` - script to automatically plot the results (multi-images) of the unsteady-state heat conduction simulation in PNG format. They can be combined to make a GIF.
3. `unsteady_state_conduc_2D.R` - same as above but for 2 D
4. `plot_results2D.R` - plot 2 D results using levelplot through the `{lattice}` package

I will continue to build this repository with more useful examples when I have time.
