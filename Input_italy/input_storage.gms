$set phase %1

** ------------------------------------------------
$ifthen.ph %phase%=='sets'

set     STORAGE / BATTERY, DAM, HYDROGEN, GLACIERS /;

SET TECHNOLOGY /HEL_IN   "Hydrogen Electrolyzers",
                HEL_OUT  "Hydrogen Electrolyzers",
                BAT_IN  "Batteries",
                BAT_OUT "Batteries",
                PUMP_HYDRO 'Pumped storage (IN)',
                STOR_HYDRO 'Pumped storage (OUT)',
                INPUT_HYDRO 'Hydro input',
                WATER_HYDRO 'Water storage',
                NET_HYDRO 'Net hydro',
                ICE_MELT   'Glacier melting'/;

set storage_plants(TECHNOLOGY) / HEL_IN, HEL_OUT, BAT_IN, BAT_OUT, PUMP_HYDRO, STOR_HYDRO, INPUT_HYDRO, WATER_HYDRO, ICE_MELT /;

** ------------------------------------------------
$elseif.ph %phase%=='data' 

# Characterize ELECTROLIZERS
AvailabilityFactor(r,'HEL_IN',y) = 0.9;
OperationalLife(r,'HEL_IN') = 10;
CapitalCost(r,'HEL_IN',YEAR)$(yRange0(YEAR)) = 1188;
CapitalCost(r,'HEL_IN',YEAR)$(yRange1(YEAR)) = 1432-49*ord(YEAR);
CapitalCost(r,'HEL_IN',YEAR)$(yRange2(YEAR)) = 1180-32*ord(YEAR);
CapitalCost(r,'HEL_IN',YEAR)$(yRange3(YEAR)) = 552-7*ord(YEAR);
CapitalCost(r,'HEL_IN',YEAR)$(yRange4(YEAR)) = 314;
VariableCost(r,'HEL_IN',m,YEAR)$(yRange0(YEAR)) = 1e-5;
VariableCost(r,'HEL_IN',m,YEAR)$(yRange1(YEAR)) = 1e-5;
VariableCost(r,'HEL_IN',m,YEAR)$(yRange2(YEAR)) = 1e-5;
VariableCost(r,'HEL_IN',m,YEAR)$(yRange3(YEAR)) = 1e-5;
VariableCost(r,'HEL_IN',m,YEAR)$(yRange4(YEAR)) = 1e-5;
FixedCost(r,'HEL_IN',YEAR)$(yRange0(YEAR)) = 47.52;
FixedCost(r,'HEL_IN',YEAR)$(yRange1(YEAR)) = 57.26-1.95*ord(YEAR);
FixedCost(r,'HEL_IN',YEAR)$(yRange2(YEAR)) = 39.65-0.77*ord(YEAR);
FixedCost(r,'HEL_IN',YEAR)$(yRange3(YEAR)) = 39.65-0.77*ord(YEAR);
FixedCost(r,'HEL_IN',YEAR)$(yRange4(YEAR)) = 12.56;
ResidualCapacity(r,'HEL_IN',y) = 5;

