####set up databases and add country column in it
databases_discuss <- 
Country <- matrix(NA,nrow(databases_discuss),1)
databases_discuss <- cbind(databases_discuss,Country)

###USA
USA1 <- which(grepl("USA", databases_discuss$Location))
USA2 <- which(grepl("United State", databases_discuss$Location))
USA3 <- which(grepl("US", databases_discuss$Location))
USA4 <- which(grepl("U.S.", databases_discuss$Location))
databases_discuss[USA1,4] <- "USA"
databases_discuss[USA2,4] <- "USA"
databases_discuss[USA3,4] <- "USA"
databases_discuss[USA4,4] <- "USA"

State_USA <- c("AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID",
               "IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS",
               "MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK",
               "OR","PA","PR","RI","SC","SD","TN","TX","UT","VT","VA","WA",
               "WV","WI","WY")
for (su in 1:length(State_USA)) {
  USA5 <- which(grepl(State_USA[su], databases_discuss$Location)) 
  databases_discuss[USA5,4] <- "USA"
}

State_USA2 <- c("Alabama","Alaska","Arizona", "Arkansas","California","Colorado","Connecticut","Delaware",           
                "District of Columbia","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa",                
                "Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota",             
                "Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico",
                "New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Puerto Rico",
                "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia",
                "Washington","West Virginia","Wisconsin","Wyoming")

for (i in 1:length(State_USA2)) {
  USA6 <- which(grepl(State_USA2[i], databases_discuss$Location)) 
  databases_discuss[USA6,4] <- "USA"
}

###Canada 
CND1 <- which(grepl("Canada", databases_discuss$Location))
databases_discuss[CND1,4] <- "Canada"
CND2 <- which(grepl("Canadá", databases_discuss$Location))
databases_discuss[CND2,4] <- "Canada"
CND3 <- which(grepl("Alberta", databases_discuss$Location))
databases_discuss[CND3,4] <- "Canada"

###Mexico 
MEX1 <- which(grepl("Mexico", databases_discuss$Location))
databases_discuss[MEX1,4] <- "Mexico"
MEX2 <- which(grepl("México", databases_discuss$Location))
databases_discuss[MEX2,4] <- "México"


###Colombia
COLO1 <- which(grepl("Colombia", databases_discuss$Location))
databases_discuss[COLO1,4] <- "Colombia"

###Brazil Brasil
BRZ1 <- which(grepl("Brazil", databases_discuss$Location))
databases_discuss[BRZ1,4] <- "Brazil"
BRZ2 <- which(grepl("Brasil", databases_discuss$Location))
databases_discuss[BRZ2,4] <- "Brazil"

###Argentina
AGT1 <- which(grepl("Argentina", databases_discuss$Location))
databases_discuss[AGT1,4] <- "Argentina"

###Peru
PR1 <- which(grepl("Peru", databases_discuss$Location))
databases_discuss[PR1,4] <- "Peru"

###Europe
EUR1 <- which(grepl("Europe", databases_discuss$Location))
databases_discuss[EUR1,4] <- "Europe"
EUR2 <- which(grepl("EU", databases_discuss$Location))
databases_discuss[EUR2,4] <- "Europe"

###France
FC1 <- which(grepl("France", databases_discuss$Location))
databases_discuss[FC1,4] <- "France"
FC2 <- which(grepl("Paris", databases_discuss$Location))
databases_discuss[FC2,4] <- "France"

###Switzerland 
SWL1 <- which(grepl("Switzerland", databases_discuss$Location))
databases_discuss[SWL1,4] <- "Switzerland"
SWL2 <- which(grepl("Schweiz", databases_discuss$Location))
databases_discuss[SWL2,4] <- "Switzerland"

###UK
UK1 <- which(grepl("United Kingdom", databases_discuss$Location))
databases_discuss[UK1,4] <- "UK"
UK2 <- which(grepl("UK", databases_discuss$Location))
databases_discuss[UK2,4] <- "UK"
UK3 <- which(grepl("England", databases_discuss$Location))
databases_discuss[UK3,4] <- "UK"
UK4 <- which(grepl("Scotland", databases_discuss$Location))
databases_discuss[UK4,4] <- "UK"
UK5 <- which(grepl("U.K.", databases_discuss$Location))
databases_discuss[UK5,4] <- "UK"
UK6 <- which(grepl("London", databases_discuss$Location))
databases_discuss[UK6,4] <- "UK"

###Ireland
IRL4 <- which(grepl("Ireland", databases_discuss$Location))
databases_discuss[IRL4,4] <- "Ireland"

###Finland
FL1 <- which(grepl("Finland", databases_discuss$Location))
databases_discuss[FL1,4] <- "Finland"

###Norway Norge
NW1 <- which(grepl("Norway", databases_discuss$Location))
databases_discuss[NW1,4] <- "Norway"
NW2 <- which(grepl("Norge", databases_discuss$Location))
databases_discuss[NW2,4] <- "Norway"

