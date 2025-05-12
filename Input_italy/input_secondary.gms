$set phase %1

** ----------------------------------------------------------------
$ifthen.ph %phase%=='sets'

set     TECHNOLOGY      /
        COAL 'Coal power plants'
        GPP 'Gas power plants'
        ROR 'run-of-river hydroelectric power plants'
        ROR_MEL 'Run-of-river hydroelectric power plants from melting'
        OIL_GEN 'Oil power plants'
        BIO 'Biomass power plants'
        GEO 'Geothermal power plants'
        WTE 'Waste-to-energy power plants'
        SPV 'Solar power plants'
        WPP 'Wind power plants' /; 

set    FUEL            /
        ELC 'Electricity' /; 

set power_plants(TECHNOLOGY)   / COAL, ROR, ROR_MEL, OIL_GEN, BIO, GEO, WTE, SPV, WPP, GPP /;
set fuel_transformation(TECHNOLOGY) / /;
set renewable_tech(TECHNOLOGY) / SPV, WPP, WTE, BIO, GEO, ROR, ROR_MEL /;

set secondary_carrier(FUEL) / ELC/;

** ----------------------------------------------------------------
$elseif.ph %phase%=='data'

# Characterize SOLAR technology
OperationalLife(r,'SPV') = 25;
CapacityFactor(r,'SPV','ID',y) = 0.175;
CapacityFactor(r,'SPV','IN',y) = 1e-5;
CapacityFactor(r,'SPV','SD',y) = 0.35;
CapacityFactor(r,'SPV','SN',y) = 1e-5;
CapacityFactor(r,'SPV','WD',y) = 0.1;
CapacityFactor(r,'SPV','WN',y) = 1e-5;
CapitalCost(r,'SPV',YEAR)$(yRange0(YEAR)) = 560;
CapitalCost(r,'SPV',YEAR)$(yRange1(YEAR)) = 650-18*ord(YEAR);
CapitalCost(r,'SPV',YEAR)$(yRange2(YEAR)) = 470-6*ord(YEAR);
CapitalCost(r,'SPV',YEAR)$(yRange3(YEAR)) = 395-3*ord(YEAR);
CapitalCost(r,'SPV',YEAR)$(yRange4(YEAR)) = 290;
VariableCost(r,'SPV',m,YEAR)$(yRange0(YEAR)) = 1e-5;
VariableCost(r,'SPV',m,YEAR)$(yRange1(YEAR)) = 1e-5;
VariableCost(r,'SPV',m,YEAR)$(yRange2(YEAR)) = 1e-5;
VariableCost(r,'SPV',m,YEAR)$(yRange3(YEAR)) = 1e-5;
VariableCost(r,'SPV',m,YEAR)$(yRange4(YEAR)) = 1e-5;
FixedCost(r,'SPV',YEAR)$(yRange0(YEAR)) = 11.3;
FixedCost(r,'SPV',YEAR)$(yRange1(YEAR)) = 12.2-0.18*ord(YEAR);
FixedCost(r,'SPV',YEAR)$(yRange2(YEAR)) = 11.6-0.14*ord(YEAR);
FixedCost(r,'SPV',YEAR)$(yRange3(YEAR)) = 9.85-0.07*ord(YEAR);
FixedCost(r,'SPV',YEAR)$(yRange4(YEAR)) = 7.4;
ResidualCapacity(r,"SPV",y) = 18.9;
TotalAnnualMaxCapacityInvestment(r,'SPV',YEAR)$(yCurrent(YEAR)) = 1.5;
TotalAnnualMaxCapacityInvestment(r,'SPV',YEAR)$(not yCurrent(YEAR)) = 9.45;  

