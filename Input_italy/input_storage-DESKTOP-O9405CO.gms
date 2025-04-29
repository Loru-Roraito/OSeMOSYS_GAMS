$set phase %1

** ------------------------------------------------
$ifthen.ph %phase%=='sets'

set     STORAGE / DAM, HYDROGEN, GLACIERS /;

SET TECHNOLOGY /HEL   "Hydrogen Electrolyzers",
                STOR_HYDRO 'Pumped storage',
                ICE_GROW   'Glacier formation',
                ICE_MELT   'Glacier melting'/;

set storage_plants(TECHNOLOGY) / HEL, STOR_HYDRO, ICE_GROW, ICE_MELT /;



** ------------------------------------------------
$elseif.ph %phase%=='data' 

# Characterize ELECTROLIZERS
AvailabilityFactor(r,'HEL',y) = 0.9;
OperationalLife(r,'HEL') = 10;
CapitalCost(r,'HEL',y) = 1;
VariableCost(r,'HEL',m,y) = 0;
FixedCost(r,'HEL',y) = 0;

# characterize dam hydro storage
CapacityFactor(r,'STOR_HYDRO',"ID",y) = 0.7;
CapacityFactor(r,'STOR_HYDRO',"IN",y) = 0.7;
CapacityFactor(r,'STOR_HYDRO',"SD",y) = 0.3;
CapacityFactor(r,'STOR_HYDRO',"SN",y) = 0.3;
CapacityFactor(r,'STOR_HYDRO',"WD",y) = 0.5;
CapacityFactor(r,'STOR_HYDRO',"WN",y) = 0.5;
CapitalCost(r,'STOR_HYDRO',y) = 1000;
VariableCost(r,'STOR_HYDRO',m,y) = 0;
FixedCost(r,'STOR_HYDRO',y) = 0;
OperationalLife(r,'STOR_HYDRO') = 60;
ResidualCapacity(r,'STOR_HYDRO',y) = 7.25;
TotalAnnualMaxCapacityInvestment(r,'STOR_HYDRO',y) = 0;

CapacityFactor(r,'ICE_MELT',"ID",y) = 1;
CapacityFactor(r,'ICE_MELT',"IN",y) = 1;
CapacityFactor(r,'ICE_MELT',"SD",y) = 1;
CapacityFactor(r,'ICE_MELT',"SN",y) = 1;
CapacityFactor(r,'ICE_MELT',"WD",y) = 1;
CapacityFactor(r,'ICE_MELT',"WN",y) = 1;
CapitalCost(r,'ICE_MELT',y) = 0;
VariableCost(r,'ICE_MELT',m,y) = 0;
FixedCost(r,'ICE_MELT',y) = 0;
OperationalLife(r,'ICE_MELT') = 999;
<<<<<<< HEAD
ResidualCapacity(r,'ICE_MELT',y) = 999;
TotalAnnualMaxCapacityInvestment(r,'ICE_MELT',y) = 0;

=======
ResidualCapacity(r,'ICE_MELT',y) = %melting_rate%;
TotalAnnualMaxCapacityInvestment(r,'ICE_MELT',y) = 0;

CapacityFactor(r,'ICE_GROW',"ID",y) = 1;
CapacityFactor(r,'ICE_GROW',"IN",y) = 1;
CapacityFactor(r,'ICE_GROW',"SD",y) = 1;
CapacityFactor(r,'ICE_GROW',"SN",y) = 1;
CapacityFactor(r,'ICE_GROW',"WD",y) = 1;
CapacityFactor(r,'ICE_GROW',"WN",y) = 1;
CapitalCost(r,'ICE_GROW',y) = 0;
VariableCost(r,'ICE_GROW',m,y) = 0;
FixedCost(r,'ICE_GROW',y) = 0;
OperationalLife(r,'ICE_GROW') = 999;

>>>>>>> 9faa55309bd6f86eb8253b4a8e01069539d7de62
CapitalCostStorage(r,'HYDROGEN',y) = 100;
ResidualStorageCapacity(r,'HYDROGEN',y) = 0;
StorageLevelStart(r,'HYDROGEN') = 0;

CapitalCostStorage(r,'DAM',y) = 100;
ResidualStorageCapacity(r,'DAM',y) = 999;
StorageLevelStart(r,'DAM') = 999;

CapitalCostStorage(r,'GLACIERS',y) = 100;
ResidualStorageCapacity(r,'GLACIERS',y) = 999;
StorageLevelStart(r,'GLACIERS') = 500;


** ------------------------------------------------
$elseif.ph %phase%=='popol'


InputActivityRatio(r,'HEL','ELC',"1",y) = 2; #IEA convention
OutputActivityRatio(r,'HEL','ELC',"2",y) = 0.6; #IEA convention

InputActivityRatio(r,'STOR_HYDRO','ELC',"1",y) = 1; #IEA convention
OutputActivityRatio(r,'STOR_HYDRO','ELC',"2",y) = 1; #IEA convention

<<<<<<< HEAD
InputActivityRatio(r,'ICE_MELT','ICE',"1",y) = 1; #IEA convention
OutputActivityRatio(r,'ICE_MELT','ICE_MEL',"2",y) = 1; #IEA convention
OutputActivityRatio(r,'ICE_MELT','HYD',"2",y) = 0.9; #IEA convention
=======
InputActivityRatio(r,'ICE_GROW','ICE',"1",y) = 1; #IEA convention
OutputActivityRatio(r,'ICE_GROW','ICE_PROD',"1",y) = 1; #IEA convention

OutputActivityRatio(r,'ICE_MELT','ICE_MEL',"2",y) = 1; #IEA convention
OutputActivityRatio(r,'ICE_MELT','HYDMEL',"2",y) = 0.9; #IEA convention
>>>>>>> 9faa55309bd6f86eb8253b4a8e01069539d7de62

TechnologyToStorage(r,"1",'HEL','HYDROGEN') = 1;
TechnologyFromStorage(r,"2",'HEL','HYDROGEN') = 1;

TechnologyToStorage(r,"1",'STOR_HYDRO','DAM') = 1;
TechnologyFromStorage(r,"2",'STOR_HYDRO','DAM') = 1;

<<<<<<< HEAD
TechnologyToStorage(r,"1",'ICE_MELT','GLACIERS') = 1;
=======
TechnologyToStorage(r,"1",'ICE_GROW','GLACIERS') = 1;
>>>>>>> 9faa55309bd6f86eb8253b4a8e01069539d7de62
TechnologyFromStorage(r,"2",'ICE_MELT','GLACIERS') = 1;


$endif.ph