###Sweden 
SWD1 <- which(grepl("Sweden", databases_discuss$Location))
databases_discuss[SWD1,4] <- "Sweden"
SWD2 <- which(grepl("Sverige", databases_discuss$Location))
databases_discuss[SWD2,4] <- "Sweden"

###Denmark
DEM1 <- which(grepl("Denmark", databases_discuss$Location))
databases_discuss[DEM1,4] <- "Denmark"

###Germany
GM1 <- which(grepl("Germany", databases_discuss$Location))
databases_discuss[GM1,4] <- "Germany"
GM2 <- which(grepl("Deutschland", databases_discuss$Location))
databases_discuss[GM2,4] <- "Germany"

###Luxembourg
LXB1 <- which(grepl("Luxembourg", databases_discuss$Location))
databases_discuss[LXB1,4] <- "Luxembourg"

###Poland 
POL1 <- which(grepl("Poland", databases_discuss$Location))
databases_discuss[POL1,4] <- "Poland"
POL2 <- which(grepl("Polska", databases_discuss$Location))
databases_discuss[POL2,4] <- "Poland"
POL3 <- which(grepl("Polen", databases_discuss$Location))
databases_discuss[POL3,4] <- "Poland"

###Greece
GRE1 <- which(grepl("Greece", databases_discuss$Location))
databases_discuss[GRE1,4] <- "Greece"

###Belgium
BLG1 <- which(grepl("Belgium", databases_discuss$Location))
databases_discuss[BLG1,4] <- "Belgium"
BLG2 <- which(grepl("België", databases_discuss$Location))
databases_discuss[BLG2,4] <- "Belgium"

###Italy
ITA1 <- which(grepl("Italy", databases_discuss$Location))
databases_discuss[ITA1,4] <- "Italy"
ITA2 <- which(grepl("Italia", databases_discuss$Location))
databases_discuss[ITA2,4] <- "Italy"

###Netherland Nederländerna
NTL1 <- which(grepl("Netherland", databases_discuss$Location))
databases_discuss[NTL1,4] <- "Netherland"
NTL2 <- which(grepl("Nederländerna", databases_discuss$Location))
databases_discuss[NTL2,4] <- "Netherland"
NTL3 <- which(grepl("Nederland", databases_discuss$Location))
databases_discuss[NTL3,4] <- "Netherland"

###Czech Republic
CZR1 <- which(grepl("Czech Republic", databases_discuss$Location))
databases_discuss[CZR1,4] <- "Czech Republic"

###Lithuania
LITH1 <- which(grepl("Lithuania", databases_discuss$Location))
databases_discuss[LITH1,4] <- "Lithuania"

###Romania
ROMA1 <- which(grepl("Romania", databases_discuss$Location))
databases_discuss[ROMA1,4] <- "Romania"

###Latvia
LTV1 <- which(grepl("Latvia", databases_discuss$Location))
databases_discuss[LTV1,4] <- "Latvia"

###Estonia
ESN1 <- which(grepl("Estonia", databases_discuss$Location))
databases_discuss[ESN1,4] <- "Estonia"


###Hungary
HUG1 <- which(grepl("Hungary", databases_discuss$Location))
databases_discuss[HUG1,4] <- "Hungary"

###Serbia
SBA1 <- which(grepl("Serbia", databases_discuss$Location))
databases_discuss[SBA1,4] <- "Serbia"

###Spain
SPN1 <- which(grepl("Spain", databases_discuss$Location))
databases_discuss[SPN1,4] <- "Spain"
SPN2 <- which(grepl("España", databases_discuss$Location))
databases_discuss[SPN2,4] <- "Spain"

###Portugal
PTG1 <- which(grepl("Portugal", databases_discuss$Location))
databases_discuss[PTG1,4] <- "Portugal"

###Turkey
TUK1 <- which(grepl("Turkey", databases_discuss$Location))
databases_discuss[TUK1,4] <- "Turkey"
TUK2 <- which(grepl("Türkiye", databases_discuss$Location))
databases_discuss[TUK2,4] <- "Turkey"

###Cyprus
CYP1 <- which(grepl("Cyprus", databases_discuss$Location))
databases_discuss[CYP1,4] <- "Cyprus"

###Bulgaria
BGR1 <- which(grepl("Bulgaria", databases_discuss$Location))
databases_discuss[BGR1,4] <- "Bulgaria"

###Austria
AUSI1 <- which(grepl("Austria", databases_discuss$Location))
databases_discuss[AUSI1,4] <- "Austria"


###India
IND1 <- which(grepl("India", databases_discuss$Location))
databases_discuss[IND1,4] <- "India"

###Pakistan
PAKT1 <- which(grepl("Pakistan", databases_discuss$Location))
databases_discuss[PAKT1,4] <- "Pakistan"

