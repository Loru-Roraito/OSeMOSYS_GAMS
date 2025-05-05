$set phase %1

** ----------------------------------------------------------------
$ifthen.ph %phase%=='sets'

set     TECHNOLOGY      /
        IMPDSL1 'Diesel imports'
        IMPGSL1 'Gasoline imports'
        IMPHCO1 'Coal imports'
        IMPOIL1 'Crude oil imports'
        IMPGAS1 'Natural gas imports'
        IMPBIO1 'Biomass supply'
        VIR_SUN 'Virtual sun technology'
        VIR_WIN 'Virtual wind technology'
        VIR_GTH 'Virtual geothermal source'
        VIR_HYD 'Virtual hydro technology (ror)'
        VIR_ICE 'Virtual ice technology'
        PRODWST 'Waste production'
/;

set     FUEL    /
        HCO 'Coal'
        GAS 'Natural gas'
        OIL 'Crude oil'
        WBM 'Woody biomass'
        WST 'Waste'
        GTH 'Geothermal energy'
        SUN 'Solar energy'
        WIN 'Wind energy'
        HYD 'Hydro energy'
        HYDMEL 'Hydro energy (melt)'
        DAMMEL 'Melted ice that goes into dams'
        ICW 'Ice water'
        ICE 'Ice forming/melting'
        ICE_MEL
        ICE_PROD
        WAT_DAM
/;

set renewable_fuel(FUEL) / WBM, GTH, SUN, WIN, HYD, HYDMEL, ICW /;

** ----------------------------------------------------------------
$elseif.ph %phase%=='data'

*** characterize technologiess
CapitalCost(r,'IMPDSL1',y) = 0;
VariableCost(r,'IMPDSL1',m,YEAR)$(yRange0(YEAR)) = 38.9; #eur/MWh
VariableCost(r,'IMPDSL1',m,YEAR)$(yRange1(YEAR)) = 24.32+2.91*ord(YEAR);
VariableCost(r,'IMPDSL1',m,YEAR)$(yRange2(YEAR)) = 55.12+0.85*ord(YEAR);
VariableCost(r,'IMPDSL1',m,YEAR)$(yRange3(YEAR)) = -9.63+3.44*ord(YEAR);
VariableCost(r,'IMPDSL1',m,YEAR)$(yRange4(YEAR)) = 110.9;
FixedCost(r,'IMPDSL1',y) = 0;
OperationalLife(r,'IMPDSL1') = 999;
AvailabilityFactor(r,'IMPDSL1',y) = 1;
EmissionActivityRatio(r,'IMPDSL1','CO2','1',y) = 0.075;
ResidualCapacity(r,"IMPDSL1",y) = 999;

CapitalCost(r,'IMPGSL1',y) = 0;
VariableCost(r,'IMPGSL1',m,YEAR)$(yRange0(YEAR)) = 38.9;
VariableCost(r,'IMPGSL1',m,YEAR)$(yRange1(YEAR)) = 24.32+2.91*ord(YEAR);
VariableCost(r,'IMPGSL1',m,YEAR)$(yRange2(YEAR)) = 55.12+0.85*ord(YEAR);
VariableCost(r,'IMPGSL1',m,YEAR)$(yRange3(YEAR)) = -9.63+3.44*ord(YEAR);
VariableCost(r,'IMPGSL1',m,YEAR)$(yRange4(YEAR)) = 110.9;
FixedCost(r,'IMPGSL1',y) = 0;
OperationalLife(r,'IMPGSL1') = 999;
AvailabilityFactor(r,'IMPGSL1',y) = 1;
EmissionActivityRatio(r,'IMPGSL1','CO2','1',y) = 0.075;
ResidualCapacity(r,"IMPGSL1",y) = 999;

CapitalCost(r,'IMPHCO1',y) = 0;
VariableCost(r,'IMPHCO1',m,YEAR)$(yRange0(YEAR)) = 9.8;
VariableCost(r,'IMPHCO1',m,YEAR)$(yRange1(YEAR)) = 8.21+0.32*ord(YEAR);
VariableCost(r,'IMPHCO1',m,YEAR)$(yRange2(YEAR)) = 12+0.06*ord(YEAR);
VariableCost(r,'IMPHCO1',m,YEAR)$(yRange3(YEAR)) = 5.69+0.32*ord(YEAR);
VariableCost(r,'IMPHCO1',m,YEAR)$(yRange4(YEAR)) = 16.7;
FixedCost(r,'IMPHCO1',y) = 0;
OperationalLife(r,'IMPHCO1') = 999;
AvailabilityFactor(r,'IMPHCO1',y) = 1;
EmissionActivityRatio(r,'IMPHCO1','CO2','1',y) = 0.089;
ResidualCapacity(r,"IMPHCO1",y) = 999;

CapitalCost(r,'IMPOIL1',y) = 0;
VariableCost(r,'IMPOIL1',m,YEAR)$(yRange0(YEAR)) = 38.9;
VariableCost(r,'IMPOIL1',m,YEAR)$(yRange1(YEAR)) = 24.32+2.91*ord(YEAR);
VariableCost(r,'IMPOIL1',m,YEAR)$(yRange2(YEAR)) = 55.12+0.85*ord(YEAR);
VariableCost(r,'IMPOIL1',m,YEAR)$(yRange3(YEAR)) = -9.63+3.44*ord(YEAR);
VariableCost(r,'IMPOIL1',m,YEAR)$(yRange4(YEAR)) = 110.9;
FixedCost(r,'IMPOIL1',y) = 0;
OperationalLife(r,'IMPOIL1') = 999;
AvailabilityFactor(r,'IMPOIL1',y) = 1;
EmissionActivityRatio(r,'IMPOIL1','CO2','1',y) = 0.075;
ResidualCapacity(r,"IMPOIL1",y) = 999;