# Characterize WIND technology (onshore)
OperationalLife(r,'WPP') = 25;
CapacityFactor(r,'WPP','ID',y) = 0.2;
CapacityFactor(r,'WPP','IN',y) = 0.25;
CapacityFactor(r,'WPP','SD',y) = 0.1;
CapacityFactor(r,'WPP','SN',y) = 0.15;
CapacityFactor(r,'WPP','WD',y) = 0.25;
CapacityFactor(r,'WPP','WN',y) = 0.3;
CapitalCost(r,'WPP',YEAR)$(yRange0(YEAR)) = 1120;
CapitalCost(r,'WPP',YEAR)$(yRange1(YEAR)) = 1160-8*ord(YEAR);
CapitalCost(r,'WPP',YEAR)$(yRange2(YEAR)) = 1130-6*ord(YEAR);
CapitalCost(r,'WPP',YEAR)$(yRange3(YEAR)) = 1030-2*ord(YEAR);
CapitalCost(r,'WPP',YEAR)$(yRange4(YEAR)) = 960;
VariableCost(r,'WPP',m,YEAR)$(yRange0(YEAR)) = 1.5;
VariableCost(r,'WPP',m,YEAR)$(yRange1(YEAR)) = 1.575-0.015*ord(YEAR);
VariableCost(r,'WPP',m,YEAR)$(yRange2(YEAR)) = 1.515-0.011*ord(YEAR);
VariableCost(r,'WPP',m,YEAR)$(yRange3(YEAR)) = 1.29-0.002*ord(YEAR);
VariableCost(r,'WPP',m,YEAR)$(yRange4(YEAR)) = 1.22;
FixedCost(r,'WPP',YEAR)$(yRange0(YEAR)) = 14;
FixedCost(r,'WPP',YEAR)$(yRange1(YEAR)) = 14.7-0.14*ord(YEAR);
FixedCost(r,'WPP',YEAR)$(yRange2(YEAR)) = 14.11-0.1*ord(YEAR);
FixedCost(r,'WPP',YEAR)$(yRange3(YEAR)) = 12.22-0.03*ord(YEAR);
FixedCost(r,'WPP',YEAR)$(yRange4(YEAR)) = 11.34;
ResidualCapacity(r,"WPP",y) = 9;
TotalAnnualMaxCapacityInvestment(r,'WPP',YEAR)$(yCurrent(YEAR)) = 0.6;
TotalAnnualMaxCapacityInvestment(r,'WPP',YEAR)$(not yCurrent(YEAR)) = 4.5;

# Characterize WASTE-TO-ENERGY technology
OperationalLife(r,'WTE') = 25;
AvailabilityFactor(r,'BIO',y) = 0.62;
CapitalCost(r,'WTE',YEAR)$(yRange0(YEAR)) = 2135;
CapitalCost(r,'WTE',YEAR)$(yRange1(YEAR)) = 2157-4*ord(YEAR);
CapitalCost(r,'WTE',YEAR)$(yRange2(YEAR)) = 2226-9*ord(YEAR);
CapitalCost(r,'WTE',YEAR)$(yRange3(YEAR)) = 2204-8*ord(YEAR);
CapitalCost(r,'WTE',YEAR)$(yRange4(YEAR)) = 1917;
VariableCost(r,'WTE',m,YEAR)$(yRange0(YEAR)) = 2.56;
VariableCost(r,'WTE',m,YEAR)$(yRange1(YEAR)) = 2.56;
VariableCost(r,'WTE',m,YEAR)$(yRange2(YEAR)) = 2.56;
VariableCost(r,'WTE',m,YEAR)$(yRange3(YEAR)) = 2.56;
VariableCost(r,'WTE',m,YEAR)$(yRange4(YEAR)) = 2.56;
FixedCost(r,'WTE',YEAR)$(yRange0(YEAR)) = 28.81;
FixedCost(r,'WTE',YEAR)$(yRange1(YEAR)) = 31.06-0.45*ord(YEAR);
FixedCost(r,'WTE',YEAR)$(yRange2(YEAR)) = 25.06-0.05*ord(YEAR);
FixedCost(r,'WTE',YEAR)$(yRange3(YEAR)) = 25.06-0.05*ord(YEAR);
FixedCost(r,'WTE',YEAR)$(yRange4(YEAR)) = 23.31;
ResidualCapacity(r,"WTE",y) = 0.8;
TotalAnnualMaxCapacityInvestment(r,'WTE',y) = 0.008;
ResidualCapacity(r,"WTE",YEAR)$(not yNoCO2(YEAR)) = 0.8;
ResidualCapacity(r,"WTE",YEAR)$(yNoCO2(YEAR)) = 0;
TotalAnnualMaxCapacityInvestment(r,'WTE',YEAR)$(not yNoCO2(YEAR)) = 0;
TotalAnnualMaxCapacityInvestment(r,'WTE',YEAR)$(yNoCO2(YEAR)) = 0;

