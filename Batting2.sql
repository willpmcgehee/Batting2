use stats;

#This query is designed to return relevent batting statistics for each team-season.
#This data will be used to reproduce the model dictated in Chapter 3 of The Hidden Game of Baseball

#Team name and Year identifier information
select yearID, name, 
#Return Runs generated
R,
#Return Estimated Innings over the season. This will not be precise
G*9 as innings,
#Batting Average
H/AB as BA, 
#On Base Percentage
(H+BB+HBP)/(AB+BB+HBP+SF)as OBP, 
#Slugging percentage
((H-2B-3B-HR)+(2B*2)+(3B*3)+(HR*4))/AB as SLG,
#Isolated Power: SLG - BA
(((H-2B-3B-HR)+(2B*2)+(3B*3)+(HR*4))/AB)-(H/AB) as ISO,
#Total Average (NOTE: Does not include Ground Into Double Play stat)
((H-2B-3B-HR)+(2B*2)+(3B*3)+BB+HBP+SB-CS)/(AB-H+CS) as TA, 
#Linear Weights Statistic (NOTE: Does not include Out On Base stat as not available)
((0.46)*(H-2B-3B-HR))+((0.8)*(2B))+((1.02)*(3B))+((1.4)*(HR))+((0.33)*(BB+HBP))+((0.3)*(SB))-((0.6)*(CS))-((0.25)*(AB-H)) as LinWeights
from teams 
#Consider teams only from 1951 and onwards
where yearID>1950;
