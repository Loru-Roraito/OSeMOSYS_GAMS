** configuration options
** prova
$setglobal storage 1
$setglobal yearstart 2025
$setglobal yearend 2125

**DV/Dt= -0.0053 * modulo(T(t)-Teq(t)) * (T(t)-Teq(t))^2 * (V(t-1)/100)^0.2
**Teq = 3.4*(1-V(t)/100)

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

melting_rate(y) = 5*100*0.0164*(2.71828**(-0.0164*ord(y)));
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
