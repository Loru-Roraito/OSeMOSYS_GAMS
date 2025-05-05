$set phase %1

** ----------------------------------------------------------------
$ifthen.ph %phase%=='sets'

set     TECHNOLOGY      /
        COAL 'Coal power plants'
        OCGT 'Open cycle gas turbines'
        CCGT 'Combined cycle gas turbines'
        CHP 'Cogeneration plants'
        ROR 'run-of-river hydroelectric power plants'
        ROM 'Run-of-melted hydroelectric power plants'
        OIL_GEN 'Oil power plants'
        BIO 'Biomass power plants'
        GEO 'Geothermal power plants'
        WTE 'Waste-to-energy power plants'
        SRE 'Crude oil refinery'
        SPV 'Solar power plants'
        WPP 'Wind power plants' /; 

set    FUEL            /
        DSL 'Diesel'
        ELC 'Electricity'
        GSL 'Gasoline'
        THE 'Thermal energy' /; 

set power_plants(TECHNOLOGY)   / COAL, OCGT, CCGT, CHP, ROR, ROM, OIL_GEN, BIO, GEO, WTE, SRE, SPV, WPP /;
set fuel_transformation(TECHNOLOGY) / SRE /;
set renewable_tech(TECHNOLOGY) / SPV, WPP, WTE, BIO, GEO, ROR, ROM /;

set secondary_carrier(FUEL) / ELC, DSL, GSL/;

** ----------------------------------------------------------------
$elseif.ph %phase%=='data'

# Characterize SOLAR technology
OperationalLife(r,'SPV') = 25;
CapacityFactor(r,'SPV','ID',y) = 0.4;
CapacityFactor(r,'SPV','IN',y) = 0;
CapacityFactor(r,'SPV','SD',y) = 0.8;
CapacityFactor(r,'SPV','SN',y) = 0;
CapacityFactor(r,'SPV','WD',y) = 0.1;
CapacityFactor(r,'SPV','WN',y) = 0;
CapitalCost(r,'SPV',yRange1) = 560;
CapitalCost(r,'SPV',yRange2) = 380;
CapitalCost(r,'SPV',yRange3) = 320;
CapitalCost(r,'SPV',yRange4) = 290;
VariableCost(r,'SPV',m,yRange1) = 1e-5;
VariableCost(r,'SPV',m,yRange2) = 1e-5;
VariableCost(r,'SPV',m,yRange3) = 1e-5;
VariableCost(r,'SPV',m,yRange4) = 1e-5;
FixedCost(r,'SPV',yRange1) = 11.3;
FixedCost(r,'SPV',yRange2) = 9.5;
FixedCost(r,'SPV',yRange3) = 8.1;
FixedCost(r,'SPV',yRange4) = 7.4;
ResidualCapacity(r,"SPV",y) = 53.981;
TotalAnnualMaxCapacityInvestment(r,'SPV',y) = 10;

# Characterize WIND technology (onshore)
OperationalLife(r,'WPP') = 25;
CapacityFactor(r,'WPP','ID',y) = 0.2;
CapacityFactor(r,'WPP','IN',y) = 0.3;
CapacityFactor(r,'WPP','SD',y) = 0.1;
CapacityFactor(r,'WPP','SN',y) = 0.15;
CapacityFactor(r,'WPP','WD',y) = 0.3;
CapacityFactor(r,'WPP','WN',y) = 0.4;
CapitalCost(r,'WPP',yRange1) = 1120;
CapitalCost(r,'WPP',yRange2) = 1040;
CapitalCost(r,'WPP',yRange3) = 980;
CapitalCost(r,'WPP',yRange4) = 960;
VariableCost(r,'WPP',m,yRange1) = 1.5;
VariableCost(r,'WPP',m,yRange2) = 1.35;
VariableCost(r,'WPP',m,yRange3) = 1.24;
VariableCost(r,'WPP',m,yRange4) = 1.22;
FixedCost(r,'WPP',yRange1) = 14;
FixedCost(r,'WPP',yRange2) = 12.6;
FixedCost(r,'WPP',yRange3) = 11.59;
FixedCost(r,'WPP',yRange4) = 11.34;
ResidualCapacity(r,"WPP",y) = 29.688;
TotalAnnualMaxCapacityInvestment(r,'WPP',y) = 10;