CapitalCost(r,'IMPGAS1',y) = 0;
VariableCost(r,'IMPGAS1',m,YEAR)$(yRange0(YEAR)) = 22.7;
VariableCost(r,'IMPGAS1',m,YEAR)$(yRange1(YEAR)) = 19.58+0.63*ord(YEAR);
VariableCost(r,'IMPGAS1',m,YEAR)$(yRange2(YEAR)) = 25.27+0.25*ord(YEAR);
VariableCost(r,'IMPGAS1',m,YEAR)$(yRange3(YEAR)) = 8.69+0.92*ord(YEAR);
VariableCost(r,'IMPGAS1',m,YEAR)$(yRange4(YEAR)) = 40.7;
FixedCost(r,'IMPGAS1',y) = 0;
OperationalLife(r,'IMPGAS1') = 999;
AvailabilityFactor(r,'IMPGAS1',y) = 1;
EmissionActivityRatio(r,'IMPGAS1','CO2','1',y) = 0.055;
ResidualCapacity(r,"IMPGAS1",y) = 999;

CapitalCost(r,'IMPBIO1',y) = 0;
VariableCost(r,'IMPBIO1',m,YEAR)$(yRange0(YEAR)) = 18.32;
VariableCost(r,'IMPBIO1',m,YEAR)$(yRange1(YEAR)) = 18.32;
VariableCost(r,'IMPBIO1',m,YEAR)$(yRange2(YEAR)) = 18.32;
VariableCost(r,'IMPBIO1',m,YEAR)$(yRange3(YEAR)) = 18.32;
VariableCost(r,'IMPBIO1',m,YEAR)$(yRange4(YEAR)) = 18.32;
FixedCost(r,'IMPBIO1',y) = 0;
OperationalLife(r,'IMPBIO1') = 999;
AvailabilityFactor(r,'IMPBIO1',y) = 1;
ResidualCapacity(r,"IMPBIO1",y) = 999;


CapitalCost(r,'PRODWST',y) = 0;
VariableCost(r,'PRODWST',m,y) = 0; 
FixedCost(r,'PRODWST',y) = 0;
OperationalLife(r,'PRODWST') = 999;
AvailabilityFactor(r,'PRODWST',y) = 1;
ResidualCapacity(r,"PRODWST",y) = 999;

CapitalCost(r,'VIR_SUN',y) = 0;
VariableCost(r,'VIR_SUN',m,y) = 0; 
FixedCost(r,'VIR_SUN',y) = 0;
OperationalLife(r,'VIR_SUN') = 999;
AvailabilityFactor(r,'VIR_SUN',y) = 1;
ResidualCapacity(r,"VIR_SUN",y) = 999;

CapitalCost(r,'VIR_GTH',y) = 0;
VariableCost(r,'VIR_GTH',m,y) = 0; 
FixedCost(r,'VIR_GTH',y) = 0;
OperationalLife(r,'VIR_GTH') = 999;
AvailabilityFactor(r,'VIR_GTH',y) = 1;
ResidualCapacity(r,"VIR_GTH",y) = 999;

CapitalCost(r,'VIR_WIN',y) = 0;
VariableCost(r,'VIR_WIN',m,y) = 0; 
FixedCost(r,'VIR_WIN',y) = 0;
OperationalLife(r,'VIR_WIN') = 999;
AvailabilityFactor(r,'VIR_WIN',y) = 1;
ResidualCapacity(r,"VIR_WIN",y) = 999;

CapitalCost(r,'VIR_HYD',y) = 0;
VariableCost(r,'VIR_HYD',m,y) = 0; 
FixedCost(r,'VIR_HYD',y) = 0;
OperationalLife(r,'VIR_HYD') = 999;
AvailabilityFactor(r,'VIR_HYD',y) = 1;
ResidualCapacity(r,"VIR_HYD",y) = 999;

CapitalCost(r,'VIR_ICE',y) = 0;
VariableCost(r,'VIR_ICE',m,y) = 0; 
FixedCost(r,'VIR_ICE',y) = 0;
OperationalLife(r,'VIR_ICE') = 999;
AvailabilityFactor(r,'VIR_ICE',y) = 1;
ResidualCapacity(r,"VIR_ICE",y) = 999;

** ----------------------------------------------------------------
$elseif.ph %phase%=="popol"

OutputActivityRatio(r,'VIR_SUN','SUN',"1",y) = 1;
OutputActivityRatio(r,'VIR_WIN','WIN',"1",y) = 1;
OutputActivityRatio(r,'VIR_GTH','GTH',"1",y) = 1;
OutputActivityRatio(r,'VIR_HYD','HYD',"1",y) = 1;
OutputActivityRatio(r,'VIR_ICE','ICE',"1",y) = 1;

OutputActivityRatio(r,'PRODWST','WST',"1",y) = 1;
OutputActivityRatio(r,'IMPBIO1','WBM',"1",y) = 1;
OutputActivityRatio(r,'IMPHCO1','HCO',"1",y) = 1;
OutputActivityRatio(r,'IMPGAS1','GAS',"1",y) = 1;
OutputActivityRatio(r,'IMPDSL1','DSL',"1",y) = 1;
OutputActivityRatio(r,'IMPGSL1','GSL',"1",y) = 1;


$endif.ph