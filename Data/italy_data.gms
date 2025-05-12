** configuration options

$setglobal custom "NCMMD2"
$setglobal scen "ctaxchanging" # set actual curve in osemosys.gms
$setglobal storage 1
$setglobal yearstart 2015
$setglobal yearend 2060
$setglobal initialvolume 100 #ice volume in the glaciers
$setglobal rains 31.72 # km3 rainfall/rivers that go into the dams unrelated to ice melt
$setglobal dampercentage 0.5 * 6.6 #melting ice that goes to the dams, 6.6 considering melting
$setglobal riverpercentage 0.3 * 6.6 #melting ice that goes to the rivers
$setglobal initialstorage 13.5 #km3 water in dams
$setglobal maxdamextraction 37 #km3 water that can be extracted from the dams
$setglobal exponent 0.0164 #exponent for the melting rate

$setglobal divergence 0 #divergence for the melting rate (default 0, low -0.25, high 0.2)
$setglobal energygrowth 0.02 # annual growth of the electricity demand (default 0.02, low 0.01, high 0.25)

*------------------------------------------------------------------------	
* Sets       
*------------------------------------------------------------------------
set     YEAR    / %yearstart%*%yearend% /;
set     EMISSION        / CO2 /;
set     MODE_OF_OPERATION       / 1, 2 /;
set     REGION  / ITALY /;
set     TIMESLICE  / ID, IN, SD, SN, WD, WN /;
set     SEASON / 1, 2, 3 /;
set     DAYTYPE / 1 /;
set     DAILYTIMEBRACKET / 1, 2 /;

parameter melting_rate(YEAR);
parameter correction_factor(YEAR);
parameter rains(YEAR); #km3

Set yRange0(YEAR);
Set yRange1(YEAR);
Set yRange2(YEAR);
Set yRange3(YEAR);
Set yRange4(YEAR);
set yNoCoal(YEAR); # period with no coal
set yNoCO2(YEAR); # period with no CO2
set yCurrent(YEAR); # from 2015 to 2023

yRange0(YEAR) = yes$(YEAR.val >= 2015 and YEAR.val <= 2020);
yRange1(YEAR) = yes$(YEAR.val >= 2020 and YEAR.val <= 2030);
yRange2(YEAR) = yes$(YEAR.val >= 2030 and YEAR.val <= 2040);
yRange3(YEAR) = yes$(YEAR.val >= 2040 and YEAR.val <= 2050);
yRange4(YEAR) = yes$(YEAR.val >= 2050 and YEAR.val <= 2060);
yNoCoal(YEAR) = yes$(YEAR.val >= 2025 and YEAR.val <= 2060);
yNoCO2(YEAR)  = yes$(YEAR.val >= 2025 and YEAR.val <= 2060);
yCurrent(YEAR)= yes$(YEAR.val >= 2015 and YEAR.val <= 2023);

melting_rate(y) = %initialvolume%*%exponent%*exp(-%exponent%*ord(y)) - (%divergence%);
correction_factor(y) = 1;
correction_factor(y) = %exponent%*(%initialvolume%*exp(-%exponent%*ord(y))+(%divergence%)*ord(y))/melting_rate(y);

# characterize technologies 
set power_plants(TECHNOLOGY);
set storage_plants(TECHNOLOGY);
set fuel_transformation(TECHNOLOGY);
set appliances(TECHNOLOGY);
set unmet_demand(TECHNOLOGY);
set transport(TECHNOLOGY);
set primary_imports(TECHNOLOGY);
set secondary_imports(TECHNOLOGY);

set renewable_tech(TECHNOLOGY); 
set renewable_fuel(FUEL); 

set fuel_production(TECHNOLOGY);
set fuel_production_fict(TECHNOLOGY);
set secondary_production(TECHNOLOGY);

#Characterize fuels 
set primary_fuel(FUEL);
set secondary_carrier(FUEL);
set final_demand(FUEL);

*$include "Model/osemosys_init.gms"

$batinclude "Input_%data%/input_primary.gms" "sets"
$batinclude "Input_%data%/input_secondary.gms" "sets"
$batinclude "Input_%data%/input_storage.gms" "sets"
$batinclude "Input_%data%/input_demand.gms" "sets"

$batinclude "Input_%data%/init.gms" "pre"

$batinclude "Input_%data%/input_primary.gms" "data"
$batinclude "Input_%data%/input_secondary.gms" "data"
$batinclude "Input_%data%/input_storage.gms" "data"
$batinclude "Input_%data%/input_demand.gms" "data"

$batinclude "Input_%data%/input_primary.gms" "popol"
$batinclude "Input_%data%/input_secondary.gms" "popol"
$batinclude "Input_%data%/input_storage.gms" "popol"
$batinclude "Input_%data%/input_demand.gms" "popol"

$batinclude "Input_%data%/init.gms" "post"