# Characterize WASTE-TO-ENERGY technology
OperationalLife(r,'WTE') = 25;
CapitalCost(r,'WTE',yRange1) = 2135;
CapitalCost(r,'WTE',yRange2) = 2090;
CapitalCost(r,'WTE',yRange3) = 1999;
CapitalCost(r,'WTE',yRange4) = 1917;
VariableCost(r,'WTE',m,yRange1) = 2.56;
VariableCost(r,'WTE',m,yRange2) = 2.56;
VariableCost(r,'WTE',m,yRange3) = 2.56;
VariableCost(r,'WTE',m,yRange4) = 2.56;
FixedCost(r,'WTE',yRange1) = 28.81;
FixedCost(r,'WTE',yRange2) = 24.31;
FixedCost(r,'WTE',yRange3) = 23.81;
FixedCost(r,'WTE',yRange4) = 23.31;
ResidualCapacity(r,"WTE",y) = 19.084;
TotalAnnualMaxCapacityInvestment(r,'WTE',y) = 10;

# Characterize BIOMASS technology
OperationalLife(r,'BIO') = 25;
AvailabilityFactor(r,'BIO',y) = 0.85;
CapitalCost(r,'BIO',yRange1) = 2135;
CapitalCost(r,'BIO',yRange2) = 2090;
CapitalCost(r,'BIO',yRange3) = 1999;
CapitalCost(r,'BIO',yRange4) = 1917;
VariableCost(r,'BIO',m,yRange1) = 2.56;
VariableCost(r,'BIO',m,yRange2) = 2.56;
VariableCost(r,'BIO',m,yRange3) = 2.56;
VariableCost(r,'BIO',m,yRange4) = 2.56;
FixedCost(r,'BIO',yRange1) = 28.81;
FixedCost(r,'BIO',yRange2) = 24.31;
FixedCost(r,'BIO',yRange3) = 23.81;
FixedCost(r,'BIO',yRange4) = 23.31;
ResidualCapacity(r,"BIO",y) = 80.249;
TotalAnnualMaxCapacityInvestment(r,'BIO',y) = 10;

# Characterize GEOTHERMAL technology
OperationalLife(r,'GEO') = 30;
CapitalCost(r,'GEO',yRange1) = 4970;
CapitalCost(r,'GEO',yRange2) = 4970;
CapitalCost(r,'GEO',yRange3) = 4970;
CapitalCost(r,'GEO',yRange4) = 4970;
VariableCost(r,'GEO',m,yRange1) = 0.32;
VariableCost(r,'GEO',m,yRange2) = 0.32;
VariableCost(r,'GEO',m,yRange3) = 0.32;
VariableCost(r,'GEO',m,yRange4) = 0.32;
FixedCost(r,'GEO',yRange1) = 95;
FixedCost(r,'GEO',yRange2) = 95;
FixedCost(r,'GEO',yRange3) = 92;
FixedCost(r,'GEO',yRange4) = 92;
ResidualCapacity(r,"GEO",y) = 24.736;
TotalAnnualMaxCapacityInvestment(r,'GEO',y) = 10;

# Characterize RUN-OF-RIVER technology
OperationalLife(r,'ROR') = 55;
AvailabilityFactor(r,'ROR',y) = 0.27;
CapitalCost(r,'ROR',yRange1) = 2440;
CapitalCost(r,'ROR',yRange2) = 2440;
CapitalCost(r,'ROR',yRange3) = 2440;
CapitalCost(r,'ROR',yRange4) = 2440;
VariableCost(r,'ROR',m,yRange1) = 1e-5;
VariableCost(r,'ROR',m,yRange2) = 1e-5;
VariableCost(r,'ROR',m,yRange3) = 1e-5;
VariableCost(r,'ROR',m,yRange4) = 1e-5;
FixedCost(r,'ROR',yRange1) = 210.48;
FixedCost(r,'ROR',yRange2) = 210.48;
FixedCost(r,'ROR',yRange3) = 188;
FixedCost(r,'ROR',yRange4) = 184;
ResidualCapacity(r,"ROR",y) = 173.959;
TotalAnnualMaxCapacityInvestment(r,'ROR',y) = 10;