# Characterize BIOMASS technology
OperationalLife(r,'BIO') = 25;
AvailabilityFactor(r,'BIO',y) = 0.62;
CapitalCost(r,'BIO',YEAR)$(yRange0(YEAR)) = 2135;
CapitalCost(r,'BIO',YEAR)$(yRange1(YEAR)) = 2157-5*ord(YEAR);
CapitalCost(r,'BIO',YEAR)$(yRange2(YEAR)) = 2226-9*ord(YEAR);
CapitalCost(r,'BIO',YEAR)$(yRange3(YEAR)) = 2204-8*ord(YEAR);
CapitalCost(r,'BIO',YEAR)$(yRange4(YEAR)) = 1917;
VariableCost(r,'BIO',m,YEAR)$(yRange0(YEAR)) = 100;
VariableCost(r,'BIO',m,YEAR)$(yRange1(YEAR)) = 100;
VariableCost(r,'BIO',m,YEAR)$(yRange2(YEAR)) = 100;
VariableCost(r,'BIO',m,YEAR)$(yRange3(YEAR)) = 100;
VariableCost(r,'BIO',m,YEAR)$(yRange4(YEAR)) = 100;
FixedCost(r,'BIO',YEAR)$(yRange0(YEAR)) = 28.81;
FixedCost(r,'BIO',YEAR)$(yRange1(YEAR)) = 31.06-0.45*ord(YEAR);
FixedCost(r,'BIO',YEAR)$(yRange2(YEAR)) = 25.06-0.05*ord(YEAR);
FixedCost(r,'BIO',YEAR)$(yRange3(YEAR)) = 25.06-0.05*ord(YEAR);
FixedCost(r,'BIO',YEAR)$(yRange4(YEAR)) = 23.31;
ResidualCapacity(r,"BIO",y) = 3.2;
TotalAnnualMaxCapacityInvestment(r,'BIO',YEAR)$(yCurrent(YEAR)) = 0;

# Characterize GEOTHERMAL technology
OperationalLife(r,'GEO') = 30;
AvailabilityFactor(r,'GEO',y) = 0.85;
CapitalCost(r,'GEO',YEAR)$(yRange0(YEAR)) = 4970;
CapitalCost(r,'GEO',YEAR)$(yRange1(YEAR)) = 4970;
CapitalCost(r,'GEO',YEAR)$(yRange2(YEAR)) = 4970;
CapitalCost(r,'GEO',YEAR)$(yRange3(YEAR)) = 4970;
CapitalCost(r,'GEO',YEAR)$(yRange4(YEAR)) = 4970;
VariableCost(r,'GEO',m,YEAR)$(yRange0(YEAR)) = 0.32;
VariableCost(r,'GEO',m,YEAR)$(yRange1(YEAR)) = 0.32;
VariableCost(r,'GEO',m,YEAR)$(yRange2(YEAR)) = 0.32;
VariableCost(r,'GEO',m,YEAR)$(yRange3(YEAR)) = 0.32;
VariableCost(r,'GEO',m,YEAR)$(yRange4(YEAR)) = 0.32;
FixedCost(r,'GEO',YEAR)$(yRange0(YEAR)) = 95;
FixedCost(r,'GEO',YEAR)$(yRange1(YEAR)) = 95;
FixedCost(r,'GEO',YEAR)$(yRange2(YEAR)) = 95;
FixedCost(r,'GEO',YEAR)$(yRange3(YEAR)) = 92;
FixedCost(r,'GEO',YEAR)$(yRange4(YEAR)) = 92;
ResidualCapacity(r,"GEO",y) = 0.82;
TotalAnnualMaxCapacityInvestment(r,'GEO',y) = 0.082;
TotalAnnualMaxCapacityInvestment(r,'GEO',YEAR)$(yCurrent(YEAR)) = 0;

