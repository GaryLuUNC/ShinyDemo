# ShinyDemo

This interactive visualization allows you to choose a year on the slider that a Summer Olympics took place in and the bar plot will show how many medals each country won in the Summer Olympics in that year. You can also select boxes to select properties so that only the medals that satisfy these properties will be included in the plot.  

To run the visualization:

1. Download Shiny.R and Summer-Olympic-medals-1976-to-2008.csv from this repository. If you are on github.com, you can do it by clicking on Code above the repository and then clicking on Download ZIP.
2. Open up RStudio.
3. Run the line of code ```getwd()``` in RStudio to see which folder does R look for files. 
4. Save Shiny.R and Summer-Olympic-medals-1976-to-2008.csv to said folder.
5. In the VCL terminal, run the following code:  
```
sudo git clone https://github.com/GaryLuUNC/ShinyDemo.git
cd ShinyDemo
docker build -t "name:Dockerfile" .
```
6. Open up Shiny.R in RStudio and run the script.


Note: It is recommended that you view this visualization in full screen.