OperationalLife(r,'ROM') = 80;
AvailabilityFactor(r,'ROM',y) = 0.27;
CapitalCost(r,'ROM',yRange1) = 2440;
CapitalCost(r,'ROM',yRange2) = 2440;
CapitalCost(r,'ROM',yRange3) = 2440;
CapitalCost(r,'ROM',yRange4) = 2440;
VariableCost(r,'ROM',m,yRange1) = 1e-5;
VariableCost(r,'ROM',m,yRange2) = 1e-5;
VariableCost(r,'ROM',m,yRange3) = 1e-5;
VariableCost(r,'ROM',m,yRange4) = 1e-5;
FixedCost(r,'ROM',yRange1) = 210.48;
FixedCost(r,'ROM',yRange2) = 210.48;
FixedCost(r,'ROM',yRange3) = 188;
FixedCost(r,'ROM',yRange4) = 184;
ResidualCapacity(r,"ROM",y) = 100;
TotalAnnualMaxCapacityInvestment(r,'ROM',y) = 10;

# Characterize COAL technology
OperationalLife(r,'COAL') = 30;
AvailabilityFactor(r,'COAL',y) = 0.8;
CapitalCost(r,'COAL',yRange1) = 1817;
CapitalCost(r,'COAL',yRange2) = 1817;
CapitalCost(r,'COAL',yRange3) = 1817;
CapitalCost(r,'COAL',yRange4) = 1817;
VariableCost(r,'COAL',m,yRange1) = 5.16;
VariableCost(r,'COAL',m,yRange2) = 4.96;
VariableCost(r,'COAL',m,yRange3) = 4.78;
VariableCost(r,'COAL',m,yRange4) = 4.6;
FixedCost(r,'COAL',yRange1) = 46.81;
FixedCost(r,'COAL',yRange2) = 44.91;
FixedCost(r,'COAL',yRange3) = 43.91;
FixedCost(r,'COAL',yRange4) = 41.91;
ResidualCapacity(r,"COAL",y) = 126.077;
TotalAnnualMaxCapacityInvestment(r,'COAL',y) = 10;

# Characterize OCGT technology
OperationalLife(r,'OCGT') = 30;
AvailabilityFactor(r,'OCGT',y) = 0.75;
CapitalCost(r,'OCGT',yRange1) = 720;
CapitalCost(r,'OCGT',yRange2) = 690;
CapitalCost(r,'OCGT',yRange3) = 660;
CapitalCost(r,'OCGT',yRange4) = 640;
VariableCost(r,'OCGT',m,yRange1) = 2.31;
VariableCost(r,'OCGT',m,yRange2) = 2.31;
VariableCost(r,'OCGT',m,yRange3) = 2.31;
VariableCost(r,'OCGT',m,yRange4) = 2.31;
FixedCost(r,'OCGT',yRange1) = 15;
FixedCost(r,'OCGT',yRange2) = 15;
FixedCost(r,'OCGT',yRange3) = 15;
FixedCost(r,'OCGT',yRange4) = 15;
ResidualCapacity(r,"OCGT",y) = 115;
TotalAnnualMaxCapacityInvestment(r,'OCGT',y) = 10;