# Characterize RUN-OF-RIVER technology
OperationalLife(r,'ROR') = 55;
AvailabilityFactor(r,'ROR',y) = 0.35;
CapitalCost(r,'ROR',YEAR)$(yRange0(YEAR)) = 2440;
CapitalCost(r,'ROR',YEAR)$(yRange1(YEAR)) = 2440;
CapitalCost(r,'ROR',YEAR)$(yRange2(YEAR)) = 2440;
CapitalCost(r,'ROR',YEAR)$(yRange3(YEAR)) = 2440;
CapitalCost(r,'ROR',YEAR)$(yRange4(YEAR)) = 2440;
VariableCost(r,'ROR',m,YEAR)$(yRange0(YEAR)) = 1e-5;
VariableCost(r,'ROR',m,YEAR)$(yRange1(YEAR)) = 1e-5;
VariableCost(r,'ROR',m,YEAR)$(yRange2(YEAR)) = 1e-5;
VariableCost(r,'ROR',m,YEAR)$(yRange3(YEAR)) = 1e-5;
VariableCost(r,'ROR',m,YEAR)$(yRange4(YEAR)) = 1e-5;
FixedCost(r,'ROR',YEAR)$(yRange0(YEAR)) = 210.48;
FixedCost(r,'ROR',YEAR)$(yRange1(YEAR)) = 210.48;
FixedCost(r,'ROR',YEAR)$(yRange2(YEAR)) = 244.2-2.25*ord(YEAR);
FixedCost(r,'ROR',YEAR)$(yRange3(YEAR)) = 198-0.4*ord(YEAR);
FixedCost(r,'ROR',YEAR)$(yRange4(YEAR)) = 184;
ResidualCapacity(r,"ROR",y) = 4.65;
TotalAnnualMaxCapacityInvestment(r,'ROR',y) = 0.0465;
TotalAnnualMaxCapacityInvestment(r,'ROR',YEAR)$(yCurrent(YEAR)) = 0;

OperationalLife(r,'ROR_MEL') = 55;
CapacityFactor(r,'ROR_MEL',"ID",y) = .18*6*0.4/2;
CapacityFactor(r,'ROR_MEL',"IN",y) = .12*6*0.4;
CapacityFactor(r,'ROR_MEL',"SD",y) = .30*6*0.4;
CapacityFactor(r,'ROR_MEL',"SN",y) = .20*6*0.4*2;
CapacityFactor(r,'ROR_MEL',"WD",y) = .10*6*0.4;
CapacityFactor(r,'ROR_MEL',"WN",y) = .10*6*0.4*2;
CapitalCost(r,'ROR_MEL',YEAR)$(yRange0(YEAR)) = 2440;
CapitalCost(r,'ROR_MEL',YEAR)$(yRange1(YEAR)) = 2440;
CapitalCost(r,'ROR_MEL',YEAR)$(yRange2(YEAR)) = 2440;
CapitalCost(r,'ROR_MEL',YEAR)$(yRange3(YEAR)) = 2440;
CapitalCost(r,'ROR_MEL',YEAR)$(yRange4(YEAR)) = 2440;
VariableCost(r,'ROR_MEL',m,YEAR)$(yRange0(YEAR)) = 1e-5;
VariableCost(r,'ROR_MEL',m,YEAR)$(yRange1(YEAR)) = 1e-5;
VariableCost(r,'ROR_MEL',m,YEAR)$(yRange2(YEAR)) = 1e-5;
VariableCost(r,'ROR_MEL',m,YEAR)$(yRange3(YEAR)) = 1e-5;
VariableCost(r,'ROR_MEL',m,YEAR)$(yRange4(YEAR)) = 1e-5;
FixedCost(r,'ROR_MEL',YEAR)$(yRange0(YEAR)) = 210.48;
FixedCost(r,'ROR_MEL',YEAR)$(yRange1(YEAR)) = 210.48;
FixedCost(r,'ROR_MEL',YEAR)$(yRange2(YEAR)) = 244.2-2.25*ord(YEAR);
FixedCost(r,'ROR_MEL',YEAR)$(yRange3(YEAR)) = 198-0.4*ord(YEAR);
FixedCost(r,'ROR_MEL',YEAR)$(yRange4(YEAR)) = 184;
ResidualCapacity(r,"ROR_MEL",y) = correction_factor(y)*melting_rate(y)*%riverpercentage%/(0.4*24*0.365);
TotalAnnualMaxCapacityInvestment(r,'ROR_MEL',y) = 0;