###Iran
IRAN1 <- which(grepl("Iran", databases_discuss$Location))
databases_discuss[IRAN1,4] <- "Iran"

###Thailand
THAI1 <- which(grepl("Thailand", databases_discuss$Location))
databases_discuss[THAI1,4] <- "Thailand"

###Taiwan
TW1 <- which(grepl("Taiwan", databases_discuss$Location))
databases_discuss[TW1,4] <- "Taiwan"

###China
CHI1 <- which(grepl("China", databases_discuss$Location))
databases_discuss[CHI1,4] <- "China"
CHI2 <- which(grepl("中国", databases_discuss$Location))
databases_discuss[CHI1,4] <- "China"

###Hong Kong
HK1 <- which(grepl("Hong Kong", databases_discuss$Location))
databases_discuss[HK1,4] <- "Hong Kong"

###Japan
JAP1 <- which(grepl("Japan", databases_discuss$Location))
databases_discuss[JAP1,4] <- "Japan"
JAP2 <- which(grepl("Tokyo", databases_discuss$Location))
databases_discuss[JAP2,4] <- "Japan"

###South Korea
SKOR1 <- which(grepl("South Korea", databases_discuss$Location))
databases_discuss[SKOR1,4] <- "South Korea"
SKOR2 <- which(grepl("Korea", databases_discuss$Location))
databases_discuss[SKOR2,4] <- "South Korea"

###Malaysia
MLS1 <- which(grepl("Malaysia", databases_discuss$Location))
databases_discuss[MLS1,4] <- "Malaysia"

###Singapore
SGP1 <- which(grepl("Singapore", databases_discuss$Location))
databases_discuss[SGP1,4] <- "Singapore"

###Philippines
PHL1 <- which(grepl("Philippines", databases_discuss$Location))
databases_discuss[PHL1,4] <- "Philippines"

###Vietnam
VIET1 <- which(grepl("Vietnam", databases_discuss$Location))
databases_discuss[VIET1,4] <- "Vietnam"
VIET2 <- which(grepl("Viet Nam", databases_discuss$Location))
databases_discuss[VIET2,4] <- "Vietnam"

###Cambodia
CBD1 <- which(grepl("Cambodia", databases_discuss$Location))
databases_discuss[CBD1,4] <- "Cambodia"

###Nepal
NEP1 <- which(grepl("Nepal", databases_discuss$Location))
databases_discuss[NEP1,4] <- "Nepal"

###Kazakhstan
KZK1 <- which(grepl("Kazakhstan", databases_discuss$Location))
databases_discuss[KZK1,4] <- "Kazakhstan"

###Banglades
BGL1 <- which(grepl("Banglades", databases_discuss$Location))
databases_discuss[BGL1,4] <- "Banglades"
BGL2 <- which(grepl("Bangladesh", databases_discuss$Location))
databases_discuss[BGL2,4] <- "Banglades"

###Indonesia
INDS1 <- which(grepl("Indonesia", databases_discuss$Location))
databases_discuss[INDS1,4] <- "Indonesia"

###Israel
ISR1 <- which(grepl("Israel", databases_discuss$Location))
databases_discuss[ISR1,4] <- "Israel"

###Australia
ASL1 <- which(grepl("Australia", databases_discuss$Location))
databases_discuss[ASL1,4] <- "Australia"

###New Zealand
NZL1 <- which(grepl("New Zealand", databases_discuss$Location))
databases_discuss[NZL1,4] <- "New Zealand"

###Russia
RUS1 <- which(grepl("Russia", databases_discuss$Location))
databases_discuss[RUS1,4] <- "Russia"

###Belarus
BLR1 <- which(grepl("Belarus", databases_discuss$Location))
databases_discuss[BLR1,4] <- "Belarus"

###Ukraine
UKR1 <- which(grepl("Ukraine", databases_discuss$Location))
databases_discuss[UKR1,4] <- "Ukraine"

###Egypt
EGY1 <- which(grepl("Egypt", databases_discuss$Location))
databases_discuss[EGY1,4] <- "Egypt"

###Dubai
DBI1 <- which(grepl("Dubai", databases_discuss$Location))
databases_discuss[DBI1,4] <- "Dubai"

###Uganda
UGD1 <- which(grepl("Uganda", databases_discuss$Location))
databases_discuss[UGD1,4] <- "Uganda"

###Kenya
KY1 <- which(grepl("Kenya", databases_discuss$Location))
databases_discuss[KY1,4] <- "Kenya"

###Morocco
MRC1 <- which(grepl("Morocco", databases_discuss$Location))
databases_discuss[MRC1,4] <- "Morocco"

###South Africa
AFR1 <- which(grepl("South Africa", databases_discuss$Location))
databases_discuss[AFR1,4] <- "South Africa"
