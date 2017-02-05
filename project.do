cd " C:\Users\user\Desktop\AbinBev"
import excel using hackdata.xlsx
//For industry using entire dataset
gen logprice = log(pricepervolume)
gen logsales = log (volumesales)
reg logsales logprice
reg logsales logprice displayshare 
reg logsales logprice displayshare featureshare
reg logsales logprice displayshare distribution
vif
save "data1.dta",replace
//For AbInBev
drop if brewervalue != "ABI"
reg logsales logprice
reg logsales logprice displayshare 
reg logsales logprice displayshare featureshare
reg logsales logprice displayshare distribution
vif
//For Competitors
import "data1.dta" 
drop if brewervalue == "ABI"
reg logsales logprice
reg logsales logprice displayshare 
reg logsales logprice displayshare featureshare
reg logsales logprice displayshare distribution
vif