# Characterize ELECTROLIZERS
AvailabilityFactor(r,'HEL_OUT',y) = 0.9;
OperationalLife(r,'HEL_OUT') = 10;
CapitalCost(r,'HEL_OUT',YEAR)$(yRange0(YEAR)) = 1188;
CapitalCost(r,'HEL_OUT',YEAR)$(yRange1(YEAR)) = 1432-49*ord(YEAR);
CapitalCost(r,'HEL_OUT',YEAR)$(yRange2(YEAR)) = 1180-32*ord(YEAR);
CapitalCost(r,'HEL_OUT',YEAR)$(yRange3(YEAR)) = 552-7*ord(YEAR);
CapitalCost(r,'HEL_OUT',YEAR)$(yRange4(YEAR)) = 314;
VariableCost(r,'HEL_OUT',m,YEAR)$(yRange0(YEAR)) = 1e-5;
VariableCost(r,'HEL_OUT',m,YEAR)$(yRange1(YEAR)) = 1e-5;
VariableCost(r,'HEL_OUT',m,YEAR)$(yRange2(YEAR)) = 1e-5;
VariableCost(r,'HEL_OUT',m,YEAR)$(yRange3(YEAR)) = 1e-5;
VariableCost(r,'HEL_OUT',m,YEAR)$(yRange4(YEAR)) = 1e-5;
FixedCost(r,'HEL_OUT',YEAR)$(yRange0(YEAR)) = 47.52;
FixedCost(r,'HEL_OUT',YEAR)$(yRange1(YEAR)) = 57.26-1.95*ord(YEAR);
FixedCost(r,'HEL_OUT',YEAR)$(yRange2(YEAR)) = 39.65-0.77*ord(YEAR);
FixedCost(r,'HEL_OUT',YEAR)$(yRange3(YEAR)) = 39.65-0.77*ord(YEAR);
FixedCost(r,'HEL_OUT',YEAR)$(yRange4(YEAR)) = 12.56;
ResidualCapacity(r,'HEL_OUT',y) = 5;

AvailabilityFactor(r,'BAT_IN',y) = 0.95;
OperationalLife(r,'BAT_IN') = 15;
CapitalCost(r,'BAT_IN',YEAR)$(yRange0(YEAR)) = 400;
CapitalCost(r,'BAT_IN',YEAR)$(yRange1(YEAR)) = 425 - 5*ord(YEAR);
CapitalCost(r,'BAT_IN',YEAR)$(yRange2(YEAR)) = 410 - 4*ord(YEAR);
CapitalCost(r,'BAT_IN',YEAR)$(yRange3(YEAR)) = 360 - 2*ord(YEAR);
CapitalCost(r,'BAT_IN',YEAR)$(yRange4(YEAR)) = 290;
VariableCost(r,'BAT_IN',m,YEAR)$(yRange0(YEAR)) = 1e-5;
VariableCost(r,'BAT_IN',m,YEAR)$(yRange1(YEAR)) = 1e-5;
VariableCost(r,'BAT_IN',m,YEAR)$(yRange2(YEAR)) = 1e-5;
VariableCost(r,'BAT_IN',m,YEAR)$(yRange3(YEAR)) = 1e-5;
VariableCost(r,'BAT_IN',m,YEAR)$(yRange4(YEAR)) = 1e-5;
FixedCost(r,'BAT_IN',YEAR)$(yRange0(YEAR)) = 10.0;
FixedCost(r,'BAT_IN',YEAR)$(yRange1(YEAR)) = 11 - 0.2*ord(YEAR);
FixedCost(r,'BAT_IN',YEAR)$(yRange2(YEAR)) = 10.25 - 0.15*ord(YEAR);
FixedCost(r,'BAT_IN',YEAR)$(yRange3(YEAR)) = 8.7 - 0.1*ord(YEAR);
FixedCost(r,'BAT_IN',YEAR)$(yRange4(YEAR)) = 5.2;
ResidualCapacity(r,'BAT_IN',y) = 1;