# Characterize CCGT technology
OperationalLife(r,'CCGT') = 30;
AvailabilityFactor(r,'CCGT',y) = 0.85;
CapitalCost(r,'CCGT',yRange1) = 720;
CapitalCost(r,'CCGT',yRange2) = 690;
CapitalCost(r,'CCGT',yRange3) = 660;
CapitalCost(r,'CCGT',yRange4) = 640;
VariableCost(r,'CCGT',m,yRange1) = 2.31;
VariableCost(r,'CCGT',m,yRange2) = 2.31;
VariableCost(r,'CCGT',m,yRange3) = 2.31;
VariableCost(r,'CCGT',m,yRange4) = 2.31;
FixedCost(r,'CCGT',yRange1) = 15;
FixedCost(r,'CCGT',yRange2) = 15;
FixedCost(r,'CCGT',yRange3) = 15;
FixedCost(r,'CCGT',yRange4) = 15;
ResidualCapacity(r,"CCGT",y) = 115;
TotalAnnualMaxCapacityInvestment(r,'CCGT',y) = 10;

# Characterize COGENERATION technology
OperationalLife(r,'CHP') = 40;
AvailabilityFactor(r,'CHP',y) = 0.85;
CapitalCost(r,'CHP',y) = 2000;
VariableCost(r,'CHP',m,y) = 1e-5;
FixedCost(r,'CHP',y) = 0;
ResidualCapacity(r,"CHP",y) = 0;
TotalAnnualMaxCapacityInvestment(r,'CHP',y) = 0;

# Characterize OIL technology
OperationalLife(r,'OIL_GEN') = 40;
AvailabilityFactor(r,'OIL_GEN',y) = 0.85;
CapitalCost(r,'OIL_GEN',yRange1) = 1200;
CapitalCost(r,'OIL_GEN',yRange2) = 1200;
CapitalCost(r,'OIL_GEN',yRange3) = 1200;
CapitalCost(r,'OIL_GEN',yRange4) = 1200;
VariableCost(r,'OIL_GEN',m,yRange1) = 2.76;
VariableCost(r,'OIL_GEN',m,yRange2) = 2.76;
VariableCost(r,'OIL_GEN',m,yRange3) = 2.76;
VariableCost(r,'OIL_GEN',m,yRange4) = 2.76;
FixedCost(r,'OIL_GEN',yRange1) = 20.71;
FixedCost(r,'OIL_GEN',yRange2) = 20.71;
FixedCost(r,'OIL_GEN',yRange3) = 20.71;
FixedCost(r,'OIL_GEN',yRange4) = 20.71;
ResidualCapacity(r,"OIL_GEN",y) = 34.990;
TotalAnnualMaxCapacityInvestment(r,'OIL_GEN',y) = 10;

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

InputActivityRatio(r,'COAL','HCO',"1",y) = 1/0.45;
OutputActivityRatio(r,'COAL','ELC',"1",y) = 1;

InputActivityRatio(r,'ROR','HYD',"1",y) = 1;
OutputActivityRatio(r,'ROR','ELC',"1",y) = 1;

InputActivityRatio(r,'ROM','HYDMEL',"1",y) = 1;
OutputActivityRatio(r,'ROM','ELC',"1",y) = 1;

** open cycle gas turbines
InputActivityRatio(r,'OCGT','GAS',"1",y) = 1/0.35;
OutputActivityRatio(r,'OCGT','ELC',"1",y) = 1;

** cogeneration power plants produce electricity and heat
InputActivityRatio(r,'CHP','GAS',"1",y) = 1/0.6;
OutputActivityRatio(r,'CHP','ELC',"1",y) = 1;

** CCGT can also function as OCGT
InputActivityRatio(r,'CCGT','GAS',"1",y) = 1/0.6;
InputActivityRatio(r,'CCGT','GAS',"2",y) = 1/0.3;
OutputActivityRatio(r,'CCGT','ELC',"1",y) = 1;
OutputActivityRatio(r,'CCGT','ELC',"2",y) = 1;

** oil power plants
InputActivityRatio(r,'OIL_GEN','OIL',"1",y) = 1/0.2;
OutputActivityRatio(r,'OIL_GEN','ELC',"1",y) = 1;

$endif.ph
