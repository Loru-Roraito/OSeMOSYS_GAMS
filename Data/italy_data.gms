** configuration options
** prova
$setglobal storage 1
$setglobal yearstart 2015
$setglobal yearend 2100
$setglobal initialvolume 500

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
parameter forming_rate(YEAR);

Set yRange0(YEAR);
Set yRange1(YEAR);
Set yRange2(YEAR);
Set yRange3(YEAR);
Set yRange4(YEAR);

yRange0(YEAR) = yes$(YEAR.val >= 2015 and YEAR.val <= 2019);
yRange1(YEAR) = yes$(YEAR.val >= 2020 and YEAR.val <= 2030);
yRange2(YEAR) = yes$(YEAR.val >= 2030 and YEAR.val <= 2040);
yRange3(YEAR) = yes$(YEAR.val >= 2040 and YEAR.val <= 2050);
yRange4(YEAR) = yes$(YEAR.val >= 2050 and YEAR.val <= 2100);

melting_rate(y) = %initialvolume%*0.0164*(2.71828**(-0.0164*ord(y)));
forming_rate(y) = 0;

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