# Characterize COAL technology
OperationalLife(r,'COAL') = 30;
AvailabilityFactor(r,'COAL',y) = 0.8;
CapitalCost(r,'COAL',YEAR)$(yRange0(YEAR)) = 1817;
CapitalCost(r,'COAL',YEAR)$(yRange1(YEAR)) = 1817;
CapitalCost(r,'COAL',YEAR)$(yRange2(YEAR)) = 1817;
CapitalCost(r,'COAL',YEAR)$(yRange3(YEAR)) = 1817;
CapitalCost(r,'COAL',YEAR)$(yRange4(YEAR)) = 1817;
VariableCost(r,'COAL',m,YEAR)$(yRange0(YEAR)) = 5.16;
VariableCost(r,'COAL',m,YEAR)$(yRange1(YEAR)) = 5.26-0.02*ord(YEAR);
VariableCost(r,'COAL',m,YEAR)$(yRange2(YEAR)) = 5.23-0.018*ord(YEAR);
VariableCost(r,'COAL',m,YEAR)$(yRange3(YEAR)) = 5.23-0.018*ord(YEAR);
VariableCost(r,'COAL',m,YEAR)$(yRange4(YEAR)) = 4.6;
FixedCost(r,'COAL',YEAR)$(yRange0(YEAR)) = 46.81;
FixedCost(r,'COAL',YEAR)$(yRange1(YEAR)) = 47.76-0.19*ord(YEAR);
FixedCost(r,'COAL',YEAR)$(yRange2(YEAR)) = 46.41-0.1*ord(YEAR);
FixedCost(r,'COAL',YEAR)$(yRange3(YEAR)) = 48.92-0.2*ord(YEAR);
FixedCost(r,'COAL',YEAR)$(yRange4(YEAR)) = 41.91;
ResidualCapacity(r,"COAL",YEAR)$(not yNoCoal(YEAR)) = 6.4-0.3*ord(YEAR);
ResidualCapacity(r,"COAL",YEAR)$(yNoCoal(YEAR)) = 0;
TotalAnnualMaxCapacityInvestment(r,'COAL',y)= 0;

# Characterize GPP technology
OperationalLife(r,'GPP') = 30;
AvailabilityFactor(r,'GPP',y) = 0.315;
CapitalCost(r,'GPP',YEAR)$(yRange0(YEAR)) = 720;
CapitalCost(r,'GPP',YEAR)$(yRange1(YEAR)) = 735-3*ord(YEAR);
CapitalCost(r,'GPP',YEAR)$(yRange2(YEAR)) = 735-3*ord(YEAR);
CapitalCost(r,'GPP',YEAR)$(yRange3(YEAR)) = 710-2*ord(YEAR);
CapitalCost(r,'GPP',YEAR)$(yRange4(YEAR)) = 640;
VariableCost(r,'GPP',m,YEAR)$(yRange0(YEAR)) = 2.31;
VariableCost(r,'GPP',m,YEAR)$(yRange1(YEAR)) = 2.31;
VariableCost(r,'GPP',m,YEAR)$(yRange2(YEAR)) = 2.31;
VariableCost(r,'GPP',m,YEAR)$(yRange3(YEAR)) = 2.31;
VariableCost(r,'GPP',m,YEAR)$(yRange4(YEAR)) = 2.31;
FixedCost(r,'GPP',YEAR)$(yRange0(YEAR)) = 15;
FixedCost(r,'GPP',YEAR)$(yRange1(YEAR)) = 15;
FixedCost(r,'GPP',YEAR)$(yRange2(YEAR)) = 15;
FixedCost(r,'GPP',YEAR)$(yRange3(YEAR)) = 15;
FixedCost(r,'GPP',YEAR)$(yRange4(YEAR)) = 15;
ResidualCapacity(r,"GPP",YEAR)$(not yNoCO2(YEAR)) = 40;
ResidualCapacity(r,"GPP",YEAR)$(yNoCO2(YEAR)) = 0;
TotalAnnualMaxCapacityInvestment(r,'GPP',YEAR)$(not yNoCO2(YEAR)) = 0;
TotalAnnualMaxCapacityInvestment(r,'GPP',YEAR)$(yNoCO2(YEAR)) = 0;