AvailabilityFactor(r,'BAT_OUT',y) = 0.95;
OperationalLife(r,'BAT_OUT') = 15;
CapitalCost(r,'BAT_OUT',YEAR)$(yRange0(YEAR)) = 228;
CapitalCost(r,'BAT_OUT',YEAR)$(yRange1(YEAR)) = 294 - 13*ord(YEAR);
CapitalCost(r,'BAT_OUT',YEAR)$(yRange2(YEAR)) = 125 - 2*ord(YEAR);
CapitalCost(r,'BAT_OUT',YEAR)$(yRange3(YEAR)) = 128 - 2*ord(YEAR);
CapitalCost(r,'BAT_OUT',YEAR)$(yRange4(YEAR)) = 57;
VariableCost(r,'BAT_OUT',m,YEAR)$(yRange0(YEAR)) = 1e-5;
VariableCost(r,'BAT_OUT',m,YEAR)$(yRange1(YEAR)) = 1e-5;
VariableCost(r,'BAT_OUT',m,YEAR)$(yRange2(YEAR)) = 1e-5;
VariableCost(r,'BAT_OUT',m,YEAR)$(yRange3(YEAR)) = 1e-5;
VariableCost(r,'BAT_OUT',m,YEAR)$(yRange4(YEAR)) = 1e-5;
FixedCost(r,'BAT_OUT',YEAR)$(yRange0(YEAR)) = 5.7;
FixedCost(r,'BAT_OUT',YEAR)$(yRange1(YEAR)) = 7.35 - 0.33*ord(YEAR);
FixedCost(r,'BAT_OUT',YEAR)$(yRange2(YEAR)) = 3.14 - 0.05*ord(YEAR);
FixedCost(r,'BAT_OUT',YEAR)$(yRange3(YEAR)) = 3.14 - 0.05*ord(YEAR);
FixedCost(r,'BAT_OUT',YEAR)$(yRange4(YEAR)) = 1.43;
ResidualCapacity(r,'BAT_OUT',y) = 1;

# characterize dam hydro storage
CapacityFactor(r,'PUMP_HYDRO',"ID",y) = 0.7;
CapacityFactor(r,'PUMP_HYDRO',"IN",y) = 0.7;
CapacityFactor(r,'PUMP_HYDRO',"SD",y) = 0.3;
CapacityFactor(r,'PUMP_HYDRO',"SN",y) = 0.3;
CapacityFactor(r,'PUMP_HYDRO',"WD",y) = 0.5;
CapacityFactor(r,'PUMP_HYDRO',"WN",y) = 0.5;
CapitalCost(r,'PUMP_HYDRO',y) = 1000;
VariableCost(r,'PUMP_HYDRO',m,y) = 1e-5;
FixedCost(r,'PUMP_HYDRO',y) = 1e-5;
OperationalLife(r,'PUMP_HYDRO') = 60;
ResidualCapacity(r,'PUMP_HYDRO',y) = 0.053;
TotalAnnualMaxCapacityInvestment(r,'PUMP_HYDRO',y) = 0;

AvailabilityFactor(r,'STOR_HYDRO',y) = 1;
CapitalCost(r,'STOR_HYDRO',y) = 1000;
VariableCost(r,'STOR_HYDRO',m,y) = 1e-5;
FixedCost(r,'STOR_HYDRO',y) = 1e-5;
OperationalLife(r,'STOR_HYDRO') = 60;
ResidualCapacity(r,'STOR_HYDRO',y) = %maxdamextraction%;
TotalAnnualMaxCapacityInvestment(r,'STOR_HYDRO',y) = 0;

AvailabilityFactor(r,'INPUT_HYDRO',y) = 1;
CapitalCost(r,'INPUT_HYDRO',y) = 1e-5;
VariableCost(r,'INPUT_HYDRO',m,y) = 1e-5;
FixedCost(r,'INPUT_HYDRO',y) = 1e-5;
OperationalLife(r,'INPUT_HYDRO') = 999;
ResidualCapacity(r,'INPUT_HYDRO',y) = %rains%;
TotalAnnualMaxCapacityInvestment(r,'INPUT_HYDRO',y) = 0;

CapacityFactor(r,'WATER_HYDRO',"ID",y) = .18*6/2;
CapacityFactor(r,'WATER_HYDRO',"IN",y) = .12*6;
CapacityFactor(r,'WATER_HYDRO',"SD",y) = .30*6;
CapacityFactor(r,'WATER_HYDRO',"SN",y) = .20*6*2;
CapacityFactor(r,'WATER_HYDRO',"WD",y) = .10*6;
CapacityFactor(r,'WATER_HYDRO',"WN",y) = .10*6*2;
CapitalCost(r,'WATER_HYDRO',y) = 0;
VariableCost(r,'WATER_HYDRO',m,y) = 0;
FixedCost(r,'WATER_HYDRO',y) = 0;
OperationalLife(r,'WATER_HYDRO') = 999;
ResidualCapacity(r,'WATER_HYDRO',y) = correction_factor(y)*melting_rate(y)*%dampercentage%;
TotalAnnualMaxCapacityInvestment(r,'WATER_HYDRO',y) = 0;

