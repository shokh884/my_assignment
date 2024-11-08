* I opened and read my .dta file 
cd C:\Users\Tursunov_Shokhijakho\Downloads\homework_coding
use "C:\Users\Tursunov_Shokhijakho\Downloads\homework_coding\clean\football_managers_workfile.dta"
bro
* deleted missing values and unrelated variables as well
codebook
describe
tabulate points_lastseason, missing
drop if missing(points_lastseason)
drop caretaker div hometeam_uid awayteam_uid
count
* i did some transformation of variables
egen goals_by_team = count(team), by(goals)
bro
egen new = count(goals), by(team)
bro
drop new goals_by_team
egen goals_by_team = count(goals), by(team)
bro
// i created summary statistics and histogram, in the end i saved my graph as a file
sum, detail
help hist
hist points_lastseason
graph save Graph
graph export "Graphic.png", as(png) replace
// saving my data
pwd
mkdir code
cd C:\Users\Tursunov_Shokhijakho\Downloads\homework_coding\code
save "C:\Users\Tursunov_Shokhijakho\Downloads\homework_coding\code\my_data.dta", replace  