# Characterize OIL technology
OperationalLife(r,'OIL_GEN') = 40;
AvailabilityFactor(r,'OIL_GEN',y) = 0.85;
CapitalCost(r,'OIL_GEN',YEAR)$(yRange0(YEAR)) = 1200;
CapitalCost(r,'OIL_GEN',YEAR)$(yRange1(YEAR)) = 1200;
CapitalCost(r,'OIL_GEN',YEAR)$(yRange2(YEAR)) = 1200;
CapitalCost(r,'OIL_GEN',YEAR)$(yRange3(YEAR)) = 1200;
CapitalCost(r,'OIL_GEN',YEAR)$(yRange4(YEAR)) = 1200;
VariableCost(r,'OIL_GEN',m,YEAR)$(yRange0(YEAR)) = 2.76;
VariableCost(r,'OIL_GEN',m,YEAR)$(yRange1(YEAR)) = 2.76;
VariableCost(r,'OIL_GEN',m,YEAR)$(yRange2(YEAR)) = 2.76;
VariableCost(r,'OIL_GEN',m,YEAR)$(yRange3(YEAR)) = 2.76;
VariableCost(r,'OIL_GEN',m,YEAR)$(yRange4(YEAR)) = 2.76;
FixedCost(r,'OIL_GEN',YEAR)$(yRange0(YEAR)) = 20.71;
FixedCost(r,'OIL_GEN',YEAR)$(yRange1(YEAR)) = 20.71;
FixedCost(r,'OIL_GEN',YEAR)$(yRange2(YEAR)) = 20.71;
FixedCost(r,'OIL_GEN',YEAR)$(yRange3(YEAR)) = 20.71;
FixedCost(r,'OIL_GEN',YEAR)$(yRange4(YEAR)) = 20.71;
ResidualCapacity(r,"OIL_GEN",YEAR)$(not yNoCO2(YEAR)) = 1.8;
ResidualCapacity(r,"OIL_GEN",YEAR)$(not yCurrent(YEAR)) = 1.45;
ResidualCapacity(r,"OIL_GEN",YEAR)$(yNoCO2(YEAR)) = 0;
TotalAnnualMaxCapacityInvestment(r,'OIL_GEN',YEAR)$(not yNoCO2(YEAR)) = 0;
TotalAnnualMaxCapacityInvestment(r,'OIL_GEN',YEAR)$(yNoCO2(YEAR)) = 0;

** ----------------------------------------------------------------
$elseif.ph %phase%=='popol'

InputActivityRatio(r,'SPV','SUN',"1",y) = 1; #IEA convention
OutputActivityRatio(r,'SPV','ELC',"1",y) = 1; 

InputActivityRatio(r,'WPP','WIN',"1",y) = 1; #IEA convention
OutputActivityRatio(r,'WPP','ELC',"1",y) = 1; 

InputActivityRatio(r,'WTE','WST',"1",y) = 1/0.25; 
OutputActivityRatio(r,'WTE','ELC',"1",y) = 1;

InputActivityRatio(r,'BIO','WBM',"1",y) = 1/0.25;
OutputActivityRatio(r,'BIO','ELC',"1",y) = 1;

InputActivityRatio(r,'GEO','GTH',"1",y) = 1/0.25;
OutputActivityRatio(r,'GEO','ELC',"1",y) = 1;

InputActivityRatio(r,'COAL','HCO',"1",y) = 1/0.4;
OutputActivityRatio(r,'COAL','ELC',"1",y) = 1;

InputActivityRatio(r,'ROR','HYD',"1",y) = 1;
OutputActivityRatio(r,'ROR','ELC',"1",y) = 1;

InputActivityRatio(r,'ROR_MEL','HYDMEL',"1",y) = 1;
OutputActivityRatio(r,'ROR_MEL','ELC',"1",y) = 1;

InputActivityRatio(r,'OIL_GEN','OIL',"1",y) = 1/0.4;
OutputActivityRatio(r,'OIL_GEN','ELC',"1",y) = 1;

InputActivityRatio(r,'GPP','GAS',"1",y) = 1/0.55;
OutputActivityRatio(r,'GPP','ELC',"1",y) = 1;

$endif.ph