AvailabilityFactor(r,'ICE_MELT',y) = 1;
CapitalCost(r,'ICE_MELT',y) = 1e-5;
VariableCost(r,'ICE_MELT',m,y) = 1e-5;
FixedCost(r,'ICE_MELT',y) = 1e-5;
OperationalLife(r,'ICE_MELT') = 999;
ResidualCapacity(r,'ICE_MELT',y) = 999;
TotalAnnualMaxCapacityInvestment(r,'ICE_MELT',y) = 0;

CapitalCostStorage(r,'HYDROGEN',y) = 500;
ResidualStorageCapacity(r,'HYDROGEN',y) = 10;
StorageLevelStart(r,'HYDROGEN') = 5; # thousand tons

CapitalCostStorage(r,'DAM',y) = 999;
ResidualStorageCapacity(r,'DAM',y) = %initialstorage%;
StorageLevelStart(r,'DAM') = 10;
MinStorageChargeYear(r,'DAM',y) = 0.25;

CapitalCostStorage(r,'GLACIERS',y) = 100;
ResidualStorageCapacity(r,'GLACIERS',y) = 999;
StorageLevelStart(r,'GLACIERS') = %initialvolume%;

CapitalCostStorage(r,'BATTERY',y) = 300;
ResidualStorageCapacity(r,'BATTERY',y) = 0.004;
StorageLevelStart(r,'BATTERY') = 0.002;


** ------------------------------------------------
$elseif.ph %phase%=='popol'


InputActivityRatio(r,'HEL_IN','ELC',"1",y) = 1/0.6 * 0.02;
OutputActivityRatio(r,'HEL_OUT','ELC',"2",y) = 1 * 0.02;

InputActivityRatio(r,'BAT_IN','ELC',"1",y) = 1/0.9;
OutputActivityRatio(r,'BAT_OUT','ELC',"2",y) = 1;

InputActivityRatio(r,'INPUT_HYDRO','HYD',"1",y) = 1;
OutputActivityRatio(r,'INPUT_HYDRO','WAT_IN',"1",y) = 1;

InputActivityRatio(r,'WATER_HYDRO','DAMMEL',"1",y) = 1;
OutputActivityRatio(r,'WATER_HYDRO','WAT_DAM',"1",y) = 1;

InputActivityRatio(r,'PUMP_HYDRO','ELC',"1",y) = (1/0.75) * (30.06 / 37);
OutputActivityRatio(r,'STOR_HYDRO','ELC',"2",y) = 30.06 / 37;

OutputActivityRatio(r,'ICE_MELT','ICE_MEL',"2",y) = 1;
OutputActivityRatio(r,'ICE_MELT','HYDMEL',"2",y) = correction_factor(y)*%riverpercentage%;
OutputActivityRatio(r,'ICE_MELT','DAMMEL',"2",y) = correction_factor(y)*%dampercentage%;

TechnologyToStorage(r,"1",'HEL_IN','HYDROGEN') = 1;
TechnologyFromStorage(r,"2",'HEL_OUT','HYDROGEN') = 1;

TechnologyToStorage(r,"1",'BAT_IN','BATTERY') = 1;
TechnologyFromStorage(r,"2",'BAT_OUT','BATTERY') = 1;

TechnologyToStorage(r,"1",'WATER_HYDRO','DAM') = 1;
TechnologyToStorage(r,"1",'INPUT_HYDRO','DAM') = 1;
TechnologyToStorage(r,"1",'PUMP_HYDRO','DAM') = 1;
TechnologyFromStorage(r,"2",'STOR_HYDRO','DAM') = 1;

TechnologyFromStorage(r,"2",'ICE_MELT','GLACIERS') = 1;

$endif.ph